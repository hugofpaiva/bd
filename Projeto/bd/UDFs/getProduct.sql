CREATE FUNCTION perf.getProduct (@id VARCHAR(255)) RETURNS Table 
AS
    RETURN (SELECT preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, destinatario
                    FROM Perfumaria.perf.produto
                    WHERE id = @id) 
GO