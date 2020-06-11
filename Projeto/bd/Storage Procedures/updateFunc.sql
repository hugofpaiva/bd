DROP PROCEDURE perf.updateFunc;
GO

GO
CREATE PROCEDURE perf.updateFunc
	@email VARCHAR(255), 
    @admin TINYINT = null,
    @salario INT = null,
    @emailOP VARCHAR(255),
    @responseMsg nvarchar(250) output
AS
BEGIN
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

		
	END TRY
	BEGIN CATCH
		SET @responseMsg='Failed'
	END CATCH
END
go