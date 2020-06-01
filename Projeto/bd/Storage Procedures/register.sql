GO
CREATE PROCEDURE dbo.RegisterFunc
    @email VARCHAR(255),
    @password VARCHAR(25),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @sexo BIT,
    @dataNasc DATETIME,
    @foto VARCHAR(100),
    @salario INT,
    @administrator TINYINT,
    @contacto_default_id INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO Perfumaria.dbo.utilizador
        (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id)
    VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @password), @sexo, @dataNasc, @foto, @contacto_default_id)

    INSERT INTO Perfumaria.dbo.funcionario
        (email, administrator, salario)
    VALUES(@email, @administrator, @salario)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END


GO
CREATE PROCEDURE dbo.RegisterClient
    @email VARCHAR(255),
    @password VARCHAR(25),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @sexo BIT,
    @dataNasc DATETIME,
    @foto VARCHAR(100),
    @pontos INT,
    @newsletter BIT,
    @pagamento VARCHAR(10),
    @contacto_default_id INT,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO Perfumaria.dbo.utilizador
        (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id)
    VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @password), @sexo, @dataNasc, @foto, @contacto_default_id)

    INSERT INTO Perfumaria.dbo.cliente
        (email, pontos, newsletter, pagamento)
    VALUES(@email, @pontos, @newsletter, @pagamento)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END

/*DECLARE @responseMessage NVARCHAR(250)

EXEC dbo.uspAddUser
          @pLogin = N'Admin',
          @pPassword = N'123',
          @pFirstName = N'Admin',
          @pLastName = N'Administrator',
          @responseMessage=@responseMessage OUTPUT

SELECT *
FROM [dbo].[User]*/
