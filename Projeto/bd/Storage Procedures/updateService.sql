GO
CREATE PROCEDURE perf.updateService
    @id INT,
    @tipo INT,
    @preco VARCHAR(30),
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                IF @tipo <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.servico
                    SET tipo = @tipo
                    WHERE id = @id
                END

                IF @preco <> 'None'
                BEGIN
                    UPDATE Perfumaria.perf.servico
                    SET preco = @preco
                    WHERE id = @id
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