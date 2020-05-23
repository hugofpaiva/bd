DROP PROCEDURE dbo.getFuncInfo;
GO

CREATE FUNCTION dbo.getFuncInfo (@email VARCHAR(255)) RETURNS Table 
AS
    RETURN (SELECT * 
                    FROM Perfumaria.dbo.utilizador
                    JOIN Perfumaria.dbo.funcionario ON utilizador.email = funcionario.email
                    WHERE @email = utilizador.email) 
GO           
                
--SELECT * FROM dbo.AveragePricebyItems (15.00)