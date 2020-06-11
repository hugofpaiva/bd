DROP PROCEDURE perf.changeDefaultContact
GO

CREATE PROCEDURE perf.changeDefaultContact
    @id INT NOT NULL,
    @email VARCHAR(255) NOT NULL,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM Perfumaria.perf.contacto WHERE id=@id)
            BEGIN
            IF EXISTS (SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id IS NOT NULL)
                IF EXISTS (SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id = @id)
                BEGIN
                    UPDATE Perfumaria.perf.utilizador
                    SET contacto_default_id= NULL
                    WHERE email=@email
                    SET @responseMessage='Successo!'
                END
                ELSE
                SET @responseMessage='Não é possível adicionar um contacto default antes de remover o atual.'
            ELSE
            BEGIN
                UPDATE Perfumaria.perf.utilizador
                SET contacto_default_id = @id
                WHERE email=@email
                SET @responseMessage='Successo!'
                END
            END
        ELSE
            SET @responseMessage='Permition denied'
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        SET @responseMessage='ERRO' 
        ROLLBACK
    END CATCH

END
GO