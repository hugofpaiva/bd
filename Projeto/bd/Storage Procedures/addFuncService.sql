DROP PROCEDURE perf.addFuncService;
GO

CREATE PROCEDURE perf.addFuncService
    @funcionario_email VARCHAR(255),
    @servico_id INT,
    @duracao_media INT,
    @emailFunc VARCHAR(255),
    @deleted BIT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.funcionario_faz_servico
                (funcionario_email, servico_id, duracao_media, deleted)
                VALUES(@funcionario_email, @servico_id, @duracao_media, @deleted) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO