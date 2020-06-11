DROP FUNCTION perf.getFuncService;
GO

CREATE FUNCTION perf.getFuncService (@servico_id INT) RETURNS Table 
AS
    RETURN (SELECT fname, lname, funcionario_email
                    FROM Perfumaria.perf.funcionario_faz_servico JOIN Perfumaria.perf.utilizador ON email = funcionario_email
                    WHERE funcionario_faz_servico.deleted = 0 AND servico_id = @servico_id AND utilizador.deleted = 0) 
GO