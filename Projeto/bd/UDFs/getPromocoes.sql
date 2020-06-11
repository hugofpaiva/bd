DROP FUNCTION perf.getPromocoes;
GO

CREATE FUNCTION perf.getPromocoes () RETURNS TABLE 
AS
    RETURN (SELECT id, nome, desconto, datainicio, datafim
                    FROM Perfumaria.perf.promocao)
                    
GO