CREATE FUNCTION dbo.getAllProducts () RETURNS @table TABLE (preco INT NOT NULL, familiaolfativa VARCHAR(30), categoria VARCHAR(30) NOT NULL,
                                                            nome VARCHAR(30) NOT NULL, marca VARCHAR(30) NOT NULL, linha VARCHAR(30) NOT NULL,
                                                            tamanho SMALLINT, descricao VARCHAR(280), imagem VARCHAR(100) NOT NULL,
                                                            stock SMALLINT NOT NULL, destinatario VARCHAR(10))
                                                        
    AS
        BEGIN 
            DECLARE @preco AS INT, @familiaolfativa AS VARCHAR(30), @categoria AS VARCHAR(30),@nome AS VARCHAR(30), @marca AS VARCHAR(30),
            @linha AS VARCHAR(30), @tamanho AS SMALLINT, @descricao AS VARCHAR(280), @imagem AS VARCHAR(100),
            @stock AS SMALLINT, @destinatario AS VARCHAR(10);
            
            INSERT @table SELECT preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario
                            FROM Perfumaria.dbo.produto
            RETURN;
        END;
GO
