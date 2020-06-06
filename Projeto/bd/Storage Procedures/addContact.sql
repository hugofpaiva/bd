GO
CREATE PROCEDURE perf.addContact
    @utilizador_email VARCHAR(255),
    @telemovel CHAR(9),
    @visibilidade BIT,
    @codigo_postal CHAR(8),
    @pais VARCHAR(20),
    @endereco VARCHAR(50),
    @apartamento VARCHAR(10),
    @localidade VARCHAR(20),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        INSERT INTO Perfumaria.perf.contacto
        (utilizador_email telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade)
        VALUES(@utilizador_email @telemovel, @visibilidade, @codigo_postal, @pais, @endereco, @apartamento, @localidade) 
        SET @responseMessage='Success'
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END