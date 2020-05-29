GO
CREATE PROCEDURE dbo.changeProduct
    @id INT,
    @preco INT,
    @familiaolfativa VARCHAR(30) = NULL,
    @categoria VARCHAR(30),
    @nome VARCHAR(30),
    @marca VARCHAR(30),
    @linha VARCHAR(30),
    @tamanho SMALLINT = NULL,
    @descricao VARCHAR(280) = NULL,
    @imagem VARCHAR(100),
    @stock SMALLINT,
    @destinatario VARCHAR(10) = NULL,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.funcionario WHERE email=@emailFunc AND administrator>0)
            BEGIN
                IF @preco <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET preco = @preco
                    WHERE id = @id
                END

                IF @familiaolfativa <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET familiaolfativa = @familiaolfativa
                    WHERE id = @id
                END

                IF @categoria <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET categoria = @categoria
                    WHERE id = @id
                END

                IF @nome <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET nome = @nome
                    WHERE id = @id
                END

                IF @marca <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET marca = @marca
                    WHERE id = @id
                END

                IF @linha <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET linha = @linha
                    WHERE id = @id
                END
                
                IF @tamanho <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET tamanho = @tamanho
                    WHERE id = @id
                END

                IF @descricao <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET descricao = @descricao
                    WHERE id = @id
                END

                IF @imagem <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET imagem = @imagem
                    WHERE id = @id
                END

                IF @stock <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET stock = @stock
                    WHERE id = @id
                END

                IF @destinatario <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.produto
                    SET destinatario = @destinatario
                    WHERE id = @id
                END

                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END