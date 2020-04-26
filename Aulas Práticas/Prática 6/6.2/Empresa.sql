Create schema Empresa;
GO

CREATE TABLE Empresa.EMPLOYEE (
	Fname VARCHAR(15) NOT NULL,
	Minit CHAR,
	Lname VARCHAR(15) NOT NULL,
	Ssn CHAR(9) NOT NULL,
	Bdate DATE,
	Address VARCHAR(30),
	Sex CHAR,
	Salary DECIMAL(10,2),
	Super_ssn CHAR(9),
	Dno INT NOT NULL,
	PRIMARY KEY (Ssn),
);

CREATE TABLE Empresa.DEPARTMENT (
	Dname VARCHAR(15) NOT NULL,
	Dnumber INT NOT NULL,
	Mgr_ssn CHAR(9),
	Mgr_start_date DATE,
	PRIMARY KEY (Dnumber),
	UNIQUE (Dname),
);

CREATE TABLE Empresa.DEPT_LOCATIONS(
	Dnumber INT NOT NULL,
	Dlocation VARCHAR(15) NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation), 
);

CREATE TABLE Empresa.Project(
	Pname VARCHAR(15) NOT NULL,
	Pnumber INT NOT NULL,
	Plocation VARCHAR(15),
	Dnum INT NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
);

CREATE TABLE Empresa.Works_on(
	Essn CHAR(9) NOT NULL,
	Pno INT NOT NULL,
	Hours DECIMAL(3,1) NOT NULL,
	PRIMARY KEY (Essn, Pno),
);

CREATE TABLE Empresa.Dependent(
	Essn CHAR(9) NOT NULL,
	Dependent_name VARCHAR(15) NOT NULL,
	Sex CHAR,
	Bdate DATE,
	Relationship VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
);

alter table Empresa.EMPLOYEE add constraint employeeDep foreign key (Dno) references Empresa.DEPARTMENT (Dnumber);
alter table Empresa.EMPLOYEE add constraint employeeSuperSsn foreign key (Super_ssn) references Empresa.EMPLOYEE (Ssn);
alter table Empresa.DEPT_LOCATIONS add constraint deptLocDnum foreign key (Dnumber) references Empresa.DEPARTMENT (Dnumber);
alter table Empresa.Project add constraint projDnum foreign key (Dnum) references Empresa.DEPARTMENT (Dnumber);
alter table Empresa.Works_on add constraint worksProj foreign key (Pno) references Empresa.Project (Pnumber);
alter table Empresa.Works_on add constraint worksEmp foreign key (Essn) references Empresa.EMPLOYEE (Ssn);
alter table Empresa.Dependent add constraint dependentEmp foreign key (Essn) references Empresa.EMPLOYEE (Ssn);

/** Adding values to tables **/

INSERT INTO Empresa.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)VALUES('Paula','A','Sousa',183623612,'2001-08-11','Rua da FRENTE','F',1450.00,NULL,3)
INSERT INTO Empresa.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)VALUES('Carlos','D','Gomes',21312332,'2000-01-01','Rua XPTO','M',1200.00,NULL,1)
INSERT INTO Empresa.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)VALUES('Juliana','A','Amaral',321233765,'1980-08-11','Rua BZZZZ','F',1350.00,NULL,3)
INSERT INTO Empresa.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)VALUES('Maria','I','Pereira',342343434,'2001-05-01','Rua JANOTA','F',1250.00,21312332,2)
INSERT INTO Empresa.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)VALUES('Joao','G','Costa',41124234,'2001-01-01','Rua YGZ','M',1300.00,21312332,2)
INSERT INTO Empresa.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)VALUES('Ana','L','Silva',12652121,'1990-03-03','Rua ZIG ZAG','F',1400.00,21312332,2)


