CREATE FUNCTION perf.clientBuyHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT datacompra, clienteemail, SUM(unidades * preco) as total, compranumero
                    FROM ((Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.compra ON compra_presencial.numero=compra.numero)JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE (clienteemail=@email)
                    GROUP BY datacompra, clienteemail, compranumero
                    ORDER BY datacompra DESC)
GO