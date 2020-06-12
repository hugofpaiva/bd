DROP FUNCTION perf.clientContacts;
GO

CREATE FUNCTION perf.clientContacts (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT id, telemovel, codigo_postal, pais, endereco, apartamento, localidade
                    FROM Perfumaria.perf.contacto
                    WHERE utilizador_email=@email AND visibilidade = 1
                    ORDER BY id ASC OFFSET 0 ROWS)             
GO