DROP PROCEDURE perf.verifyPaymentContact
GO

CREATE PROCEDURE perf.verifyPaymentContact
    @utilizador_email VARCHAR(255),
    @contacto INT OUTPUT,
    @pagamento VARCHAR(10) OUTPUT,
    @result BIT = 0 OUTPUT
AS
BEGIN
    SET NOCOUNT ON
        IF EXISTS(SELECT @contacto=contacto_default_id, @pagamento=pagamento FROM perf.clientInfo(@utilizador_email)) 
        SET @result = 1
END
GO