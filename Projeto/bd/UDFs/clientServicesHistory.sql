CREATE FUNCTION dbo.clientServicesHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, funcionario_email
                    FROM (Perfumaria.dbo.marcacao JOIN Perfumaria.dbo.servico ON servico_id=id)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) < 0) 
                    ORDER BY dataMarc ASC)             
GO