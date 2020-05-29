GO
CREATE PROCEDURE dbo.addCupon
    @tipo INT,
    @preco VARCHAR(30),
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.dbo.servico
                (tipo, preco)
                VALUES(@tipo, @preco) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END