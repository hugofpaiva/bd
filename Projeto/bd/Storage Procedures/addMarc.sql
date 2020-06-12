DROP PROCEDURE perf.addMarc;
GO


CREATE PROCEDURE perf.addMarc
    @cliente_email VARCHAR(255),
    @servico_id INT,
    @funcionario_email VARCHAR(255),
    @dataMarc SMALLDATETIME,
    @responseMessage VARCHAR(250) = 'Erro! Tente noutra hora.' OUTPUT
AS
BEGIN
	BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY	
		DECLARE @duracao INT
		SELECT @duracao = duracao_media FROM Perfumaria.perf.funcionario_faz_servico WHERE funcionario_email=@funcionario_email AND deleted = 0 AND  servico_id = @servico_id
			IF (@duracao IS NOT NULL AND @dataMarc > GETDATE()) 
			BEGIN
				IF (EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE (dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, @dataMarc)) AND funcionario_email=@funcionario_email AND deleted=0) OR EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, @dataMarc) AND cliente_email=@cliente_email AND deleted=0))
                SET @responseMessage = 'Hora não disponível!'
                ELSE
                BEGIN
				INSERT INTO Perfumaria.perf.marcacao
				(cliente_email, servico_id, funcionario_email, dataMarc)
				VALUES(@cliente_email, @servico_id, @funcionario_email, @dataMarc)

				SET @responseMessage='Marcação efetuado com sucesso!'
				END
			END
			COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failure'
		ROLLBACK
    END CATCH
	

END
GO