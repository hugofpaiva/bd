GO
CREATE PROCEDURE perf.addFuncService
    @funcionario_email VARCHAR(255),
    @servico_id INT,
    @duracao_media INT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.funcionario_faz_servico
                (funcionario_email, servico_id, duracao_media)
                VALUES(@funcionario_email, @servico_id, @duracao_media) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END