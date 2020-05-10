-- EXERCíCIO 9.2
ALTER TABLE mytemp DROP CONSTRAINT mytemp_pk;
DROP TABLE mytemp;

CREATE TABLE mytemp (
	rid BIGINT IDENTITY(1, 1) NOT NULL,
	at1 INT NULL,
	at2 INT NULL,
	at3 INT NULL,
	lixo varchar(100) NULL
);

-- a)
ALTER TABLE AdventureWorks2012.dbo.mytemp ADD CONSTRAINT mytemp_pk PRIMARY KEY CLUSTERED (rid);

ALTER TABLE mytemp DROP CONSTRAINT mytemp_pk;
ALTER TABLE myTemp ADD CONSTRAINT mytemp_pk PRIMARY KEY CLUSTERED (rid) WITH (FILLFACTOR = 90);


-- b)
DBCC FREEPROCCACHE;
DBCC DROPCLEANBUFFERS;

-- Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME; 
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records 
DECLARE @val as int = 1; 
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem 
BEGIN
	DBCC DROPCLEANBUFFERS;-- need to be sysadmin
	INSERT mytemp (at1, at2, at3, lixo)
	SELECT cast((RAND()*@nelem) as int),
		cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int), 'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1; 
	END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
@start_time, @end_time));


-- e)
CREATE INDEX Idx1 ON mytemp(at1);
CREATE INDEX Idx2 ON mytemp(at2);
CREATE INDEX Idx3 ON mytemp(at3);
CREATE INDEX Idx4 ON mytemp(lixo)

