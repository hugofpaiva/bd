CREATE FUNCTION dbo.clientFavourites (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT *
                    FROM (Perfumaria.dbo.clientefavorita JOIN Perfumaria.dbo.produto ON produtoid=id)
                    WHERE (clienteemail=@email))
                    
GO