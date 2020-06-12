DROP PROCEDURE perf.updateMarc;
GO


CREATE PROCEDURE perf.updateMarc
	@cliente_email VARCHAR(255),
    @idMarc INT,
    @funcionario_email VARCHAR(255),
    @dataMarc DATETIME = null,
	@responseMessage NVARCHAR(250) = 'Erro! Tente noutra hora.' OUTPUT
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
			IF EXISTS (SELECT email=@funcionario_email from Perfumaria.perf.funcionario)
			BEGIN
				
				IF (@dataMarc IS NOT NULL)
				BEGIN
					BEGIN TRY
						DECLARE @duracao INT
						SELECT @duracao=duracao_media FROM Perfumaria.perf.funcionario_faz_servico join Perfumaria.perf.marcacao on funcionario_faz_servico.servico_id=marcacao.servico_id
								WHERE marcacao.funcionario_email=@funcionario_email  
										AND marcacao.deleted = 0 
										AND marcacao.id=@idMarc
										AND funcionario_faz_servico.funcionario_email=@funcionario_email
							IF (@duracao IS NOT NULL AND @dataMarc > GETDATE()) 
							BEGIN
		 						IF (EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE (dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, @dataMarc)) AND @funcionario_email=funcionario_email) OR EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, dataMarc) AND cliente_email=@cliente_email))
									SET @responseMessage = 'Hora não disponível!'
								ELSE
								BEGIN
									UPDATE Perfumaria.perf.marcacao
									SET dataMarc=@dataMarc
									WHERE id=@idMarc
									SET @responseMessage='Marcação efetuado com sucesso!'
								END
							END
					END TRY
					BEGIN CATCH
						SET @responseMessage='Failure'
					END CATCH
				END

				
			END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @responseMessage='Failed'
		ROLLBACK
	END CATCH 
END
GO