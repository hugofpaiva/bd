CREATE PROCEDURE perf.getDetailsFromBuy
    @numero INT
AS
BEGIN
        SET NOCOUNT ON
            IF EXISTS(SELECT numero FROM Perfumaria.perf.compra_online WHERE numero=@numero)
                BEGIN
                    SELECT pagamento, contribuinte, rating, rastreamento, presente, observacao, telemovel, codigo_postal, endereco, pontosgastos, pontosacumulados, compra.numero, compra.datacompra
                    FROM ((Perfumaria.perf.compra JOIN Perfumaria.perf.compra_online ON compra.numero=compra_online.numero) JOIN Perfumaria.perf.contacto ON contactoid=id)
                    WHERE compra.numero=@numero
                END
            ELSE IF EXISTS(SELECT numero FROM Perfumaria.perf.compra_presencial WHERE numero=@numero)
                BEGIN
                    SELECT pagamento, compra.contribuinte, fname, compra.numero, compra.datacompra
                    FROM (((Perfumaria.perf.compra JOIN Perfumaria.perf.compra_presencial ON compra.numero=compra_presencial.numero) JOIN Perfumaria.perf.funcionario ON funcemail=email) JOIN Perfumaria.perf.utilizador ON funcionario.email=utilizador.email)
                    WHERE compra.numero=@numero
                END
END
GO
