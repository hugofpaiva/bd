CREATE SCHEMA stocks;
GO

CREATE TABLE stocks.Fornecedor(
	NIF		CHAR(9)	NOT NULL		PRIMARY KEY,
	endereco	VARCHAR(35),
	nome		VARCHAR(35)		NOT NULL,
	CondicoesPagamento	VARCHAR(50) NOT NULL	CHECK (CondicoesPagamento IN('Pronto','30 dias','60 dias')),
	FAX			CHAR(9),
	TPdesig		VARCHAR(30)
);

CREATE TABLE stocks.Encomenda(
	NumEncomenda		INT	NOT NULL	PRIMARY KEY,
	Data				datetime	NOT NULL,
	FrNIF				CHAR(9)	REFERENCES stocks.Fornecedor(NIF),
);


CREATE TABLE stocks.Produto(
	Codigo		INT NOT NULL PRIMARY KEY,
	Stock		INT	NOT NULL,
	Preço		DECIMAL(10,2)	NOT NULL,
	IVA			DECIMAL(5,2)	NOT NULL,
	NOME		VARCHAR(25)		NOT NULL
);

CREATE TABLE stocks.Tipo_Fornecedor(
	Designacao		VARCHAR(30)		NOT NULL	PRIMARY KEY
);

CREATE TABLE stocks.Tem(
	Pcodigo			INT		NOT NULL	REFERENCES stocks.Produto(Codigo),
	NumEncomenda	INT	REFERENCES	stocks.Encomenda(NumEncomenda),
	Unidades		INT		NOT NULL,
	PRIMARY KEY(Pcodigo, NumEncomenda)
);

ALTER TABLE stocks.Fornecedor  ADD FOREIGN KEY (TPdesig) REFERENCES stocks.Tipo_Fornecedor(Designacao);

