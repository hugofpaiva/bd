create schema GestStocks;
GO

CREATE TABLE GestStocks.Fornecedor(
	NIF		CHAR(9)	NOT NULL		PRIMARY KEY,
	endereco	VARCHAR(35),
	nome		VARCHAR(35)		NOT NULL,
	CondicoesPagamento	VARCHAR(50) NOT NULL,
	FAX			CHAR(9),
	TPcodigo		int,
);

CREATE TABLE GestStocks.Encomenda(
	NumEncomenda		INT	NOT NULL	PRIMARY KEY,
	data				datetime	NOT NULL,
	FrNIF				CHAR(9),
);


CREATE TABLE GestStocks.Produto(
	Codigo		INT NOT NULL PRIMARY KEY,
	Stock		INT	NOT NULL,
	Preço		DECIMAL(10,2)	NOT NULL,
	IVA			int	NOT NULL,
	NOME		VARCHAR(25)		NOT NULL
);

CREATE TABLE GestStocks.Tipo_Fornecedor(
	Designacao		varchar(30) ,
	codigo	int NOT NULL PRIMARY KEY,
);

CREATE TABLE GestStocks.Tem(
	Pcodigo			INT		NOT NULL,
	NumEncomenda	INT,
	Unidades		INT		NOT NULL,
	PRIMARY KEY(Pcodigo, NumEncomenda)
);

ALTER TABLE GestStocks.Fornecedor  ADD constraint codTipoFr FOREIGN KEY (TPcodigo) REFERENCES GestStocks.Tipo_Fornecedor(codigo);
ALTER TABLE GestStocks.Encomenda ADD constraint FrNIF FOREIGN KEY (FrNIF) REFERENCES GestStocks.Fornecedor(NIF);
ALTER TABLE GestStocks.Tem ADD constraint ProdCodigo FOREIGN KEY (Pcodigo) REFERENCES GestStocks.Produto(Codigo);
ALTER TABLE GestStocks.Tem ADD constraint NumEnc FOREIGN KEY (NumEncomenda) REFERENCES GestStocks.Encomenda(NumEncomenda);


INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(101,'Carnes')
INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(102,'Laticinios')
INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(103,'Frutas e Legumes')
INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(104,'Mercearia')
INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(105,'Bebidas')
INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(106,'Peixe')
INSERT INTO GestStocks.Tipo_Fornecedor(codigo, designacao)VALUES(107,'Detergentes')


INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(509111222,'LactoSerrano',234872372,NULL,'60 dias',102)
INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(509121212,'FrescoNorte',221234567,'Rua do Complexo Grande - Edf 3','60 dias',102)
INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(509294734,'PinkDrinks',2123231732,'Rua Poente 723','30 dias',105)
INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(509827353,'LactoSerrano',234872372,NULL,'60 dias',102)
INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(509836433,'LeviClean',229343284,'Rua Sol Poente 6243','30 dias',107)
INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(509987654,'MaduTex',234873434,'Estrada da Cincunvalacao 213','30 dias',104)
INSERT INTO GestStocks.Fornecedor(NIF,nome,FAX,endereco,CondicoesPagamento,TPcodigo)VALUES(590972623,'ConservasMac',234112233,'Rua da Recta 233','30 dias',104)


INSERT INTO GestStocks.Produto(Codigo,NOME,Preço,iva,Stock)VALUES(10001,'Bife da Pa',8.75,23,125)
INSERT INTO GestStocks.Produto(Codigo,NOME,Preço,iva,Stock)VALUES(10002,'Laranja Algarve',1.25,23,1000)
INSERT INTO GestStocks.Produto(Codigo,NOME,Preço,iva,Stock)VALUES(10003,'Pera Rocha',1.45,23,2000)
INSERT INTO GestStocks.Produto(Codigo,NOME,Preço,iva,Stock)VALUES(10004,'Secretos de Porco Preto',10.15,23,342)
INSERT INTO GestStocks.Produto(Codigo,NOME,Preço,iva,Stock)VALUES(10005,'Vinho Rose Plus',2.99,13,5232)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10006,'Queijo de Cabra da Serra',15.00,23,3243)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10007,'Queijo Fresco do Dia',0.65,23,452)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10008,'Cerveja Preta Artesanal',1.65,13,937)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10009,'Lixivia de Cor',1.85,23,9382)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10010,'Amaciador Neutro',4.05,23,932432)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10011,'Agua Natural',0.55,6,919323)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10012,'Pao de Leite',0.15,6,5434)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10013,'Arroz Agulha',1.00,13,7665)
INSERT INTO GestStocks.Produto(Codigo,nome,Preço,iva,Stock)VALUES(10014,'Iogurte Natural',0.40,13,998)


INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(1,'2015-03-03',509111222)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(2,'2015-03-04',509121212)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(3,'2015-03-05',509987654)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(4,'2015-03-06',509827353)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(5,'2015-03-07',509294734)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(6,'2015-03-08',509836433)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(7,'2015-03-09',509121212)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(8,'2015-03-10',509987654)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(9,'2015-03-11',509836433)
INSERT INTO GestStocks.Encomenda(NumEncomenda,data,FrNIF)VALUES(10,'2015-03-12',509987654)


INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(1,10001,200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(1,10004,300)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(2,10002,1200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(2,10003,3200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(3,10013,900)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(4,10006,50)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(4,10007,40)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(4,10014,200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(5,10005,500)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(5,10008,10)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(5,10011,1000)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(6,10009,200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(6,10010,200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(7,10003,1200)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(8,10013,350)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(9,10009,100)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(9,10010,300)
INSERT INTO GestStocks.Tem(NumEncomenda,Pcodigo,unidades)VALUES(10,10012,200)


/** queries AR to SQL **/

/** a) **/
select NIF,Nome from (GestStocks.Encomenda right outer join GestStocks.Fornecedor ON FrNIF=NIF) 
where NumEncomenda is null

/** b) **/
select Pcodigo, avg(unidades) as MediaDeUnidades from (GestStocks.Produto join GestStocks.Tem on codigo=Pcodigo)
group by Pcodigo; 

/** c) **/
select avg(Unidades) as NumProdutos from GestStocks.Tem
group by NumEncomenda;

/** d) **/
select GestStocks.Fornecedor.Nome, GestStocks.Produto.Nome,sum(GestStocks.Tem.Unidades) as Quant
from (GestStocks.Produto join (GestStocks.Tem join (GestStocks.Fornecedor join GestStocks.Encomenda on NIF = FrNIF) on GestStocks.Encomenda.NumEncomenda = GestStocks.Tem.NumEncomenda) on codigo = Pcodigo)
group by GestStocks.Produto.Nome, GestStocks.Fornecedor.Nome

