DROP PROCEDURE perf.Login;
GO


CREATE PROCEDURE perf.Login
    @email VARCHAR(255),
    @password VARCHAR(25),
    @responseMessage VARCHAR(250)='' OUTPUT,
    @type BIT=0 OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    IF EXISTS (SELECT TOP 1 email FROM Perfumaria.perf.utilizador WHERE email = @email)
    BEGIN
        SET @email=(SELECT email FROM Perfumaria.perf.utilizador
        WHERE email=@email AND pw=HASHBYTES('SHA2_512', @password))

        IF(@email IS NULL)
        BEGIN
            SET @type=0
            SET @responseMessage='Incorrect password'
        END
        ELSE 
        BEGIN
           SET @responseMessage='User successfully logged in'
           IF EXISTS (SELECT TOP 1 email FROM Perfumaria.perf.funcionario WHERE email = @email)
            SET @type = 1
           ELSE
            SET @type = 0
        END
    END
    ELSE
        BEGIN
		    SET @type=0
		    SET @responseMessage='Invalid login'
        END

END
GO
