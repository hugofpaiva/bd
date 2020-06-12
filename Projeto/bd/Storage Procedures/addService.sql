DROP PROCEDURE perf.addService;
GO


CREATE PROCEDURE perf.addService
    @tipo  VARCHAR(40),
    @preco FLOAT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.servico
                (tipo, preco)
                VALUES(@tipo, @preco) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed' 
        ROLLBACK
    END CATCH

END
GO