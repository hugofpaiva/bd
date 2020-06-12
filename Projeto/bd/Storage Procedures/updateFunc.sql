DROP PROCEDURE perf.updateFunc;
GO

CREATE PROCEDURE perf.updateFunc
	@email VARCHAR(255), 
    @admin TINYINT = null,
    @salario INT = null,
    @pw VARCHAR(25) = null,
    @emailOP VARCHAR(255)=null,
    @responseMsg nvarchar(250) output
AS
BEGIN
    BEGIN TRANSACTION
	SET NOCOUNT ON

	BEGIN TRY
        IF @admin IS NOT NULL
		BEGIN
            IF EXISTS (SELECT administrator FROM Perfumaria.perf.funcionario WHERE email = @email AND administrator = 2)
            BEGIN
                UPDATE Perfumaria.perf.funcionario
                SET administrator = @admin
                WHERE  email = @emailOP
				SET @responseMsg='Success'
            END
            ELSE
                RAISERROR ('Insuficient Permissions.', 14, 1);
		END

        IF @salario IS NOT NULL
		BEGIN
            IF EXISTS (SELECT administrator FROM Perfumaria.perf.funcionario WHERE email = @email AND administrator = 2)
            BEGIN
                UPDATE Perfumaria.perf.funcionario
                SET salario = @salario
                WHERE  email = @emailOP
				SET @responseMsg='Success'
            END
            ELSE
                RAISERROR ('Insuficient Permissions.', 14, 1);
		END

        IF @pw IS NOT NULL
            BEGIN
                UPDATE Perfumaria.perf.utilizador
                SET pw = hashbytes('SHA2_512', @pw)
                WHERE  email = @email
                SET @responseMsg='Success'
            END
    COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @responseMsg='Failed'
        ROLLBACK
	END CATCH
END
GO