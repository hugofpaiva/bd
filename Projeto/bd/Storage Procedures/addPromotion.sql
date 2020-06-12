DROP PROCEDURE perf.addPromotion;
GO

CREATE PROCEDURE perf.addPromotion
    @nome VARCHAR(30),
    @desconto TINYINT,
    @datainicio SMALLDATETIME,
    @datafim SMALLDATETIME,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.promocao
                (nome, desconto, datainicio, datafim)
                VALUES(@nome, @desconto, @datainicio, @datafim) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed'
    END CATCH

END
GO