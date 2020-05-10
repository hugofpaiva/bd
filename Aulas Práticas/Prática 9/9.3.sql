-- EXERCíCIO 9.3
-- O facto de ser Clustered ou n�o iria depender muito do tipo de queries, foi considerado apenas que se costuma meter SSNs mais ou menos por ordem
-- i)
CREATE UNIQUE CLUSTERED INDEX IxSsn ON employee (Ssn);

-- ii)
CREATE INDEX IxLnameFname ON employee (Lname, Fname);

-- iii)
CREATE INDEX IxDno ON employee (Dno);

-- iv)
CREATE CLUSTERED INDEX IxEssnPno ON works_on (Essn, Pno);

-- v)
-- Depois de retirar o index da primary key
CREATE CLUSTERED INDEX IxEssn ON dependent (Essn);

--vi)
-- Depois de retirar o index da primary key
CREATE INDEX IxDnum ON project (Dnum);
