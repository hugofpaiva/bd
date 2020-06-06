GO
CREATE PROCEDURE perf.addContact
    @contribuinte CHAR(9),
    @datacompra DATETIME,
    @pagamento VARCHAR(10),
    @clienteemail VARCHAR(255),
    @pontosgastos INT = NULL,
    @pontosacumulados INT = NULL,
    @compranumero INT,
    @produtoid INT,
    @unidades INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    
    BEGIN TRY
        INSERT INTO Perfumaria.perf.compra
        (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados)
        VALUES(@contribuinte, @datacompra, @pagamento, @clienteemail, @pontosgastos, @pontosacumulados) 

        INSERT INTO Perfumaria.perf.compra_tem_produto
        (compranumero, produtoid, unidades)
        VALUES(@compranumero, @produtoid, @unidades) 

        SET @responseMessage='Success'
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END