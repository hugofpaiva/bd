DROP TRIGGER perf.addProductTrigger;
GO

CREATE TRIGGER perf.addProductTrigger ON perf.[compra_tem_produto]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @stock as INT;
    SELECT @stock = stock FROM inserted;
    IF (@stock - @unidades < 0)
    BEGIN
        RAISERROR('Encomenda não processada. Stock insuficente.', 16, 1);
        ROLLBACK TRAN;
    END
	IF (@stock= 0)
	BEGIN
		UPDATE Perfumaria.perf.produto
		SET deleted = 1
		WHERE  id = @produtoid
	END
END