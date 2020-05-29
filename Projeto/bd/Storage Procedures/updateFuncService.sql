GO
CREATE PROCEDURE dbo.updateFuncService
    @funcionario_email VARCHAR(255), -- pessoa sobre a qual a ação vai ser feita
    @servico_id INT,
    @duracao_media INT,
    @emailFunc VARCHAR(255), -- pessoa que está a tentar mudar
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.dbo.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                IF @funcionario_email <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.funcionario_faz_servico
                    SET funcionario_email = @funcionario_email
                    WHERE servico_id = @servico_id
                END

                IF @duracao_media <> 'None'
                BEGIN
                    UPDATE Perfumaria.dbo.funcionario_faz_servico
                    SET duracao_media = @duracao_media
                    WHERE servico_id = @servico_id
                END

                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END