DROP PROCEDURE perf.clientAddFavourite
GO

CREATE PROCEDURE perf.clientAddFavourite
    @clienteemail VARCHAR(255),
    @produtoid INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF NOT EXISTS(SELECT produtoid FROM Perfumaria.perf.clientefavorita WHERE clienteemail=@clienteemail AND produtoid=@produtoid)
            BEGIN
                INSERT INTO Perfumaria.perf.clientefavorita
                (clienteemail, produtoid)
                VALUES(@clienteemail, @produtoid) 
                SET @responseMessage='Successo'
            END
        ELSE
            SET @responseMessage='Já existe!'
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro' 
    END CATCH

END
GO