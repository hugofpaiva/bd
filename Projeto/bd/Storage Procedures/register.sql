DROP PROCEDURE perf.RegisterFunc
GO

GO
CREATE PROCEDURE perf.RegisterFunc
    @email VARCHAR(255),
    @password VARCHAR(25),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @sexo BIT,
    @dataNasc DATE,
    @foto VARCHAR(100),
    @salario INT,
    @administrator TINYINT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO Perfumaria.perf.utilizador
        (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto)
    VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @password), @sexo, @dataNasc, @foto)

    INSERT INTO Perfumaria.perf.funcionario
        (email, administrator, salario)
    VALUES(@email, @administrator, @salario)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END

DROP PROCEDURE perf.RegisterClient
GO

GO
CREATE PROCEDURE perf.RegisterClient
    @email VARCHAR(255),
    @password VARCHAR(25),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @sexo BIT,
    @dataNasc DATE,
    @foto VARCHAR(100),
    @pontos INT = 0,
    @newsletter BIT,
    @pagamento VARCHAR(10) = null,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO Perfumaria.perf.utilizador
        (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto)
    VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @password), @sexo, @dataNasc, @foto)

    INSERT INTO Perfumaria.perf.cliente
        (email, pontos, newsletter, pagamento)
    VALUES(@email, @pontos, @newsletter, @pagamento)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO

/*DECLARE @responseMessage NVARCHAR(250)

EXEC perf.uspAddUser
          @pLogin = N'Admin',
          @pPassword = N'123',
          @pFirstName = N'Admin',
          @pLastName = N'Administrator',
          @responseMessage=@responseMessage OUTPUT

SELECT *
FROM [perf].[User]*/
