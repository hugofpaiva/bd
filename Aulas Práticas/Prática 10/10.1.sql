-- A)
DROP PROCEDURE RemoveSSN;
GO
CREATE PROC RemoveSSN @SSN char(9)
AS
	BEGIN
		IF EXISTS(SELECT Essn FROM Empresa.Works_on WHERE Essn = @SSN) 
		BEGIN
			DELETE FROM Empresa.Works_on WHERE Essn = @SSN;
			PRINT 'SSN removido com sucesso da tabela Works.on';
		END
		ELSE
			PRINT 'SSN n�o existe na tabela Works.on!';

		IF EXISTS(SELECT Essn FROM Empresa.Dependent WHERE Essn = @SSN) 
		BEGIN
			DELETE FROM Empresa.Dependent WHERE Essn = @SSN;
			PRINT 'SSN removido com sucesso da tabela Dependent';
		END
		ELSE
			PRINT 'SSN n�o existe na tabela Dependent!';

		IF EXISTS(SELECT Mgr_ssn FROM Empresa.DEPARTMENT WHERE Mgr_ssn = @SSN) 
		BEGIN
			UPDATE Empresa.DEPARTMENT
			SET Empresa.DEPARTMENT.Mgr_ssn  = null
			WHERE Mgr_ssn = @SSN
		END
		ELSE
			PRINT 'Mgr_ssn n�o existe na tabela DEPARTMENT!';


		IF EXISTS(SELECT Super_ssn FROM Empresa.EMPLOYEE WHERE Super_ssn = @SSN) 
		BEGIN
			UPDATE Empresa.EMPLOYEE 
			SET Empresa.EMPLOYEE.Super_ssn  = null
			WHERE Super_ssn = @SSN
		END
		ELSE
			PRINT 'Super_ssn n�o existe na tabela EMPLOYEE!';

		IF EXISTS(SELECT Ssn FROM Empresa.EMPLOYEE WHERE Ssn = @SSN) 
		BEGIN
			DELETE FROM Empresa.EMPLOYEE WHERE Ssn = @SSN;
			PRINT 'SSN removido com sucesso da tabela Employee';
		END
		ELSE
			PRINT 'SSN n�o existe na tabela Employee!';
	END

	
SELECT Ssn from Empresa.EMPLOYEE;

EXEC RemoveSSN '183623612';

-- Apagar sempre primeiro os tuplos dependentes da Ssn no Employee, e s� depois o tuplo na pr�pria tabela Employee

-- B)
DROP PROCEDURE RecGest;
GO
CREATE PROC RecGest (@anosout CHAR(9) OUTPUT, @ssnout INT OUTPUT)
AS
	BEGIN
		SELECT * FROM (Empresa.EMPLOYEE JOIN Empresa.DEPARTMENT ON Ssn = Mgr_ssn);

		(SELECT TOP 1 @anosout = MAX(DATEDIFF(year,Empresa.DEPARTMENT.Mgr_start_date,getDate())), @ssnout = Empresa.DEPARTMENT.Mgr_ssn
		FROM Empresa.EMPLOYEE JOIN Empresa.DEPARTMENT ON Ssn = Mgr_ssn
		GROUP BY Empresa.DEPARTMENT.Mgr_start_date, Empresa.DEPARTMENT.Mgr_Ssn)
	END



DECLARE @anosout CHAR(9);
DECLARE @ssnout INT;
EXEC RecGest @anosout = @anosout OUTPUT, @ssnout = @ssnout OUTPUT; 
PRINT @anosout;
PRINT @ssnout;

-- C)


DROP TRIGGER Empresa.funcAvoid; 
GO
CREATE Trigger Empresa.funcAvoid ON Empresa.DEPARTMENT 
AFTER INSERT, UPDATE
AS
	SET NOCOUNT ON;
	DECLARE @mSSN CHAR(9);
	SELECT @mSSN=Mgr_ssn FROM inserted;

	IF EXISTS( SELECT Mgr_ssn FROM Empresa.DEPARTMENT WHERE Mgr_ssn=@mSSN )
	BEGIN
		RAISERROR ('J� � um manager de departamento!', 16,1);
		ROLLBACK TRAN;
	END
 GO

 -- D)
DROP TRIGGER Empresa.checkMoney;
GO
CREATE TRIGGER Empresa.checkMoney on Empresa.EMPLOYEE
AFTER INSERT, UPDATE
AS
	BEGIN
		SET NOCOUNT ON;

		DECLARE @Msalario DECIMAL(6,2)
		DECLARE @Dno INT
		DECLARE @ssn CHAR(9)
		DECLARE @salario DECIMAL(6,2)
		SELECT @Dno=Dno, @salario=Salary, @ssn=Ssn FROM inserted;

		SELECT @Msalario=Salary
		FROM Empresa.DEPARTMENT JOIN Empresa.EMPLOYEE ON Mgr_ssn=Ssn
		WHERE Dnumber=@Dno

		IF (@salario > @MSalario)
		BEGIN
			UPDATE Empresa.EMPLOYEE
			SET Salary=@MSalario - 1
			WHERE Ssn=@ssn
		END
	END
GO

-- E)
DROP FUNCTION Empresa.EProj;
GO

GO
CREATE FUNCTION Empresa.EProj (@ssn CHAR(9)) RETURNS TABLE
AS
RETURN (SELECT Pname, Plocation FROM ((Empresa.EMPLOYEE JOIN Empresa.Works_on ON Ssn = Essn) JOIN Empresa.Project ON Pno = Pnumber) WHERE Ssn = @ssn)
GO

