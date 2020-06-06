GO
CREATE PROCEDURE dbo.clientAddFavourite
    @clienteemail VARCHAR(255),
    @produtoid INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF NOT EXISTS(SELECT produtoid FROM Perfumaria.dbo.clientefavorita WHERE clienteemail=@clienteemail)
            BEGIN
                INSERT INTO Perfumaria.dbo.clientefavorita
                (clienteemail, produtoid)
                VALUES(@clienteemail, @produtoid) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Already exists'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END