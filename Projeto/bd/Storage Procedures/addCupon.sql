DROP PROCEDURE perf.addCupon;
GO

CREATE PROCEDURE perf.addCupon
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
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                IF EXISTS(SELECT id FROM Perfumaria.perf.cupao WHERE id=@id)
                    SET @responseMessage = 'Id do cupão já existe'
                ELSE
                BEGIN
                    INSERT INTO Perfumaria.perf.cupao
                    (id, datainicio, datafim, pontos_atribuidos)
                    VALUES(@id, @datainicio, @datafim, @pontos_atribuidos) 
                    SET @responseMessage='Success'
                END
            END
        ELSE
            SET @responseMessage='Permition denied'

    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed'
    END CATCH

END
GO
