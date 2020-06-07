DROP FUNCTION perf.getClientInfo;
GO

GO
CREATE FUNCTION perf.getClientInfo (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT Perfumaria.perf.utilizador.*, Perfumaria.perf.cliente.email AS clientEmail, Perfumaria.perf.cliente.pontos, Perfumaria.perf.cliente.newsletter, Perfumaria.perf.cliente.pagamento
					FROM Perfumaria.perf.utilizador 
					JOIN Perfumaria.perf.cliente 
					ON Perfumaria.perf.utilizador.email = Perfumaria.perf.cliente.email
                    WHERE @email = utilizador.email) 
GO     