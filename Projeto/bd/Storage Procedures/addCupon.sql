GO
CREATE PROCEDURE dbo.addCupon
    @id CHAR(10),
    @datainicio SMALLDATETIME,
    @datafim SMALLDATETIME,
    @pontos_atribuidos INT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.dbo.cupao
                (id, datainicio, datafim, pontos_atribuidos)
                VALUES(@id, @datainicio, @datafim, @pontos_atribuidos) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END