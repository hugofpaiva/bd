-- REVER ESTA MERDA E DPS FAZER DROP DA MINHA BD

CREATE FUNCTION perf.clientFutureMarc (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT tipo, preco, fname, lname, foto, dataMarc
                    FROM ((Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=id) JOIN Perfumaria.perf.utilizador ON cliente_email = email)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) > 0) 
                    ORDER BY dataMarc ASC)              
GO