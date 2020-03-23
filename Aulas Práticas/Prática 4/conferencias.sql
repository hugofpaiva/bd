create schema Conferencias;
GO

create table Conferencias.Instituicao(

	Nome varchar (50) ,
	Endereco varchar (20)

	primary key (Nome)

);

create table Conferencias.Pessoa(

	Email varchar (30),
	Nome varchar (50), 
	InstNome varchar (50)

	primary key (Email),
	foreign key (InstNome) references Conferencias.Instituicao(Nome)

);

create table Conferencias.Autor(

	PessoaEmail varchar (30),

	primary key (PessoaEmail),
	foreign key (PessoaEmail) references Conferencias.Pessoa(Email)

);

create table Conferencias.Participante(

	PessoaEmail varchar (30),
	Morada varchar (20), 
	DataInscricao date

	primary key (PessoaEmail),
	foreign key (PessoaEmail) references Conferencias.Pessoa(Email)

);

create table Conferencias.Estudante(

	ParticipanteEmail varchar (30),
	ComprovativoInstEnsino varchar (1000), 
	LocEletronica varchar (50)

	primary key (ParticipanteEmail),
	foreign key (ParticipanteEmail) references Conferencias.Participante(PessoaEmail)

);

create table Conferencias.NaoEstudante(

	ParticipanteEmail varchar (30),
	RefTransacao varchar (50), 

	primary key (ParticipanteEmail),
	foreign key (ParticipanteEmail) references Conferencias.Participante(PessoaEmail)

);

create table Conferencias.Artigo(

	NumRegisto varchar (10),
	Titulo varchar (50), 

	primary key (NumRegisto)

);

create table Conferencias.TEM(

	AutorEmail varchar (30),
	ArtigoNumRegisto varchar (10), 

	primary key (AutorEmail, ArtigoNumRegisto),
	foreign key (AutorEmail) references Conferencias.Autor(PessoaEmail),
	foreign key (ArtigoNumRegisto) references Conferencias.Artigo(NumRegisto)

);