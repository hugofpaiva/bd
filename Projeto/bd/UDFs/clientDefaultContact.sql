DROP FUNCTION perf.clientDefaultContact;
GO

CREATE FUNCTION perf.clientDefaultContact (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT contacto_default_id as id
                    FROM (Perfumaria.perf.utilizador JOIN Perfumaria.perf.contacto ON contacto_default_id=id)
                    WHERE email=@email AND visibilidade = 1)
                    
GO
