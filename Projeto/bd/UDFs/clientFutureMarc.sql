DROP FUNCTION perf.clientFutureMarc;
GO

CREATE FUNCTION perf.clientFutureMarc (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, preco, fname AS NomeFuncionario
                    FROM ((Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id) JOIN Perfumaria.perf.utilizador ON funcionario_email = email)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) > 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)              
GO

