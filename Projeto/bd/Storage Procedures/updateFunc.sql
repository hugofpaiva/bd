DROP PROCEDURE perf.updateFunc;
GO

GO
CREATE PROCEDURE perf.updateFunc
	@email VARCHAR(255), 
    @password VARCHAR(25), 
    @fname VARCHAR(20),
    @lname VARCHAR(20),
	@photo VARCHAR(100),
    @admin TINYINT,
    @salario INT,
    @emailOP VARCHAR(255) = NULL, -- Só introduzido na parte de gerir funcionários de admin = 2
    @responseMsg nvarchar(250) output
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY

		IF @fname <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET fname = @fname
			WHERE email = @email
		END

		IF @lname <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET lname = @lname
			WHERE  email = @email
		END

		IF @password <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET pw = hashbytes('SHA2_512', @password)
			WHERE  email = @email
		END

		IF @photo <> 'None'
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET foto = @photo
			WHERE  email = @email
		END

        IF @admin <> 'None'
		BEGIN
            IF EXISTS (SELECT administrator FROM Perfumaria.perf.funcionario WHERE email = @email AND administrator = 2)
            BEGIN
                UPDATE Perfumaria.perf.funcionario
                SET administrator = @admin
                WHERE  email = @emailOP
            END
            ELSE
                RAISERROR ('Insuficient Permissions.', 14, 1);
		END

        IF @salario <> 'None'
		BEGIN
            IF EXISTS (SELECT administrator FROM Perfumaria.perf.funcionario WHERE email = @email AND administrator = 2)
            BEGIN
                UPDATE Perfumaria.perf.funcionario
                SET salario = @salario
                WHERE  email = @emailOP
            END
            ELSE
                RAISERROR ('Insuficient Permissions.', 14, 1);
		END

		SET @responseMsg='Success'
	END TRY
	BEGIN CATCH
		SET @responseMsg=error_message()
	END CATCH
END
go