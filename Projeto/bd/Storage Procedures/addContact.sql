DROP PROCEDURE perf.addContact;
GO

CREATE PROCEDURE perf.addContact
    @utilizador_email VARCHAR(255),
    @telemovel CHAR(9),
    @codigo_postal CHAR(8),
    @pais VARCHAR(20),
    @endereco VARCHAR(50),
    @apartamento VARCHAR(10) = NULL,
    @localidade VARCHAR(20),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO Perfumaria.perf.contacto
        (utilizador_email, telemovel, codigo_postal, pais, endereco, apartamento, localidade)
        VALUES(@utilizador_email, @telemovel, @codigo_postal, @pais, @endereco, @apartamento, @localidade) 
        SET @responseMessage='Success'
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro'
        ROLLBACK
    END CATCH

END
GO