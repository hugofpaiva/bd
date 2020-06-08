GO
CREATE PROCEDURE perf.getDetailsFromBuy
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
        IF (ordem = 'Ascendente')
        BEGIN
            SELECT nome, marca, categoria, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE stock > 0 AND
                  deleted = 0 AND
                  nome = ISNULL(@nome, nome) AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria) AND 
	              destinatario = ISNULL(@destinatario,destinatario)
            ORDER BY CASE WHEN @orderby='nome' THEN nome END,
                     CASE WHEN @orderby='marca' THEN marca END,
                     CASE WHEN @orderby='categoria' THEN categoria END
        END

        ELSE IF (ordem = 'Descendente')
        BEGIN
            SELECT nome, marca, categoria, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE stock > 0 AND
                  deleted = 0 AND
                  nome = ISNULL(@nome, nome) AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria) AND 
	              destinatario = ISNULL(@destinatario,destinatario)
            ORDER BY CASE WHEN @orderby='nome' THEN nome END DESC,
                     CASE WHEN @orderby='marca' THEN marca END DESC,
                     CASE WHEN @orderby='categoria' THEN categoria END DESC
        END
            
END

---------------
--pronta a usar
---------------