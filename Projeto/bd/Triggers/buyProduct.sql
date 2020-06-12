DROP TRIGGER perf.buyProductTrigger;
GO

CREATE TRIGGER perf.buyProductTrigger ON perf.[compra_tem_produto]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @unidades AS INT;
    DECLARE @produtoid AS INT;
    DECLARE @stock as INT;
    SELECT @unidades = unidades, @produtoid = produtoid FROM inserted;
    SELECT @stock = stock FROM Perfumaria.perf.produto WHERE id = @produtoid;
    IF (@stock - @unidades < 0)
    BEGIN
        RAISERROR('Encomenda não processada. Stock insuficente.', 16, 1);
        ROLLBACK TRAN;
    END
	IF (@stock - @unidades = 0)
	BEGIN
    BEGIN TRY
		UPDATE Perfumaria.perf.produto
		SET stock = 0, deleted = 1
		WHERE  id = @produtoid
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível atribuir os pontos', 16, 1);
        ROLLBACK TRAN
    END CATCH
	END
END
GO