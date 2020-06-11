DROP TRIGGER perf.useCuponTrigger;
GO

CREATE TRIGGER perf.useCuponTrigger ON perf.[cliente_usa_cupao]
AFTER INSERT
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @cupao as CHAR(10);
    DECLARE @email as VARCHAR(255);
    DECLARE @pontos as INT;
    SELECT @cupao = cupao_id, @email = cliente_email FROM inserted;
    SELECT @pontos = pontos_atribuidos FROM Perfumaria.perf.cupao WHERE id = @cupao;
    BEGIN TRY
        UPDATE perf.cliente
        SET pontos += @pontos
        WHERE email = @email
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível atribuir os pontos', 16, 1);
		ROLLBACK TRAN
    END CATCH

END