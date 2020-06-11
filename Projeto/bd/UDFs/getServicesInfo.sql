DROP FUNCTION perf.getServicesType;
GO

CREATE FUNCTION perf.getServicesType () RETURNS Table 
AS
    RETURN (SELECT id, tipo, preco
                    FROM Perfumaria.perf.servico
                    WHERE deleted = 0) 
GO