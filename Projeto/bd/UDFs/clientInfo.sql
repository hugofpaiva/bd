
GO

CREATE FUNCTION perf.getClientInfo (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT * 
                    FROM Perfumaria.perf.utilizador
                    JOIN Perfumaria.perf.cliente ON utilizador.email = cliente.email
                    WHERE @email = utilizador.email) 
GO      