DROP PROCEDURE perf.buyProduct;
GO

CREATE PROCEDURE perf.buyProduct
    @compranumero INT,
    @produtoid INT,
    @unidades INT,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO Perfumaria.perf.compra_tem_produto
        (compranumero, produtoid, unidades)
        VALUES(@compranumero, @produtoid, @unidades) 
        SET @responseMessage='Success'
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failure' 
    END CATCH

END
GO