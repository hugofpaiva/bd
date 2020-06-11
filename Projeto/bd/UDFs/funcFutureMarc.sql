drop function perf.funcFutureMarc;
go

CREATE FUNCTION perf.funcFutureMarc (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT cliente_email,dataMarc, tipo, preco, fname, lname, marcacao.id
                    FROM ((Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id) JOIN Perfumaria.perf.utilizador ON cliente_email = email)
                    WHERE (funcionario_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) > 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)             
GO