
GO

CREATE FUNCTION dbo.getClientInfo (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT * 
                    FROM Perfumaria.dbo.utilizador
                    JOIN Perfumaria.dbo.cliente ON utilizador.email = cliente.email
                    WHERE @email = utilizador.email) 
GO      