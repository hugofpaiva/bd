CREATE FUNCTION perf.clientFavourites (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT *
                    FROM (Perfumaria.perf.clientefavorita JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE (clienteemail=@email))
                    
GO