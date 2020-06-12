DROP PROCEDURE perf.removeContact
GO

CREATE PROCEDURE perf.removeContact
    @id INT,
    @email VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM Perfumaria.perf.contacto WHERE utilizador_email=@email AND id=@id)
            BEGIN
            IF EXISTS (SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id = @id)
                SET @responseMessage='Não é possível remover o contacto default.'
            ELSE
            BEGIN
                UPDATE Perfumaria.perf.contacto
                SET visibilidade=0
                WHERE id=@id
                SET @responseMessage='Success'
                END
            END
        ELSE
            SET @responseMessage='Permition denied'
    END TRY
    BEGIN CATCH
        SET @responseMessage='ERRO' 
    END CATCH

END
GO