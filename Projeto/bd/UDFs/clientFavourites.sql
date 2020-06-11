DROP FUNCTION perf.clientFavourites
GO

CREATE FUNCTION perf.clientFavourites (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario
                    FROM (Perfumaria.perf.clientefavorita JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE clienteemail=@email AND deleted = 0)
                    
GO