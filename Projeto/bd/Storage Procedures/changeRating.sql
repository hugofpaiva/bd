DROP PROCEDURE perf.changeRating
GO

CREATE PROCEDURE perf.changeRating
    @clienteemail VARCHAR(255),
    @compranum INT,
    @rating CHAR(1),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM (Perfumaria.perf.compra_online JOIN Perfumaria.perf.compra ON compra.numero=compra_online.numero) WHERE compra_online.numero=@compranum AND clienteemail=@clienteemail)
            BEGIN
                UPDATE Perfumaria.perf.compra_online
                SET rating = @rating
                WHERE numero=@compranum
                SET @responseMessage='Successo'
            END
        ELSE
            SET @responseMessage='Sem permissões!'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro' 
        ROLLBACK
    END CATCH

END
GO