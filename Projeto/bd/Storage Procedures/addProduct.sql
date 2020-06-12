DROP PROCEDURE perf.addProduct;
GO

CREATE PROCEDURE perf.addProduct
    @preco FLOAT,
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
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator>0)
            BEGIN
                INSERT INTO Perfumaria.perf.produto
                (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario)
                VALUES(@preco, @familiaolfativa, @categoria, @nome, @marca, @linha, @tamanho, @descricao, @imagem, @stock, @destinatario) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
        ROLLBACK
    END CATCH

END
GO