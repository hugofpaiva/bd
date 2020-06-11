DROP TRIGGER perf.changeProductTrigger;
GO

CREATE TRIGGER perf.changeProductTrigger ON perf.[produto]
AFTER INSERT, UPDATE
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @stock as INT;
    SELECT @stock = stock FROM inserted;
    IF (@stock < 0)
    BEGIN
        RAISERROR('Stock inválido.', 16, 1);
        ROLLBACK TRAN;
    END
	IF (@stock= 0)
	BEGIN
    BEGIN TRY
		UPDATE Perfumaria.perf.produto
		SET deleted = 1
		WHERE  id = @produtoid
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível mudar o produto.', 16, 1);
        ROLLBACK TRAN
    END CATCH
	END
END