SELECT Pname FROM Empresa.EProj('125564878');
GO

-- F)

DROP FUNCTION Empresa.Dnov;
GO

GO
CREATE FUNCTION Empresa.Dnov (@dno INT) RETURNS TABLE
AS
	BEGIN
		DECLARE @avgSalary DECIMAL(10,2);
		SET @avgSalary = SELECT(AVG(Salary) FROM Empresa.EMPLOYEE WHERE Dno=@dno);
		RETURN SELECT Fname, Lname, Ssn FROM Empresa.EMPLOYEE WHERE Dno=@dno AND Salary > @avgSalary;
	END
GO

-- G)

DROP FUNCTION Empresa.employeeDeptHighAverage
GO

GO
CREATE FUNCTION Empresa.employeeDeptHighAverage(@dno int) RETURNS @projtable TABLE (pname varchar(15), number int, plocation varchar(15), dnum int, budget decimal(10,2), totalbudget decimal(10,2))
AS
BEGIN

	DECLARE @pname as varchar(15), @number as int, @plocation as varchar(15), @dnum as int, @budget as decimal(10,2), @totalbudget as decimal(10,2);

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT Pname, Pnumber, Plocation, Dnumber, Sum(Salary*[Hours]/(40*4))
		FROM	Empresa.DEPARTMENT 
				JOIN Empresa.PROJECT ON Dnumber=Dnum
				JOIN Empresa.Works_on ON Pnumber=Pno
				JOIN Empresa.EMPLOYEE ON Essn=Ssn
		WHERE Dnumber=@dno
		GROUP BY Pname, Pnumber, Plocation, Dnumber;

	OPEN C;

	FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	SELECT @totalbudget = 0;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @projtable VALUES (@pname, @number, @plocation, @dnum, @budget, @totalbudget)
		FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	END

	CLOSE C;

	DEALLOCATE C;

	return;
END
GO

-- H)

CREATE TRIGGER Empresa.delDepInst ON Empresa.DEPARTMENT
INSTEAD OF DELETE
AS
		BEGIN
			DECLARE @Dname VARCHAR(30);
			DECLARE @Dnumber int;
			DECLARE @Mgr_ssn int;
			DECLARE @Mgr_start_date date;

			SELECT @Dname = Dname FROM deleted;
			SELECT @Dnumber = Dnumber FROM deleted;
			SELECT @Mgr_ssn = Mgr_ssn FROM deleted;
			SELECT @Mgr_start_date = Mgr_start_date FROM deleted;

			IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
				WHERE TABLE_SCHEMA = 'Empresa' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
				CREATE TABLE Empresa.DEPARTMENT_DELETED (Dname VARCHAR(30), Dnumber int, Mgr_ssn int NULL, Mgr_start_date date NULL);
			INSERT INTO Empresa.DEPARTMENT_DELETED VALUES (@Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date);
			DELETE FROM Empresa.DEPARTMENT WHERE Dnumber = @Dnumber; 
		END		

GO

CREATE TRIGGER Empresa.delDepAfter ON Empresa.DEPARTMENT
AFTER DELETE
AS
		BEGIN
			DECLARE @Dname VARCHAR(30);
			DECLARE @Dnumber int;
			DECLARE @Mgr_ssn int;
			DECLARE @Mgr_start_date date;

			SELECT @Dname = Dname FROM deleted;
			SELECT @Dnumber = Dnumber FROM deleted;
			SELECT @Mgr_ssn = Mgr_ssn FROM deleted;
			SELECT @Mgr_start_date = Mgr_start_date FROM deleted;

			IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
				WHERE TABLE_SCHEMA = 'Empresa' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
				CREATE TABLE Empresa.DEPARTMENT_DELETED (Dname VARCHAR(30), Dnumber int, Mgr_ssn int NULL, Mgr_start_date date NULL);
			INSERT INTO Empresa.DEPARTMENT_DELETED VALUES (@Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date);
			-- After logo j� n�o temos de fazer o delete
		END			

GO	

-- Devemos utilizar o tipo de trigger instead of quando sabemos que a a��o tem um elevada probabilidade de ser rolled back e pretendemos que n�o seja executada, 
--  evitando assim perdas de performance pois a a��o � logo substituida
-- Devemos utilizar o tipo de trigger after quase sabemos que a a��o tem uma baixa probabilidade de ser rolled back e pretendemos executado uma a��o ap�s a pedida ao SGBD

-- I)

--Os Stored procedures armazenam uma Batch, o que faz com que possa ser reutilizado sem ser necess�rio recompilar o c�digo. 
--� tamb�m guardado em mem�ria cache na primeira vez que s�o executados, sendo assim mais r�pida a sua utiliza��o. 
--� a melhor maneira de ter abstra��o da base de dados. 
--Tem menos probabilidade de ter erros e � mais facilmente testado. 
--Em termos de seguran�a, � uma boa pr�tica n�o dar acesso �s tabelas e apenas comunicar com Storage procedures.
--As UDFs t�m os mesmos benef�cios dos stored procedures e podem ser utilizados para incorporar l�gica complexa dentro de uma consulta. 
--S�o como as �views� mas com a op��o de ter par�metros de entrada. Basicamente, s�o usados para fun��es mais complexas.



