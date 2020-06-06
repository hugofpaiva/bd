DROP PROCEDURE perf.updateMarc;
GO

GO
CREATE PROCEDURE perf.updateMarc
    @idMarc INT,
	@cliente_email VARCHAR(255),
    @servico_id INT,
    @funcionario_email VARCHAR(255), -- Se for admin = 2 passa o mail do funcionário da marcação, caso contrário passa o email do funcionários logado na plataforma
    @dataMarc DATETIME,
    @responseMsg nvarchar(250) output
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY

		IF @cliente_email <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.marcacao
			SET cliente_email = @cliente_email
			WHERE  id = @idMarc 
		END

		IF @servico_id <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.marcacao
			SET servico_id = @servico_id
			WHERE  id = @idMarc 
		END

		IF @funcionario_email <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.marcacao
			SET funcionario_email = @funcionario_email
			WHERE   id = @idMarc 
		END

		IF @photo <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.marcacao
			SET dataMarc = @dataMarc
			WHERE  id = @idMarc
		END

		SET @responseMsg='Success'
	END TRY
	BEGIN CATCH
		SET @responseMsg=error_message()
	END CATCH
END
go