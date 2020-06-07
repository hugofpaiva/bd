CREATE FUNCTION perf.clientBuyHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT datacompra, SUM(unidades * preco) as total, compranumero
                    FROM ((Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.compra ON compra_tem_produto.compranumero=compra.numero) JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE (clienteemail=@email)
                    GROUP BY datacompra, clienteemail, compranumero
                    ORDER BY datacompra DESC OFFSET 0 ROWS)
GO 