GO
CREATE PROCEDURE dbo.addNewFunc
    @email VARCHAR(255),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @pw BINARY(64),
    @sexo BIT,
    @dataNasc DATETIME,
    @foto VARCHAR(100),
    @contacto_default_id INT = NULL,
    @administrator TINYINT,
    @salario INT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.funcionario WHERE email=@emailFunc AND administrator>2)
            BEGIN
                INSERT INTO Perfumaria.dbo.utilizador
                (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id)
                VALUES(@email, @contribuinte, @fname, @lname, @pw, @sexo, @dataNasc, @foto, @contacto_default_id) 

                INSERT INTO Perfumaria.dbo.funcionario
                (email, administrator, salario)
                VALUES(@email, @administrator, @salario) 

                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END