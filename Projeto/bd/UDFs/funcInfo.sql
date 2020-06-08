DROP FUNCTION perf.getFuncInfo;
GO

CREATE FUNCTION perf.getFuncInfo (@emailFunc VARCHAR(255)) RETURNS Table 
AS
    RETURN (SELECT Perfumaria.perf.utilizador.*, Perfumaria.perf.funcionario.salario, Perfumaria.perf.funcionario.administrator
                    FROM Perfumaria.perf.utilizador
                    JOIN Perfumaria.perf.funcionario ON utilizador.email = funcionario.email
                    WHERE utilizador.email = @emailFunc) 
GO         
                
--SELECT * FROM perf.AveragePricebyItems (15.00)