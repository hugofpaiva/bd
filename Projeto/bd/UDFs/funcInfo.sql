DROP PROCEDURE perf.getFuncInfo;
GO

CREATE FUNCTION perf.getFuncInfo (@email VARCHAR(255)) RETURNS Table 
AS
    RETURN (SELECT * 
                    FROM Perfumaria.perf.utilizador
                    JOIN Perfumaria.perf.funcionario ON utilizador.email = funcionario.email
                    WHERE @email = utilizador.email) 
GO           
                
--SELECT * FROM perf.AveragePricebyItems (15.00)