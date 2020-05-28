CREATE FUNCTION dbo.funcSellHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT datacompra, clienteemail, SUM(unidades * preco) as total, compranumero
                    FROM ((Perfumaria.dbo.compra_tem_produto JOIN Perfumaria.dbo.compra ON compra_presencial.numero=compra.numero)JOIN Perfumaria.dbo.produto ON produtoid=id)
                    WHERE (funcemail=@email)
                    GROUP BY datacompra, clienteemail, compranumero
                    ORDER BY datacompra DESC)
GO