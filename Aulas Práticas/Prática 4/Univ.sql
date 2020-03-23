create schema Univ;
GO

create table Univ.Professor(

	NMEC varchar(6) ,
	DataNasc date ,
	Nome varchar(50) ,
	CatProfissional varchar(10) ,
	AreaCient varchar (10) , 
	DepNome varchar(50) ,
	PrecentagemDedicacao float ,

	primary key (NMEC),

);

create table Univ.Departamento(

	Nome varchar(50) ,
	Localizacao varchar (20) ,
	ProfNMEC varchar(6)

	primary key (Nome),
	foreign key (ProfNMEC) references Univ.Professor(NMEC)

);

create table Univ.EstudanteGraduado(

	NMEC varchar(6) ,
	DataNasc date ,
	GrauFormacao varchar (10),
	Nome varchar(50) ,
	DepNome varchar(50) ,
	AconcelhaNMEC varchar(6) ,

	primary key (NMEC),
	foreign key (DepNome) references Univ.Departamento(Nome)

);

create table Univ.ProjetoInvestigacao(

	ID int ,
	DataInicio date ,
	DataFim date ,
	Nome varchar(50) ,
	Orcamento varchar (1000) ,
	EntFinanciadora varchar(50) ,
	ProfNMEC varchar(6),

	primary key (ID),
	foreign key (ProfNMEC) references Univ.Professor(NMEC)

);


create table Univ.ProfParticipa(

	ProfNMEC varchar(6) ,
	ProjetoID int,

	primary key (ProfNMEC, ProjetoID),
	foreign key (ProfNMEC) references Univ.Professor(NMEC),
	foreign key (ProjetoID) references Univ.ProjetoInvestigacao(ID)

);

create table Univ.AlunoParticipa(

	ProjetoID int,
	EstudanteNMEC varchar (6),
	ProfNMEC varchar (6)

	primary key (ProjetoID, EstudanteNMEC),
	foreign key (ProjetoID) references Univ.ProjetoInvestigacao(ID),
	foreign key (EstudanteNMEC) references Univ.EstudanteGraduado(NMEC),
	foreign key (ProfNMEC) references Univ.Professor(NMEC)

);

alter table Univ.Professor add constraint DepNome foreign key (DepNome) references Univ.Departamento(Nome);




