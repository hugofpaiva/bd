DROP FUNCTION perf.getCupons;
GO

CREATE FUNCTION perf.getCupons () RETURNS TABLE 
AS
    RETURN (SELECT id, datainicio, datafim, pontos_atribuidos
                    FROM Perfumaria.perf.cupao)
                    
GO
