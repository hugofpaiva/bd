CREATE SCHEMA Medicamentos;
GO

create table Medicamentos.Medico(

	NumIdentificacao int ,
	Nome varchar (50) ,
	Especialidade varchar(15)

	primary key (NumIdentificacao)
);

create table Medicamentos.Paciente(

	NumUtente int ,
	Nome varchar (50) ,
	DataNasc date ,
	Endereco varchar (20)

	primary key (NumUtente)

);

create table Medicamentos.Prescricao(

	NumUnico int ,
	PData date ,
	FarmaciaNIF char(9) ,
	ProcessoData date ,
	MedicoNumID int ,
	PacienteNumUtente int 

	primary key (NumUnico),
	foreign key (MedicoNumID) references Medicamentos.Medico(NumIdentificacao),
	foreign key (PacienteNumUtente) references Medicamentos.Paciente(NumUtente)
	

);

create table Medicamentos.Farmacia (

	NIF char(9) ,
	Endereço varchar (20) ,
	Nome varchar (50) ,
	Telefone char(9)

	primary key(NIF)

);

create table Medicamentos.Farmaceutica (

	NumRegisto varchar(10) ,
	Nome varchar (50) ,
	Endereco varchar (20) ,
	Telefone char (9)

	primary key(NumRegisto)

);

create table Medicamentos.Farmaco(
	
	FarmaceutNumReg varchar (10) ,
	Nome varchar (50) ,
	Formula varchar (15)

	primary key (Nome, FarmaceutNumReg),
	foreign key (FarmaceutNumReg) references Medicamentos.Farmaceutica(NumRegisto)

);

create table Medicamentos.TEM(

	PrescNumUnico int ,
	FarmacoNome varchar (50) ,
	FarmacoNumRegisto varchar (10)

	primary key (FarmacoNome, PrescNumUnico, FarmacoNumRegisto),
	foreign key (FarmacoNome, FarmacoNumRegisto) references Medicamentos.Farmaco(Nome, FarmaceutNumReg),
	foreign key (PrescNumUnico) references Medicamentos.Prescricao(NumUnico)
	
);

alter table Medicamentos.Prescricao add constraint Nif foreign key (FarmaciaNIF) references Medicamentos.Farmacia(NIF);

