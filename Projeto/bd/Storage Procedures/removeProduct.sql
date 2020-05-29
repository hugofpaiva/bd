GO
CREATE PROCEDURE dbo.removeProduct
    @id INT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.funcionario WHERE email=@emailFunc AND administrator>0)
            BEGIN
                UPDATE Perfumaria.dbo.produto
                SET deleted=1
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