DROP FUNCTION perf.getAllServices;
GO

CREATE FUNCTION perf.getAllServices () RETURNS Table 
AS
    RETURN (SELECT id, tipo, preco
                    FROM Perfumaria.perf.servico)
                    
GO