DROP PROCEDURE perf.getProductFiltersFunc;
GO

CREATE PROCEDURE perf.getProductFiltersFunc
    @deleted BIT = NULL,
    @nome VARCHAR(30) = NULL,
    @marca VARCHAR(30) = NULL,
    @categoria VARCHAR(30) = NULL,
    @destinatario VARCHAR(10) = NULL,
    @orderby VARCHAR(50) = NULL,
    @ordem VARCHAR(30) = NULL
AS
BEGIN
        SET NOCOUNT ON
        IF (@ordem = 'Ascendente')
        BEGIN
            SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE
                  nome LIKE ('%'+ISNULL(@nome, nome)+'%') AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria) 
            ORDER BY CASE WHEN @orderby='Nome' THEN nome END,
                     CASE WHEN @orderby='Marca' THEN marca END,
                     CASE WHEN @orderby='Categoria' THEN categoria END,
                     CASE WHEN @orderby='Preço' THEN preco END
        END

        ELSE IF (@ordem = 'Descendente')
        BEGIN
            SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE
                  nome LIKE ('%'+ISNULL(@nome, nome)+'%') AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria)
            ORDER BY CASE WHEN @orderby='Nome' THEN nome END DESC,
                     CASE WHEN @orderby='Marca' THEN marca END DESC,
                     CASE WHEN @orderby='Categoria' THEN categoria END DESC,
                     CASE WHEN @orderby='Preço' THEN preco END DESC
        END
            
END
GO