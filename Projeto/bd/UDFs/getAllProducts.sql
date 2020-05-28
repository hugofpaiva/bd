CREATE FUNCTION dbo.getAllProducts () RETURNS @table TABLE ()
    AS
        BEGIN 
            INSERT @table SELECT Ite_Description, Ite_Price
            FROM Items WHERE Ite_Price > @price;
            RETURN;
        END;
GO
