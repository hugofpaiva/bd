DROP PROCEDURE perf.clientRemoveFavourite
GO

CREATE PROCEDURE perf.clientRemoveFavourite
    @clienteemail VARCHAR(255),
    @produtoid INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT produtoid FROM Perfumaria.perf.clientefavorita WHERE clienteemail=@clienteemail AND produtoid=@produtoid)
            BEGIN
                DELETE FROM Perfumaria.perf.clientefavorita
                WHERE clienteemail=@clienteemail AND produtoid=@produtoid
                SET @responseMessage='Successo'
            END
        ELSE
            SET @responseMessage='Produto não faz parte dos favoritos do utilizador!'
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro' 
    END CATCH

END
GO