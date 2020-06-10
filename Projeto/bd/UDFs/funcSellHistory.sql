DROP FUNCTION perf.funcSellHistory;
GO

CREATE FUNCTION perf.funcSellHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT datacompra, clienteemail, SUM(unidades * preco) as total, compranumero
                    FROM (((Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.compra ON compranumero=numero)JOIN Perfumaria.perf.produto ON produtoid=id) JOIN Perfumaria.perf.compra_presencial ON compra_presencial.numero=compra.numero)
                    WHERE (funcemail=@email)
                    GROUP BY datacompra, clienteemail, compranumero
                    ORDER BY datacompra DESC)
GO