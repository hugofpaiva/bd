GO
CREATE PROCEDURE dbo.clientUsesCupon
    @cliente_email VARCHAR(255),
    @cupao_id CHAR(10),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.cliente WHERE email=@cliente_email) AND EXISTS(SELECT id FROM Perfumaria.dbo.cupao WHERE id=@cupao_id)
            BEGIN
                INSERT INTO Perfumaria.dbo.cliente_usa_cupao
                (cliente_email, cupao_id)
                VALUES(@cliente_email, @cupao_id) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Failed'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END