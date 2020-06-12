DROP PROCEDURE perf.updateClient;
GO

CREATE PROCEDURE perf.updateClient
	@email VARCHAR(255), 
    @password VARCHAR(25) = NULL,
    @fname VARCHAR(20) = NULL,
    @lname VARCHAR(20) = NULL,
	@newsletter BIT = NULL,
	@pagamento VARCHAR(10) = NULL,
    @responseMsg nvarchar(250) output
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON

	BEGIN TRY

		IF @fname IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET fname = @fname
			WHERE email = @email
		END

		IF @lname IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET lname = @lname
			WHERE  email = @email
		END

		IF @password IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET pw = hashbytes('SHA2_512', @password)
			WHERE  email = @email
		END

		IF @newsletter IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.cliente
			SET newsletter = @newsletter
			WHERE  email = @email
		END

		IF @pagamento IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.cliente
			SET pagamento = @pagamento
			WHERE  email = @email
		END

		SET @responseMsg='Success'
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @responseMsg='Erro'
		ROLLBACK
	END CATCH
END
GO