CREATE FUNCTION perf.getProductsFromBuy (@numero INT) RETURNS Table 
AS
    RETURN (SELECT nome as Nome, preco as Preço, marca as Marca, categoria as Categoria, unidades as Unidades
                    FROM Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.produto ON produtoid=id
                    WHERE compranumero = @numero) 
GO


---------------
--pronta a usar
---------------