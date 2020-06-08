GO
CREATE PROCEDURE perf.addMarc
    @cliente_email VARCHAR(255),
    @servico_id INT,
    @funcionario_email VARCHAR(255),
    @dataMarc SMALLDATETIME,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY

        INSERT INTO Perfumaria.perf.marcacao
        (cliente_email, servico_id, funcionario_email, dataMarc)
        VALUES(@cliente_email, @servico_id, @funcionario_email, @dataMarc)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END


