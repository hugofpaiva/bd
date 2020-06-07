GO
CREATE PROCEDURE perf.getProductsFromBuy
    @numero INT
AS
BEGIN
        SET NOCOUNT ON
        SELECT nome as Nome, preco as Preço, marca as Marca, categoria as Categoria, destinatario as Destinatário
        FROM (Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.produto ON produtoid=id)
        WHERE compranumero=@numero
END

---------------
--pronta a usar
---------------