DROP PROCEDURE perf.addNewFunc;
GO

CREATE PROCEDURE perf.addNewFunc
    @email VARCHAR(255),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @pw VARCHAR(25),
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
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.utilizador
                (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id)
                VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @pw), @sexo, @dataNasc, @foto, @contacto_default_id) 

                INSERT INTO Perfumaria.perf.funcionario
                (email, administrator, salario)
                VALUES(@email, @administrator, @salario) 

                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed'
    END CATCH

END
GO