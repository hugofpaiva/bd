DROP FUNCTION perf.getServiceFuncs;
GO

CREATE FUNCTION perf.getServiceFuncs (@id INT) RETURNS Table 
AS
    RETURN (SELECT fname, lname, email, funcionario_faz_servico.deleted
                    FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.funcionario_faz_servico ON email=funcionario_email
                    WHERE servico_id=@id) 
GO