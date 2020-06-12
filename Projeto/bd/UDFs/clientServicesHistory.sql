DROP FUNCTION perf.clientServicesHistory;
GO

CREATE FUNCTION perf.clientServicesHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, servico.preco
                    FROM (Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) < 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)             
GO