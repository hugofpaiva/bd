CREATE FUNCTION dbo.clientFutureMarc (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT tipo, preço, fname, lname, photo, dataMarc
                    FROM ((Perfumaria.dbo.marcacao JOIN Perfumaria.dbo.servico ON servico_id=id) JOIN Perfumaria.dbo.utilizador ON cliente_email = email)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) > 0) 
                    ORDER BY dataMarc ASC)             
GO