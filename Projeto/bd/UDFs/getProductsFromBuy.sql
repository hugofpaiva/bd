DROP FUNCTION perf.getProductsFromBuy;
GO

CREATE FUNCTION perf.getProductsFromBuy (@numero INT) RETURNS Table 
AS
    RETURN (SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted, unidades
                    FROM Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.produto ON produtoid=id
                    WHERE compranumero = @numero) 
GO