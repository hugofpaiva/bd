-- A)
DROP PROCEDURE RemoveSSN;

CREATE PROC RemoveSSN @SSN char(9)
AS
	BEGIN
		IF EXISTS(SELECT Essn FROM Empresa.Works_on WHERE Essn = @SSN) 
		BEGIN
			DELETE FROM Empresa.Works_on WHERE Essn = @SSN;
			PRINT 'SSN removido com sucesso da tabela Works.on';
		END
		ELSE
			PRINT 'SSN não existe na tabela Works.on!';

		IF EXISTS(SELECT Essn FROM Empresa.Dependent WHERE Essn = @SSN) 
		BEGIN
			DELETE FROM Empresa.Dependent WHERE Essn = @SSN;
			PRINT 'SSN removido com sucesso da tabela Dependent';
		END
		ELSE
			PRINT 'SSN não existe na tabela Dependent!';

		IF EXISTS(SELECT Mgr_ssn FROM Empresa.DEPARTMENT WHERE Mgr_ssn = @SSN) 
		BEGIN
			UPDATE Empresa.DEPARTMENT
			SET Empresa.DEPARTMENT.Mgr_ssn  = null
			WHERE Mgr_ssn = @SSN
		END
		ELSE
			PRINT 'Mgr_ssn não existe na tabela DEPARTMENT!';


		IF EXISTS(SELECT Super_ssn FROM Empresa.EMPLOYEE WHERE Super_ssn = @SSN) 
		BEGIN
			UPDATE Empresa.EMPLOYEE 
			SET Empresa.EMPLOYEE.Super_ssn  = null
			WHERE Super_ssn = @SSN
		END
		ELSE
			PRINT 'Super_ssn não existe na tabela EMPLOYEE!';

		IF EXISTS(SELECT Ssn FROM Empresa.EMPLOYEE WHERE Ssn = @SSN) 
		BEGIN
			DELETE FROM Empresa.EMPLOYEE WHERE Ssn = @SSN;
			PRINT 'SSN removido com sucesso da tabela Employee';
		END
		ELSE
			PRINT 'SSN não existe na tabela Employee!';
	END

	
SELECT Ssn from Empresa.EMPLOYEE;

EXEC RemoveSSN '183623612';

-- Apagar sempre primeiro os tuplos dependentes da Ssn no Employee, e só depois o tuplo na própria tabela Employee

-- B)
DROP PROCEDURE RecGest;
CREATE PROC RecGest (@anosout CHAR(9) OUTPUT, @ssnout INT OUTPUT)
AS
	BEGIN
		SELECT * FROM (Empresa.EMPLOYEE JOIN Empresa.DEPARTMENT ON Ssn = Mgr_ssn);

		(SELECT @anosout = DATEDIFF(year,Empresa.DEPARTMENT.Mgr_start_date,getDate()), @ssnout = Empresa.DEPARTMENT.Mgr_ssn
		FROM Empresa.EMPLOYEE JOIN Empresa.DEPARTMENT ON Ssn = Mgr_ssn
		GROUP BY Empresa.DEPARTMENT.Mgr_start_date, Empresa.DEPARTMENT.Mgr_Ssn)
	END



DECLARE @anosout CHAR(9);
DECLARE @ssnout INT;
EXEC RecGest @anosout = @anosout OUTPUT, @ssnout = @ssnout OUTPUT; 
PRINT @anosout;
PRINT @ssnout;


SELECT DATEDIFF(year,Empresa.DEPARTMENT.Mgr_start_date,getDate()), Empresa.DEPARTMENT.Mgr_ssn
		FROM Empresa.EMPLOYEE JOIN Empresa.DEPARTMENT ON Ssn = Mgr_ssn
		GROUP BY Empresa.DEPARTMENT.Mgr_start_date, Empresa.DEPARTMENT.Mgr_Ssn


