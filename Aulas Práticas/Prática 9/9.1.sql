-- EXERCíCIO 9.1
DBCC FREEPROCCACHE;
DBCC DROPCLEANBUFFERS;


-- Exp1
Index: WorkOrderID (PK)
Query: select * from Production.WorkOrder

-- Exp2
Index: WorkOrderID (PK)
Query: select * from Production.WorkOrder where WorkOrderID=1234

-- Exp3
Index: WorkOrderID (PK)

Query1: SELECT * FROM Production.WorkOrder
WHERE WorkOrderID between 10000 and 10010

Query2: SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591

--Exp4
Index: WorkOrderID (PK)
Query: SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'

--Exp5
CREATE INDEX IxProductID ON Production.WorkOrder(ProductID);

Index: ProductID

Query: SELECT * FROM Production.WorkOrder WHERE ProductID = 757

--Exp6
CREATE INDEX ixWorkOrderCovering ON Production.WorkOrder (ProductID) INCLUDE (StartDate);

Index: ProductID Covered (StartDate)

Query1: SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757
Query2: SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945
Query3: SELECT WorkOrderID FROM Production.WorkOrder
WHERE ProductID = 945 AND StartDate = '2006-01-04'

--Exp7
CREATE INDEX IxStartDate ON Production.WorkOrder(StartDate);

Index: ProductID and StartDate

Query: SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'

--Exp8
CREATE INDEX IxPrIDStartDate ON Production.WorkOrder(ProductID, StartDate);

Index: Composite (ProductID, StartDate)

Query: SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'