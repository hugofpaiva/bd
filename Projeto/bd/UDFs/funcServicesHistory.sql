DROP FUNCTION perf.funcServicesHistory;
GO

CREATE FUNCTION perf.funcServicesHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, cliente_email
                    FROM (Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id)
                    WHERE (funcionario_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) < 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)             
GO