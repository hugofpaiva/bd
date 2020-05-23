GO
CREATE PROCEDURE dbo.Login
    @email VARCHAR(255),
    @password VARCHAR(25),
    @responseMessage VARCHAR(250)='' OUTPUT,
    @type BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    IF EXISTS (SELECT TOP 1 email FROM Perfumaria.dbo.utilizador WHERE email = @email)
    BEGIN
        SET @email=(SELECT email FROM Perfumaria.dbo.utilizador
        WHERE email=@email AND pw=HASHBYTES('SHA2_512', @password))

        IF(@email IS NULL)
           SET @responseMessage='Incorrect password'
        ELSE 
        BEGIN
           SET @responseMessage='User successfully logged in'
           IF EXISTS (SELECT TOP 1 email FROM Perfumaria.dbo.funcionario WHERE email = @email)
            SET @type = 1
           ELSE
            SET @type = 0
        END
    END
    ELSE
       SET @responseMessage='Invalid login'

END


/*
DECLARE	@responseMessage nvarchar(250)

--Correct login and password
EXEC	dbo.uspLogin
		@pLoginName = N'Admin',
		@pPassword = N'123',
		@responseMessage = @responseMessage OUTPUT

SELECT	@responseMessage as N'@responseMessage'
*/
	