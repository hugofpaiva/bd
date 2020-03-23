CREATE SCHEMA rentacar;
GO

CREATE TABLE rentacar.Cliente(
	NIF					CHAR(9)		NOT NULL		PRIMARY KEY,
	endereco			VARCHAR(35),
	nome				VARCHAR(35),
	num_carta			INT		UNIQUE
);

CREATE TABLE rentacar.Aluguer(
	numero				INT			NOT NULL	PRIMARY KEY,	
	duracao				TIME,
	data				DATETIME,
	NIF_Cliente			CHAR(9)	REFERENCES rentacar.Cliente(NIF),	
	matricula_Veiculo	CHAR(8),
	numero_balcao		INT			
);

CREATE TABLE rentacar.Balcao(
	numero				INT		NOT NULL	PRIMARY KEY,
	nome				VARCHAR(35),
	endereco			VARCHAR(35)
);

CREATE TABLE rentacar.Veiculo(
	matricula			CHAR(8)		NOT NULL		PRIMARY KEY,
	marca				VARCHAR(20),
	ano					CHAR(4),
	codigo_Tipo_Veiculo		INT
);

CREATE TABLE rentacar.Tipo_Veiculo(
	codigo				INT			NOT NULL		PRIMARY KEY,
	arcondicionado		BIT,
	designacao			VARCHAR(50)
);

CREATE TABLE rentacar.Ligeiro(
	codigo_Tipo_Veiculo		INT		NOT NULL		PRIMARY	KEY		REFERENCES rentacar.Tipo_Veiculo(codigo),
	numlugares			TINYINT,
	portas				TINYINT,
	combustivel			VARCHAR(20)
);

CREATE TABLE rentacar.Pesado(
	codigo_Tipo_Veiculo		INT		NOT NULL		PRIMARY	KEY		REFERENCES rentacar.Tipo_Veiculo(codigo),
	peso				SMALLINT,
	passageiros			SMALLINT
);

CREATE TABLE rentacar.Similaridade(
	codigo_Tipo_Veiculo_A		INT		NOT NULL		REFERENCES rentacar.Tipo_Veiculo(codigo),
	codigo_Tipo_Veiculo_B		INT		NOT NULL		REFERENCES rentacar.Tipo_Veiculo(codigo),
	PRIMARY KEY(codigo_Tipo_Veiculo_A, codigo_Tipo_Veiculo_B)
);

ALTER TABLE rentacar.Aluguer  ADD FOREIGN KEY (numero_balcao) REFERENCES rentacar.Balcao(numero);
ALTER TABLE rentacar.Aluguer  ADD FOREIGN KEY (matricula_veiculo) REFERENCES rentacar.Veiculo(matricula);
ALTER TABLE rentacar.Veiculo  ADD FOREIGN KEY (codigo_Tipo_Veiculo) REFERENCES rentacar.Tipo_Veiculo(codigo);




