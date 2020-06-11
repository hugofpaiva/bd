CREATE PROCEDURE perf.getDetailsFromSell
    @numero INT
AS
BEGIN
    SELECT clienteemail, pagamento, compra.contribuinte, compra.numero, compra.datacompra
    FROM (((Perfumaria.perf.compra JOIN Perfumaria.perf.compra_presencial ON compra.numero=compra_presencial.numero) JOIN Perfumaria.perf.funcionario ON funcemail=email) JOIN Perfumaria.perf.utilizador ON funcionario.email=utilizador.email)
    WHERE compra.numero=@numero
END
GO

---------------
--pronta a usar
---------------