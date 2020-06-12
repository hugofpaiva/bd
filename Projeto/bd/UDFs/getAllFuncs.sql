DROP FUNCTION perf.getAllFuncs;
GO

CREATE FUNCTION perf.getAllFuncs ( @emailFunc VARCHAR(255)) returns @table table (email VARCHAR(255) NOT NULL, contribuinte CHAR(9) NOT NULL, fname VARCHAR(20) NOT NULL,
                                                                                lname VARCHAR(20) NOT NULL, sexo BIT NOT NULL, dataNasc DATE NOT NULL,
                                                                                foto VARCHAR(100) NOT NULL, contacto_default_id INT,  
                                                                                administrator TINYINT NOT NULL, salario INT NOT NULL, deleted BIT NOT NULL DEFAULT 0)                                            
AS
BEGIN 
            DECLARE @email AS VARCHAR(255), @contribuinte AS CHAR(9), @fname AS VARCHAR(20),
                    @lname AS VARCHAR(20), @sexo AS BIT, @dataNasc AS DATE,
                    @foto AS VARCHAR(100), @contacto_default_id AS INT, @deleted AS BIT, 
                    @administrator AS TINYINT, @salario AS INT;
            IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
                INSERT @table SELECT utilizador.email, contribuinte, fname, lname, sexo, dataNasc, foto, contacto_default_id, administrator, salario, deleted
                            FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.funcionario ON utilizador.email=funcionario.email
            RETURN;
        END;
GO
