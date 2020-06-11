DROP TRIGGER perf.createContactTrigger;
GO

CREATE TRIGGER perf.createContactTrigger ON perf.[contacto]
AFTER INSERT
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @id AS INT;
    DECLARE @email AS VARCHAR(255); 
    SELECT @id = id, @email = utilizador_email FROM inserted;
    IF EXISTS(SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id IS NULL)
    BEGIN
    BEGIN TRY
		UPDATE Perfumaria.perf.utilizador
		SET  contacto_default_id = @id
		WHERE  email = @email
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível colocar o contacto como default', 16, 1);
        ROLLBACK TRAN
    END CATCH
	END
END