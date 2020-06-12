DROP PROCEDURE perf.newBuy;
GO

CREATE PROCEDURE perf.newBuy
    @contribuinte CHAR(9),
    @pagamento VARCHAR(10),
    @clienteemail VARCHAR(255),
    @contacto INT,
    @presente BIT,
    @pontosgastos INT = NULL,
    @pontosacumulados INT = NULL,
    @compra INT OUTPUT,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO Perfumaria.perf.compra
        (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados)
        VALUES(@contribuinte, GETDATE(), @pagamento, @clienteemail, @pontosgastos, @pontosacumulados)

        SELECT @compra = numero FROM Perfumaria.perf.compra WHERE numero = @@Identity

        INSERT INTO Perfumaria.perf.compra_online
        (numero, presente, contactoid)
        VALUES(@compra, @presente, @contacto)
        
        SET @responseMessage='Success'
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failure'
        ROLLBACK
    END CATCH

END
GO