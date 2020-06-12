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
        IF EXISTS(SELECT contacto_default_id, pagamento FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.cliente ON utilizador.email = cliente.email WHERE utilizador.email = @utilizador_email) 
		BEGIN
		SELECT @contacto = contacto_default_id, @pagamento = pagamento FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.cliente ON utilizador.email = cliente.email WHERE utilizador.email = @utilizador_email
        SET @result = 1
		END
        ELSE
        SET @result = 0
		
END
GO