INSERT INTO Empresa.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Investigacao',1,21312332,'2010-08-02')
INSERT INTO Empresa.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Comercial',2,321233765,'2013-05-16')
INSERT INTO Empresa.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Logistica',3,41124234,'2013-05-16')
INSERT INTO Empresa.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Recursos Humanos',4,12652121,'2014-04-02')
INSERT INTO Empresa.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Desporto',5,NULL,NULL)


INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(21312332,'Joana Costa','F','2008-04-01','Filho')
INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(21312332,'Maria Costa','F','1990-10-05','Neto')
INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(21312332,'Rui Costa','M','2000-08-04','Neto')
INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(321233765,'Filho Lindo','M','2001-02-22','Filho')
INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(342343434,'Rosa Lima','F','2006-03-11','Filho')
INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(41124234,'Ana Sousa','F','2007-04-13','Neto')
INSERT INTO Empresa.DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(41124234,'Gaspar Pinto','M','2006-02-08','Sobrinho')


INSERT INTO Empresa.DEPT_LOCATIONS(Dnumber,Dlocation)VALUES(2,'Aveiro')
INSERT INTO Empresa.DEPT_LOCATIONS(Dnumber,Dlocation)VALUES(3,'Coimbra')


INSERT INTO Empresa.Project(Pname,Pnumber,Plocation,Dnum)VALUES('Aveiro Digital',1,'Aveiro',3)
INSERT INTO Empresa.Project(Pname,Pnumber,Plocation,Dnum)VALUES('BD Open Day',2,'Espinho',2)
INSERT INTO Empresa.Project(Pname,Pnumber,Plocation,Dnum)VALUES('Dicoogle',3,'Aveiro',3)
INSERT INTO Empresa.Project(Pname,Pnumber,Plocation,Dnum)VALUES('GOPACS',4,'Aveiro',3)


INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(183623612,1,20.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(183623612,3,10.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(21312332,1,20.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(321233765,1,25.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(342343434,1,20.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(342343434,4,25.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(41124234,2,20.0)
INSERT INTO Empresa.Works_on(Essn,Pno,Hours)VALUES(41124234,3,30.0)


/** queries AR to queries SQL **/

/** a) **/
select Ssn, Fname, Lname, Pno from (Empresa.Works_on join Empresa.EMPLOYEE on Essn=Ssn);

/** b) **/
select Emp1.Fname from (Empresa.EMPLOYEE as Emp1 join Empresa.EMPLOYEE as Emp2 on Emp1.Super_ssn=Emp2.Ssn)
where Emp2.Fname='Carlos' and Emp2.Lname='Gomes';

/** c) **/
select sum(Hours) as HorasTotais, Pname from (Empresa.Project join Empresa.Works_on on Pnumber=Pno)
group by Pname;

/** d) **/
select Fname from (Empresa.EMPLOYEE join (Empresa.Project join Empresa.Works_on on Pnumber=Pno) on Ssn=Essn )
where Hours > 20 and Dno = 3;

/** e) **/
select Fname from (Empresa.EMPLOYEE left outer join Empresa.Works_on on Ssn=Essn)
where Essn is null

/** f) **/
select Dname, avg(Salary) as SalarioMedioFeminino from (Empresa.EMPLOYEE join Empresa.DEPARTMENT on Dnumber=Dno)
where Sex='F'
group by Dname;

/** g) **/
select Fname, Lname, count(Dependent_name) as NumDeDependentes from (Empresa.EMPLOYEE join Empresa.Dependent on Ssn=Essn)
group by Fname, Lname
having count(Dependent_name) > 2;

/** h) **/
select Fname, Lname, Super_ssn, Mgr_ssn from (Empresa.EMPLOYEE join Empresa.DEPARTMENT on Ssn=Mgr_ssn)
where Super_ssn is null

/** i) **/
select Fname, Address from (((Empresa.Works_on join Empresa.EMPLOYEE on Ssn=Essn) join Empresa.Dept_locations on Dno=Dnumber)join Empresa.Project on Pno=Pnumber )
where Dlocation!='Aveiro' and Plocation='Aveiro'



