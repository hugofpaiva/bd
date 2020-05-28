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
                UPDATE Perfumaria.dbo.produto
                SET preco=@preco, familiaolfativa=@familiaolfativa, categoria=@categoria, nome=@nome, marca=@marca, linha=@linha, tamanho=@tamanho, descricao=@descricao, imagem=@imagem, stock=@stock, destinatario=@destinatario
                WHERE id=@id
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END