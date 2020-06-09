DROP FUNCTION perf.getClientCupon;
GO

CREATE FUNCTION perf.getClientCupon (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT id, datainicio, datafim, pontos_atribuidos
                    FROM (Perfumaria.perf.cliente_usa_cupao JOIN Perfumaria.perf.cupao ON cupao_id=id)
                    WHERE cliente_email=@email
                    ORDER BY datainicio DESC OFFSET 0 ROWS)
                    
GO
