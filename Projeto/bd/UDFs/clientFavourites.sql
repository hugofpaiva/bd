CREATE FUNCTION perf.clientFavourites (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT nome, preco, marca, categoria, destinatario
                    FROM (Perfumaria.perf.clientefavorita JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE clienteemail=@email AND deleted = 0)
                    
GO