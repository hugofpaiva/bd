drop procedure perf.changeProduct
go

GO
CREATE PROCEDURE perf.changeProduct
    @id INT,
    @preco FLOAT = 0,
    @familiaolfativa VARCHAR(30) = NULL,
    @categoria VARCHAR(30) = NULL,
    @nome VARCHAR(30)  = NULL,
    @marca VARCHAR(30)  = NULL,
    @linha VARCHAR(30)  = NULL,
    @tamanho SMALLINT = 0,
    @descricao VARCHAR(280) = NULL,
    @imagem VARCHAR(100)  = NULL,
    @stock SMALLINT = 0,
    @destinatario VARCHAR(10) = NULL,
	@deleted BIT = 0,
    @emailFunc VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON
    

        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator>0)
            BEGIN
                IF @preco <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET preco = @preco
                    WHERE id = @id
                END

                IF @familiaolfativa <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET familiaolfativa = @familiaolfativa
                    WHERE id = @id
                END

                IF @categoria <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET categoria = @categoria
                    WHERE id = @id
                END

                IF @nome <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET nome = @nome
                    WHERE id = @id
                END

                IF @marca <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET marca = @marca
                    WHERE id = @id
                END

                IF @linha <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET linha = @linha
                    WHERE id = @id
                END
                
                IF @tamanho <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET tamanho = @tamanho
                    WHERE id = @id
                END

                IF @descricao <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET descricao = @descricao
                    WHERE id = @id
                END

                IF @imagem <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET imagem = @imagem
                    WHERE id = @id
                END

                IF @stock <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET stock = @stock
                    WHERE id = @id
                END

                IF @destinatario <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET destinatario = @destinatario
                    WHERE id = @id
                END
				IF @deleted <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET deleted = @deleted
                    WHERE id = @id
                END
            END
 

END