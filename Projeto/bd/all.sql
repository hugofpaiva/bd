IF DB_ID('Perfumaria') IS NULL
CREATE DATABASE Perfumaria;
GO

USE Perfumaria;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'perf')
BEGIN
EXEC('CREATE SCHEMA perf')
END

-- DROPS
IF OBJECT_ID('Perfumaria.perf.produto_tem_promocao', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.produto_tem_promocao DROP CONSTRAINT produto_tem_promocao_produtoid_fr;
ALTER TABLE Perfumaria.perf.produto_tem_promocao DROP CONSTRAINT produto_tem_promocao_promocaoid_fr;
ALTER TABLE Perfumaria.perf.produto_tem_promocao DROP CONSTRAINT produto_tem_promocao_pk;
DROP TABLE Perfumaria.perf.produto_tem_promocao;
END
GO

IF OBJECT_ID('Perfumaria.perf.perfume', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.perfume DROP CONSTRAINT perfume_id_fr;
ALTER TABLE Perfumaria.perf.perfume DROP CONSTRAINT perfume_pk;
DROP TABLE Perfumaria.perf.perfume;
END
GO

IF OBJECT_ID('Perfumaria.perf.cosmetica', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.cosmetica DROP CONSTRAINT cosmetica_id_fr;
ALTER TABLE Perfumaria.perf.cosmetica DROP CONSTRAINT cosmetica_pk;
DROP TABLE Perfumaria.perf.cosmetica;
END
GO

IF OBJECT_ID('Perfumaria.perf.clientefavorita', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.clientefavorita DROP CONSTRAINT clientefavorita_clienteemail_fr;
ALTER TABLE Perfumaria.perf.clientefavorita DROP CONSTRAINT clientefavorita_produtoid_fr;
ALTER TABLE Perfumaria.perf.clientefavorita DROP CONSTRAINT clientefavorita_pk;
DROP TABLE Perfumaria.perf.clientefavorita;
END
GO

IF OBJECT_ID('Perfumaria.perf.cliente_usa_cupao', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.cliente_usa_cupao DROP CONSTRAINT clienteusacupao_clienteemail_fr;
ALTER TABLE Perfumaria.perf.cliente_usa_cupao DROP CONSTRAINT clienteusacupao_cupaoid_fr;
ALTER TABLE Perfumaria.perf.cliente_usa_cupao DROP CONSTRAINT cliente_usa_cupao_pk;
DROP TABLE Perfumaria.perf.cliente_usa_cupao;
END
GO

IF OBJECT_ID('Perfumaria.perf.marcacao', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.marcacao DROP CONSTRAINT marcacao_clienteemail_fr;
ALTER TABLE Perfumaria.perf.marcacao DROP CONSTRAINT marcacao_servicoid_fr;
ALTER TABLE Perfumaria.perf.marcacao DROP CONSTRAINT marcacao_funcemail_fr;
ALTER TABLE Perfumaria.perf.marcacao DROP CONSTRAINT marcacao_pk;
DROP TABLE Perfumaria.perf.marcacao;
END
GO

IF OBJECT_ID('Perfumaria.perf.compra_online', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.compra_online DROP CONSTRAINT compra_online_numero_fr;
ALTER TABLE Perfumaria.perf.compra_online DROP CONSTRAINT compra_online_contactoid_fr;
ALTER TABLE Perfumaria.perf.compra_online DROP CONSTRAINT compra_online_pk;
DROP TABLE Perfumaria.perf.compra_online;
END
GO

IF OBJECT_ID('Perfumaria.perf.compra_presencial', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.compra_presencial DROP CONSTRAINT compra_presencial_numero_fr;
ALTER TABLE Perfumaria.perf.compra_presencial DROP CONSTRAINT compra_presencial_funcemail_fr;
ALTER TABLE Perfumaria.perf.compra_presencial DROP CONSTRAINT compra_presencial_pk;
DROP TABLE Perfumaria.perf.compra_presencial;
END
GO

IF OBJECT_ID('Perfumaria.perf.compra_tem_produto', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.compra_tem_produto DROP CONSTRAINT compra_tem_produto_compranumero_fr;
ALTER TABLE Perfumaria.perf.compra_tem_produto DROP CONSTRAINT compra_tem_produto_produtoid_fr;
ALTER TABLE Perfumaria.perf.compra_tem_produto DROP CONSTRAINT compra_tem_produto_pk;
DROP TABLE Perfumaria.perf.compra_tem_produto;
END
GO

IF OBJECT_ID('Perfumaria.perf.compra', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.compra DROP CONSTRAINT compra_clienteemail_fr;
ALTER TABLE Perfumaria.perf.compra DROP CONSTRAINT compra_pk;
DROP TABLE Perfumaria.perf.compra;
END
GO

IF OBJECT_ID('Perfumaria.perf.cliente', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.cliente DROP CONSTRAINT cliente_email_fr;
ALTER TABLE Perfumaria.perf.cliente DROP CONSTRAINT cliente_pk;
DROP TABLE Perfumaria.perf.cliente;
END
GO

IF OBJECT_ID('Perfumaria.perf.funcionario_faz_servico', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.funcionario_faz_servico DROP CONSTRAINT func_faz_serv_servicoid_fr;
ALTER TABLE Perfumaria.perf.funcionario_faz_servico DROP CONSTRAINT func_faz_serv_funcionario_email_fr;
ALTER TABLE Perfumaria.perf.funcionario_faz_servico DROP CONSTRAINT funcionario_faz_servico_pk;
DROP TABLE Perfumaria.perf.funcionario_faz_servico;
END
GO

IF OBJECT_ID('Perfumaria.perf.funcionario', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.funcionario DROP CONSTRAINT funcionario_email_fr;
ALTER TABLE Perfumaria.perf.funcionario DROP CONSTRAINT funcionario_pk;
DROP TABLE Perfumaria.perf.funcionario;
END
GO

IF OBJECT_ID('Perfumaria.perf.utilizador', 'U') IS NOT NULL
ALTER TABLE Perfumaria.perf.utilizador DROP CONSTRAINT utilizador_contactodefaultid_fr;
GO

IF OBJECT_ID('Perfumaria.perf.contacto', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.contacto DROP CONSTRAINT contacto_utilizadoremail_fr;
ALTER TABLE Perfumaria.perf.contacto DROP CONSTRAINT contacto_pk;
DROP TABLE Perfumaria.perf.contacto;
END
GO

IF OBJECT_ID('Perfumaria.perf.utilizador', 'U') IS NOT NULL
BEGIN
ALTER TABLE Perfumaria.perf.utilizador DROP CONSTRAINT utilizador_pk;
DROP TABLE Perfumaria.perf.utilizador;
END
GO

IF OBJECT_ID('Perfumaria.perf.servico', 'U') IS NOT NULL
DROP TABLE Perfumaria.perf.servico;
GO

IF OBJECT_ID('Perfumaria.perf.cupao', 'U') IS NOT NULL
DROP TABLE Perfumaria.perf.cupao;
GO

IF OBJECT_ID('Perfumaria.perf.produto', 'U') IS NOT NULL
DROP TABLE Perfumaria.perf.produto;
GO

IF OBJECT_ID('Perfumaria.perf.promocao', 'U') IS NOT NULL
DROP TABLE Perfumaria.perf.promocao;
GO

-- TABLE CREATION
CREATE TABLE Perfumaria.perf.promocao
(
    id INT NOT NULL IDENTITY(1,1),
    nome VARCHAR(30) NOT NULL,
    desconto TINYINT CHECK(desconto BETWEEN 0 and 100) NOT NULL,
    datainicio SMALLDATETIME NOT NULL,
    datafim SMALLDATETIME NOT NULL,
    CONSTRAINT promocao_pk PRIMARY KEY (id)
);
GO

CREATE TABLE Perfumaria.perf.produto_tem_promocao
(
    produtoid INT NOT NULL,
    promocaoid INT NOT NULL,
    CONSTRAINT produto_tem_promocao_pk PRIMARY KEY (produtoid, promocaoid)
);
GO

CREATE TABLE Perfumaria.perf.produto
(
    id INT NOT NULL IDENTITY(1,1),
    preco FLOAT NOT NULL,
    familiaolfativa VARCHAR(30),
    categoria VARCHAR(30) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    linha VARCHAR(30),
    tamanho SMALLINT,
    descricao VARCHAR(280),
    imagem VARCHAR(100) NOT NULL,
    stock SMALLINT NOT NULL,
    destinatario VARCHAR(10),
    deleted BIT NOT NULL DEFAULT 0,

    CONSTRAINT produto_pk PRIMARY KEY  (id)
);
GO

CREATE TABLE Perfumaria.perf.perfume
(
    id INT NOT NULL,

    CONSTRAINT perfume_pk PRIMARY KEY (id)
);
GO

CREATE TABLE Perfumaria.perf.cosmetica
(
    id INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,

    CONSTRAINT cosmetica_pk PRIMARY KEY (id)
)
GO

CREATE TABLE Perfumaria.perf.clientefavorita
(
    clienteemail VARCHAR(255) NOT NULL,
    produtoid INT NOT NULL,

    CONSTRAINT clientefavorita_pk PRIMARY KEY (clienteemail, produtoid)
)
GO

CREATE TABLE Perfumaria.perf.cupao
(
    id CHAR(10) NOT NULL,
    datainicio SMALLDATETIME NOT NULL,
    datafim SMALLDATETIME NOT NULL,
    pontos_atribuidos INT NOT NULL,
    CONSTRAINT cupao_pk PRIMARY KEY (id)
);
GO

CREATE TABLE Perfumaria.perf.cliente_usa_cupao
(
    cliente_email VARCHAR(255) NOT NULL,
    cupao_id CHAR(10) NOT NULL,
    CONSTRAINT cliente_usa_cupao_pk PRIMARY KEY (cliente_email, cupao_id)


);
GO

CREATE TABLE Perfumaria.perf.cliente
(
    email VARCHAR(255) NOT NULL,
    pontos INT NOT NULL,
    newsletter BIT NOT NULL,
    pagamento VARCHAR(10),

    CONSTRAINT cliente_pk PRIMARY KEY (email)
);
GO

CREATE TABLE Perfumaria.perf.utilizador
(
    email VARCHAR(255) NOT NULL,
    contribuinte CHAR(9) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    pw BINARY(64) NOT NULL,
    sexo BIT NOT NULL,
    dataNasc DATE NOT NULL,
    foto VARCHAR(100) NOT NULL,
    contacto_default_id INT,
    deleted BIT NOT NULL DEFAULT 0,
    CONSTRAINT utilizador_pk PRIMARY KEY (email)

);
GO

CREATE TABLE Perfumaria.perf.funcionario
(
    email VARCHAR(255) NOT NULL,
    administrator TINYINT NOT NULL,
    salario INT NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (email)

);
GO

CREATE TABLE Perfumaria.perf.contacto
(
    id INT IDENTITY(1,1) NOT NULL,
    utilizador_email VARCHAR(255) NOT NULL,
    telemovel CHAR(9) NOT NULL,
    visibilidade BIT NOT NULL DEFAULT 1,
    codigo_postal CHAR(8) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    apartamento VARCHAR(50),
    localidade VARCHAR(20) NOT NULL,

    CONSTRAINT contacto_pk PRIMARY KEY (id)

);
GO

CREATE TABLE Perfumaria.perf.compra_tem_produto
(
    compranumero INT NOT NULL,
    produtoid INT NOT NULL,
    unidades INT NOT NULL,

    CONSTRAINT compra_tem_produto_pk PRIMARY KEY (compranumero, produtoid)
);
GO

CREATE TABLE Perfumaria.perf.compra
(
    numero INT NOT NULL IDENTITY(1,1),
    contribuinte CHAR(9) NOT NULL,
    datacompra SMALLDATETIME NOT NULL,
    pagamento VARCHAR(10) NOT NULL,
    clienteemail VARCHAR(255) NOT NULL,
    pontosgastos INT,
    pontosacumulados INT,

    CONSTRAINT compra_pk PRIMARY KEY (numero)
);
GO

CREATE TABLE Perfumaria.perf.servico
(
    id INT IDENTITY(1,1) NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    preco FLOAT NOT NULL,
    deleted BIT NOT NULL DEFAULT 0,

    CONSTRAINT servico_pk PRIMARY KEY (id)
);
GO

CREATE TABLE Perfumaria.perf.funcionario_faz_servico
(
    funcionario_email VARCHAR(255) NOT NULL,
    servico_id INT NOT NULL,
    duracao_media INT NOT NULL,
    deleted BIT NOT NULL DEFAULT 0,

    CONSTRAINT funcionario_faz_servico_pk PRIMARY KEY (funcionario_email, servico_id)
);
GO

CREATE TABLE Perfumaria.perf.compra_online
(
    numero INT NOT NULL,
    rating CHAR(1),
    observacao VARCHAR(280),
    rastreamento VARCHAR(20),
    presente BIT NOT NULL,
    contactoid INT NOT NULL,

    CONSTRAINT compra_online_pk PRIMARY KEY (numero)
);
GO

CREATE TABLE Perfumaria.perf.compra_presencial
(
    numero INT NOT NULL,
    funcemail VARCHAR(255) NOT NULL,

    CONSTRAINT compra_presencial_pk PRIMARY KEY (numero)
);
GO

CREATE TABLE Perfumaria.perf.marcacao
(
    id INT NOT NULL IDENTITY(1,1),
    cliente_email VARCHAR(255) NOT NULL,
    servico_id INT NOT NULL,
    funcionario_email VARCHAR(255) NOT NULL,
    dataMarc SMALLDATETIME NOT NULL,
    deleted BIT NOT NULL DEFAULT 0,
    

    CONSTRAINT marcacao_pk PRIMARY KEY (id)
);
GO


-- CONSTRAINTS
ALTER TABLE Perfumaria.perf.produto_tem_promocao ADD CONSTRAINT produto_tem_promocao_produtoid_fr FOREIGN KEY (produtoid) REFERENCES Perfumaria.perf.produto(id);
ALTER TABLE Perfumaria.perf.produto_tem_promocao ADD CONSTRAINT produto_tem_promocao_promocaoid_fr FOREIGN KEY (promocaoid) REFERENCES Perfumaria.perf.promocao(id);

ALTER TABLE Perfumaria.perf.perfume ADD CONSTRAINT perfume_id_fr FOREIGN KEY (id) REFERENCES Perfumaria.perf.produto(id);

ALTER TABLE Perfumaria.perf.cosmetica ADD CONSTRAINT cosmetica_id_fr FOREIGN KEY (id) REFERENCES Perfumaria.perf.produto(id);

ALTER TABLE Perfumaria.perf.clientefavorita ADD CONSTRAINT clientefavorita_clienteemail_fr FOREIGN KEY (clienteemail) REFERENCES Perfumaria.perf.cliente(email);
ALTER TABLE Perfumaria.perf.clientefavorita ADD CONSTRAINT clientefavorita_produtoid_fr FOREIGN KEY (produtoid) REFERENCES Perfumaria.perf.produto(id);

ALTER TABLE Perfumaria.perf.cliente_usa_cupao ADD CONSTRAINT clienteusacupao_clienteemail_fr FOREIGN KEY (cliente_email) REFERENCES Perfumaria.perf.cliente(email);
ALTER TABLE Perfumaria.perf.cliente_usa_cupao ADD CONSTRAINT clienteusacupao_cupaoid_fr FOREIGN KEY (cupao_id) REFERENCES Perfumaria.perf.cupao(id);

ALTER TABLE Perfumaria.perf.cliente ADD CONSTRAINT cliente_email_fr FOREIGN KEY (email) REFERENCES Perfumaria.perf.cliente(email);

ALTER TABLE Perfumaria.perf.utilizador ADD CONSTRAINT utilizador_contactodefaultid_fr FOREIGN KEY (contacto_default_id) REFERENCES Perfumaria.perf.contacto(id);

ALTER TABLE Perfumaria.perf.funcionario ADD CONSTRAINT funcionario_email_fr FOREIGN KEY (email) REFERENCES Perfumaria.perf.utilizador(email);

ALTER TABLE Perfumaria.perf.compra_tem_produto ADD CONSTRAINT compra_tem_produto_compranumero_fr FOREIGN KEY (compranumero) REFERENCES Perfumaria.perf.compra(numero);
ALTER TABLE Perfumaria.perf.compra_tem_produto ADD CONSTRAINT compra_tem_produto_produtoid_fr FOREIGN KEY (produtoid) REFERENCES Perfumaria.perf.produto(id);

ALTER TABLE Perfumaria.perf.contacto ADD CONSTRAINT contacto_utilizadoremail_fr FOREIGN KEY (utilizador_email) REFERENCES Perfumaria.perf.utilizador(email);

ALTER TABLE Perfumaria.perf.compra ADD CONSTRAINT compra_clienteemail_fr FOREIGN KEY (clienteemail) REFERENCES Perfumaria.perf.cliente(email);

ALTER TABLE Perfumaria.perf.funcionario_faz_servico ADD CONSTRAINT func_faz_serv_servicoid_fr FOREIGN KEY (servico_id) REFERENCES Perfumaria.perf.servico(id);
ALTER TABLE Perfumaria.perf.funcionario_faz_servico ADD CONSTRAINT func_faz_serv_funcionario_email_fr FOREIGN KEY (funcionario_email) REFERENCES Perfumaria.perf.funcionario(email);

ALTER TABLE Perfumaria.perf.compra_online ADD CONSTRAINT compra_online_numero_fr FOREIGN KEY (numero) REFERENCES Perfumaria.perf.compra(numero);
ALTER TABLE Perfumaria.perf.compra_online ADD CONSTRAINT compra_online_contactoid_fr FOREIGN KEY (contactoid) REFERENCES Perfumaria.perf.contacto(id);

ALTER TABLE Perfumaria.perf.compra_presencial ADD CONSTRAINT compra_presencial_numero_fr FOREIGN KEY (numero) REFERENCES Perfumaria.perf.compra(numero);
ALTER TABLE Perfumaria.perf.compra_presencial ADD CONSTRAINT compra_presencial_funcemail_fr FOREIGN KEY (funcemail) REFERENCES Perfumaria.perf.funcionario(email);

ALTER TABLE Perfumaria.perf.marcacao ADD CONSTRAINT marcacao_clienteemail_fr FOREIGN KEY (cliente_email) REFERENCES Perfumaria.perf.cliente(email);
ALTER TABLE Perfumaria.perf.marcacao ADD CONSTRAINT marcacao_servicoid_fr FOREIGN KEY (servico_id) REFERENCES Perfumaria.perf.servico(id);
ALTER TABLE Perfumaria.perf.marcacao ADD CONSTRAINT marcacao_funcemail_fr FOREIGN KEY (funcionario_email) REFERENCES Perfumaria.perf.funcionario(email);



---
----
------
-------UDFs
------
----
---

DROP FUNCTION perf.clientBuyHistory;
GO

CREATE FUNCTION perf.clientBuyHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT datacompra as [Data], SUM(unidades * preco) as Total, compranumero
                    FROM ((Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.compra ON compra_tem_produto.compranumero=compra.numero) JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE (clienteemail=@email)
                    GROUP BY datacompra, clienteemail, compranumero
                    ORDER BY datacompra DESC OFFSET 0 ROWS)
GO 

DROP FUNCTION perf.clientContacts;
GO

CREATE FUNCTION perf.clientContacts (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT id, telemovel, codigo_postal, pais, endereco, apartamento, localidade
                    FROM Perfumaria.perf.contacto
                    WHERE utilizador_email=@email AND visibilidade = 1
                    ORDER BY id ASC OFFSET 0 ROWS)             
GO

DROP FUNCTION perf.clientDefaultContact;
GO

CREATE FUNCTION perf.clientDefaultContact (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT contacto_default_id as id
                    FROM (Perfumaria.perf.utilizador JOIN Perfumaria.perf.contacto ON contacto_default_id=id)
                    WHERE email=@email AND visibilidade = 1)
                    
GO

DROP FUNCTION perf.clientFavourites
GO

CREATE FUNCTION perf.clientFavourites (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario
                    FROM (Perfumaria.perf.clientefavorita JOIN Perfumaria.perf.produto ON produtoid=id)
                    WHERE clienteemail=@email AND deleted = 0)
                    
GO

DROP FUNCTION perf.clientFutureMarc;
GO

CREATE FUNCTION perf.clientFutureMarc (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, preco, fname AS NomeFuncionario
                    FROM ((Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id) JOIN Perfumaria.perf.utilizador ON funcionario_email = email)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) > 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)              
GO

DROP FUNCTION perf.getClientInfo;
GO


CREATE FUNCTION perf.getClientInfo (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT Perfumaria.perf.utilizador.*, Perfumaria.perf.cliente.email AS clientEmail, Perfumaria.perf.cliente.pontos, Perfumaria.perf.cliente.newsletter, Perfumaria.perf.cliente.pagamento
					FROM Perfumaria.perf.utilizador 
					JOIN Perfumaria.perf.cliente 
					ON Perfumaria.perf.utilizador.email = Perfumaria.perf.cliente.email
                    WHERE @email = utilizador.email) 
GO

DROP FUNCTION perf.clientServicesHistory;
GO

CREATE FUNCTION perf.clientServicesHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, servico.preco
                    FROM (Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id)
                    WHERE (cliente_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) < 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)             
GO

DROP FUNCTION perf.funcFutureMarc;
GO

CREATE FUNCTION perf.funcFutureMarc (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT cliente_email,dataMarc, tipo, preco, fname, lname, marcacao.id
                    FROM ((Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id) JOIN Perfumaria.perf.utilizador ON cliente_email = email)
                    WHERE (funcionario_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) > 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)             
GO

DROP FUNCTION perf.getFuncInfo;
GO

CREATE FUNCTION perf.getFuncInfo (@emailFunc VARCHAR(255)) RETURNS Table 
AS
    RETURN (SELECT Perfumaria.perf.utilizador.*, Perfumaria.perf.funcionario.salario, Perfumaria.perf.funcionario.administrator
                    FROM Perfumaria.perf.utilizador
                    JOIN Perfumaria.perf.funcionario ON utilizador.email = funcionario.email
                    WHERE utilizador.email = @emailFunc) 
GO  

DROP FUNCTION perf.funcSellHistory;
GO

CREATE FUNCTION perf.funcSellHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT datacompra, clienteemail, SUM(unidades * preco) as total, compranumero
                    FROM (((Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.compra ON compranumero=numero)JOIN Perfumaria.perf.produto ON produtoid=id) 
                    JOIN Perfumaria.perf.compra_presencial ON compra_presencial.numero=compra.numero)
                    WHERE (funcemail=@email)
                    GROUP BY datacompra, clienteemail, compranumero
                    ORDER BY datacompra DESC OFFSET 0 ROWS)
GO

DROP FUNCTION perf.funcServicesHistory;
GO

CREATE FUNCTION perf.funcServicesHistory (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT dataMarc, tipo, cliente_email
                    FROM (Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id)
                    WHERE (funcionario_email=@email AND DATEDIFF(mi, GETDATE(), dataMarc) < 0) 
                    ORDER BY dataMarc ASC OFFSET 0 ROWS)             
GO

DROP FUNCTION perf.getAllFuncs;
GO

CREATE FUNCTION perf.getAllFuncs ( @emailFunc VARCHAR(255)) returns @table table (email VARCHAR(255) NOT NULL, contribuinte CHAR(9) NOT NULL, fname VARCHAR(20) NOT NULL,
                                                                                lname VARCHAR(20) NOT NULL, sexo BIT NOT NULL, dataNasc DATE NOT NULL,
                                                                                foto VARCHAR(100) NOT NULL, contacto_default_id INT,  
                                                                                administrator TINYINT NOT NULL, salario INT NOT NULL, deleted BIT NOT NULL DEFAULT 0)                                            
AS
BEGIN 
            DECLARE @email AS VARCHAR(255), @contribuinte AS CHAR(9), @fname AS VARCHAR(20),
                    @lname AS VARCHAR(20), @sexo AS BIT, @dataNasc AS DATE,
                    @foto AS VARCHAR(100), @contacto_default_id AS INT, @deleted AS BIT, 
                    @administrator AS TINYINT, @salario AS INT;
            IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
                INSERT @table SELECT utilizador.email, contribuinte, fname, lname, sexo, dataNasc, foto, contacto_default_id, administrator, salario, deleted
                            FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.funcionario ON utilizador.email=funcionario.email
            RETURN;
        END;
GO

DROP FUNCTION perf.getAllProducts;
GO

CREATE FUNCTION perf.getAllProducts () RETURNS @table TABLE (preco INT NOT NULL, familiaolfativa VARCHAR(30), categoria VARCHAR(30) NOT NULL,
                                                            nome VARCHAR(30) NOT NULL, marca VARCHAR(30) NOT NULL, linha VARCHAR(30),
                                                            tamanho SMALLINT, descricao VARCHAR(280), imagem VARCHAR(100) NOT NULL,
                                                            stock SMALLINT NOT NULL, destinatario VARCHAR(10))
                                                        
    AS
        BEGIN 
            DECLARE @preco AS INT, @familiaolfativa AS VARCHAR(30), @categoria AS VARCHAR(30),@nome AS VARCHAR(30), @marca AS VARCHAR(30),
            @linha AS VARCHAR(30), @tamanho AS SMALLINT, @descricao AS VARCHAR(280), @imagem AS VARCHAR(100),
            @stock AS SMALLINT, @destinatario AS VARCHAR(10);
            
            INSERT @table SELECT preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario
                            FROM Perfumaria.perf.produto
            RETURN;
        END;
GO

DROP FUNCTION perf.getAllServices;
GO

CREATE FUNCTION perf.getAllServices () RETURNS Table 
AS
    RETURN (SELECT id, tipo, preco
                    FROM Perfumaria.perf.servico)
                    
GO

DROP FUNCTION perf.getClientCupon;
GO

CREATE FUNCTION perf.getClientCupon (@email VARCHAR(255)) RETURNS TABLE 
AS
    RETURN (SELECT id, datainicio, datafim, pontos_atribuidos
                    FROM (Perfumaria.perf.cliente_usa_cupao JOIN Perfumaria.perf.cupao ON cupao_id=id)
                    WHERE cliente_email=@email
                    ORDER BY datainicio DESC OFFSET 0 ROWS)
                    
GO

DROP FUNCTION perf.getCupons;
GO

CREATE FUNCTION perf.getCupons () RETURNS TABLE 
AS
    RETURN (SELECT id, datainicio, datafim, pontos_atribuidos
                    FROM Perfumaria.perf.cupao)
                    
GO

DROP FUNCTION perf.getFuncService;
GO

CREATE FUNCTION perf.getFuncService (@servico_id INT) RETURNS Table 
AS
    RETURN (SELECT fname, lname, funcionario_email
                    FROM Perfumaria.perf.funcionario_faz_servico JOIN Perfumaria.perf.utilizador ON email = funcionario_email
                    WHERE funcionario_faz_servico.deleted = 0 AND servico_id = @servico_id AND utilizador.deleted = 0) 
GO

DROP FUNCTION perf.getProductsFromBuy;
GO

CREATE FUNCTION perf.getProductsFromBuy (@numero INT) RETURNS Table 
AS
    RETURN (SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted, unidades
                    FROM Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.produto ON produtoid=id
                    WHERE compranumero = @numero) 
GO

DROP FUNCTION perf.getPromocoes;
GO

CREATE FUNCTION perf.getPromocoes () RETURNS TABLE 
AS
    RETURN (SELECT id, nome, desconto, datainicio, datafim
                    FROM Perfumaria.perf.promocao)
                    
GO

DROP FUNCTION perf.getServiceFuncs;
GO

CREATE FUNCTION perf.getServiceFuncs (@id INT) RETURNS Table 
AS
    RETURN (SELECT fname, lname, email, funcionario_faz_servico.deleted
                    FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.funcionario_faz_servico ON email=funcionario_email
                    WHERE servico_id=@id) 
GO

DROP FUNCTION perf.getServicesType;
GO

CREATE FUNCTION perf.getServicesType () RETURNS Table 
AS
    RETURN (SELECT id, tipo, preco
                    FROM Perfumaria.perf.servico
                    WHERE deleted = 0) 
GO


------
---------
----------TRIGGERs
---------
------

DROP TRIGGER perf.buyProductTrigger;
GO

CREATE TRIGGER perf.buyProductTrigger ON perf.[compra_tem_produto]
AFTER INSERT
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @unidades AS INT;
    DECLARE @produtoid AS INT;
    DECLARE @stock as INT;
    SELECT @unidades = unidades, @produtoid = produtoid FROM inserted;
    SELECT @stock = stock FROM Perfumaria.perf.produto;
    IF (@stock - @unidades < 0)
    BEGIN
        RAISERROR('Encomenda não processada. Stock insuficente.', 16, 1);
        ROLLBACK TRAN;
    END
	IF (@stock - @unidades = 0)
	BEGIN
    BEGIN TRY
		UPDATE Perfumaria.perf.produto
		SET stock = 0, deleted = 1
		WHERE  id = @produtoid
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível atribuir os pontos', 16, 1);
        ROLLBACK TRAN
    END CATCH
	END
END
GO

DROP TRIGGER perf.changeProductTrigger;
GO

CREATE TRIGGER perf.changeProductTrigger ON perf.[produto]
AFTER INSERT, UPDATE
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @stock as INT;
	DECLARE @produtoid as INT;
    SELECT @stock = stock, @produtoid = id FROM inserted;
    IF (@stock < 0)
    BEGIN
        RAISERROR('Stock inválido.', 16, 1);
        ROLLBACK TRAN;
    END
	IF (@stock= 0)
	BEGIN
    BEGIN TRY
		UPDATE Perfumaria.perf.produto
		SET deleted = 1
		WHERE  id = @produtoid
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível mudar o produto.', 16, 1);
        ROLLBACK TRAN
    END CATCH
	END
END
GO

DROP TRIGGER perf.createContactTrigger;
GO

CREATE TRIGGER perf.createContactTrigger ON perf.[contacto]
AFTER INSERT
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @id AS INT;
    DECLARE @email AS VARCHAR(255); 
    SELECT @id = id, @email = utilizador_email FROM inserted;
    IF EXISTS(SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id IS NULL)
    BEGIN
    BEGIN TRY
		UPDATE Perfumaria.perf.utilizador
		SET  contacto_default_id = @id
		WHERE  email = @email
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível colocar o contacto como default', 16, 1);
        ROLLBACK TRAN
    END CATCH
	END
END
GO

DROP TRIGGER perf.useCuponTrigger;
GO

CREATE TRIGGER perf.useCuponTrigger ON perf.[cliente_usa_cupao]
AFTER INSERT
AS
BEGIN
    BEGIN TRAN
    SET NOCOUNT ON;
    DECLARE @cupao as CHAR(10);
    DECLARE @email as VARCHAR(255);
    DECLARE @pontos as INT;
    SELECT @cupao = cupao_id, @email = cliente_email FROM inserted;
    SELECT @pontos = pontos_atribuidos FROM Perfumaria.perf.cupao WHERE id = @cupao;
    BEGIN TRY
        UPDATE perf.cliente
        SET pontos += @pontos
        WHERE email = @email
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        raiserror ('Não foi possível atribuir os pontos', 16, 1);
		ROLLBACK TRAN
    END CATCH

END
GO


------
---------
----------SPs
---------
------

DROP PROCEDURE perf.addContact;
GO

CREATE PROCEDURE perf.addContact
    @utilizador_email VARCHAR(255),
    @telemovel CHAR(9),
    @codigo_postal CHAR(8),
    @pais VARCHAR(20),
    @endereco VARCHAR(50),
    @apartamento VARCHAR(10) = NULL,
    @localidade VARCHAR(20),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO Perfumaria.perf.contacto
        (utilizador_email, telemovel, codigo_postal, pais, endereco, apartamento, localidade)
        VALUES(@utilizador_email, @telemovel, @codigo_postal, @pais, @endereco, @apartamento, @localidade) 
        SET @responseMessage='Success'
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro'
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.addCupon;
GO

CREATE PROCEDURE perf.addCupon
    @id CHAR(10),
    @datainicio SMALLDATETIME,
    @datafim SMALLDATETIME,
    @pontos_atribuidos INT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                IF EXISTS(SELECT id FROM Perfumaria.perf.cupao WHERE id=@id)
                    SET @responseMessage = 'Id do cupão já existe'
                ELSE
                BEGIN
                    INSERT INTO Perfumaria.perf.cupao
                    (id, datainicio, datafim, pontos_atribuidos)
                    VALUES(@id, @datainicio, @datafim, @pontos_atribuidos) 
                    SET @responseMessage='Success'
                END
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed'
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.addFuncService;
GO

CREATE PROCEDURE perf.addFuncService
    @funcionario_email VARCHAR(255),
    @servico_id INT,
    @duracao_media INT,
    @emailFunc VARCHAR(255),
    @deleted BIT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.funcionario_faz_servico
                (funcionario_email, servico_id, duracao_media, deleted)
                VALUES(@funcionario_email, @servico_id, @duracao_media, @deleted) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.addMarc;
GO


CREATE PROCEDURE perf.addMarc
    @cliente_email VARCHAR(255),
    @servico_id INT,
    @funcionario_email VARCHAR(255),
    @dataMarc SMALLDATETIME,
    @responseMessage VARCHAR(250) = 'Erro! Tente noutra hora.' OUTPUT
AS
BEGIN
	BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY	
		DECLARE @duracao INT
		SELECT @duracao = duracao_media FROM Perfumaria.perf.funcionario_faz_servico WHERE funcionario_email=@funcionario_email AND deleted = 0 AND  servico_id = @servico_id
			IF (@duracao IS NOT NULL AND @dataMarc > GETDATE()) 
			BEGIN
				IF (EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE (dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, @dataMarc)) AND funcionario_email=@funcionario_email AND deleted=0) 
                OR EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, @dataMarc) AND cliente_email=@cliente_email AND deleted=0))
                SET @responseMessage = 'Hora não disponível!'
                ELSE
                BEGIN
				INSERT INTO Perfumaria.perf.marcacao
				(cliente_email, servico_id, funcionario_email, dataMarc)
				VALUES(@cliente_email, @servico_id, @funcionario_email, @dataMarc)

				SET @responseMessage='Marcação efetuado com sucesso!'
				END
			END
			COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failure'
		ROLLBACK
    END CATCH
	

END
GO

DROP PROCEDURE perf.addNewFunc;
GO

CREATE PROCEDURE perf.addNewFunc
    @email VARCHAR(255),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @pw VARCHAR(25),
    @sexo BIT,
    @dataNasc DATETIME,
    @foto VARCHAR(100),
    @contacto_default_id INT = NULL,
    @administrator TINYINT,
    @salario INT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.utilizador
                (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id)
                VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @pw), @sexo, @dataNasc, @foto, @contacto_default_id) 

                INSERT INTO Perfumaria.perf.funcionario
                (email, administrator, salario)
                VALUES(@email, @administrator, @salario) 

                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed'
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.addProduct;
GO

CREATE PROCEDURE perf.addProduct
    @preco FLOAT,
    @familiaolfativa VARCHAR(30) = NULL,
    @categoria VARCHAR(30),
    @nome VARCHAR(30),
    @marca VARCHAR(30),
    @linha VARCHAR(30),
    @tamanho SMALLINT = NULL,
    @descricao VARCHAR(280) = NULL,
    @imagem VARCHAR(100),
    @stock SMALLINT,
    @destinatario VARCHAR(10) = NULL,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator>0)
            BEGIN
                INSERT INTO Perfumaria.perf.produto
                (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario)
                VALUES(@preco, @familiaolfativa, @categoria, @nome, @marca, @linha, @tamanho, @descricao, @imagem, @stock, @destinatario) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.addPromotion;
GO

CREATE PROCEDURE perf.addPromotion
    @nome VARCHAR(30),
    @desconto TINYINT,
    @datainicio SMALLDATETIME,
    @datafim SMALLDATETIME,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.promocao
                (nome, desconto, datainicio, datafim)
                VALUES(@nome, @desconto, @datainicio, @datafim) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed'
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.addService;
GO


CREATE PROCEDURE perf.addService
    @tipo  VARCHAR(40),
    @preco FLOAT,
    @emailFunc VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator=2)
            BEGIN
                INSERT INTO Perfumaria.perf.servico
                (tipo, preco)
                VALUES(@tipo, @preco) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failed' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.buyProduct;
GO

CREATE PROCEDURE perf.buyProduct
    @compranumero INT,
    @produtoid INT,
    @unidades INT,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO Perfumaria.perf.compra_tem_produto
        (compranumero, produtoid, unidades)
        VALUES(@compranumero, @produtoid, @unidades) 
        SET @responseMessage='Success'
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failure' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.changeDefaultContact
GO

CREATE PROCEDURE perf.changeDefaultContact
    @id INT,
    @email VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM Perfumaria.perf.contacto WHERE id=@id)
            BEGIN
            IF EXISTS (SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id IS NOT NULL)
                IF EXISTS (SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id = @id)
                BEGIN
                    UPDATE Perfumaria.perf.utilizador
                    SET contacto_default_id= NULL
                    WHERE email=@email
                    SET @responseMessage='Successo!'
                END
                ELSE
                SET @responseMessage='Não é possível adicionar um contacto default antes de remover o atual.'
            ELSE
            BEGIN
                UPDATE Perfumaria.perf.utilizador
                SET contacto_default_id = @id
                WHERE email=@email
                SET @responseMessage='Successo!'
                END
            END
        ELSE
            SET @responseMessage='Permition denied'
        COMMIT TRANSACTION

    END TRY
    BEGIN CATCH
        SET @responseMessage='ERRO' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.changeProduct
GO


CREATE PROCEDURE perf.changeProduct
    @id INT,
    @preco FLOAT = 0,
    @familiaolfativa VARCHAR(30) = NULL,
    @categoria VARCHAR(30) = NULL,
    @nome VARCHAR(30)  = NULL,
    @marca VARCHAR(30)  = NULL,
    @linha VARCHAR(30)  = NULL,
    @tamanho SMALLINT = 0,
    @descricao VARCHAR(280) = NULL,
    @imagem VARCHAR(100)  = NULL,
    @stock SMALLINT = 0,
    @destinatario VARCHAR(10) = NULL,
	@deleted BIT = 0,
    @emailFunc VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON
    

        IF EXISTS(SELECT email FROM Perfumaria.perf.funcionario WHERE email=@emailFunc AND administrator>0)
            BEGIN
                IF @preco <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET preco = @preco
                    WHERE id = @id
                END

                IF @familiaolfativa IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET familiaolfativa = @familiaolfativa
                    WHERE id = @id
                END

                IF @categoria IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET categoria = @categoria
                    WHERE id = @id
                END

                IF @nome IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET nome = @nome
                    WHERE id = @id
                END

                IF @marca IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET marca = @marca
                    WHERE id = @id
                END

                IF @linha IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET linha = @linha
                    WHERE id = @id
                END
                
                IF @tamanho <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET tamanho = @tamanho
                    WHERE id = @id
                END

                IF @descricao IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET descricao = @descricao
                    WHERE id = @id
                END

                IF @imagem IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET imagem = @imagem
                    WHERE id = @id
                END

                IF @stock <> 0
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET stock = @stock
                    WHERE id = @id
                END

                IF @destinatario IS NOT NULL
                BEGIN
                    UPDATE Perfumaria.perf.produto
                    SET destinatario = @destinatario
                    WHERE id = @id
                END
                
                UPDATE Perfumaria.perf.produto
                SET deleted = @deleted
                WHERE id = @id
            END
            
END
GO

DROP PROCEDURE perf.changeRating
GO

CREATE PROCEDURE perf.changeRating
    @clienteemail VARCHAR(255),
    @compranum INT,
    @rating CHAR(1),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM (Perfumaria.perf.compra_online JOIN Perfumaria.perf.compra ON compra.numero=compra_online.numero) WHERE compra_online.numero=@compranum AND clienteemail=@clienteemail)
            BEGIN
                UPDATE Perfumaria.perf.compra_online
                SET rating = @rating
                WHERE numero=@compranum
                SET @responseMessage='Successo'
            END
        ELSE
            SET @responseMessage='Sem permissões!'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.clientAddFavourite
GO

CREATE PROCEDURE perf.clientAddFavourite
    @clienteemail VARCHAR(255),
    @produtoid INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF NOT EXISTS(SELECT produtoid FROM Perfumaria.perf.clientefavorita WHERE clienteemail=@clienteemail AND produtoid=@produtoid)
            BEGIN
                INSERT INTO Perfumaria.perf.clientefavorita
                (clienteemail, produtoid)
                VALUES(@clienteemail, @produtoid) 
                SET @responseMessage='Successo'
            END
        ELSE
            SET @responseMessage='Já existe!'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.clientRemoveFavourite
GO

CREATE PROCEDURE perf.clientRemoveFavourite
    @clienteemail VARCHAR(255),
    @produtoid INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(SELECT produtoid FROM Perfumaria.perf.clientefavorita WHERE clienteemail=@clienteemail AND produtoid=@produtoid)
            BEGIN
                DELETE FROM Perfumaria.perf.clientefavorita
                WHERE clienteemail=@clienteemail AND produtoid=@produtoid
                SET @responseMessage='Successo'
            END
        ELSE
            SET @responseMessage='Produto não faz parte dos favoritos do utilizador!'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Erro' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.clientUsesCupon;
GO

CREATE PROCEDURE perf.clientUsesCupon
    @cliente_email VARCHAR(255),
    @cupao_id CHAR(10),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    
    BEGIN TRY
        IF EXISTS(SELECT email FROM Perfumaria.perf.cliente WHERE email=@cliente_email) AND EXISTS(SELECT id, datainicio, datafim FROM Perfumaria.perf.cupao WHERE (id=@cupao_id) AND (GETDATE() BETWEEN datainicio AND datafim))
            BEGIN
                INSERT INTO Perfumaria.perf.cliente_usa_cupao
                (cliente_email, cupao_id)
                VALUES(@cliente_email, @cupao_id) 
                SET @responseMessage='Success'
            END
        ELSE
            SET @responseMessage='Failed'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE()
        ROLLBACK 
    END CATCH

END
GO

DROP PROCEDURE perf.getDetailsFromBuy;
GO

CREATE PROCEDURE perf.getDetailsFromBuy
    @numero INT
AS
BEGIN
        SET NOCOUNT ON
            IF EXISTS(SELECT numero FROM Perfumaria.perf.compra_online WHERE numero=@numero)
                BEGIN
                    SELECT pagamento, contribuinte, rating, rastreamento, presente, observacao, telemovel, codigo_postal, endereco, pontosgastos, pontosacumulados, compra.numero, compra.datacompra
                    FROM ((Perfumaria.perf.compra JOIN Perfumaria.perf.compra_online ON compra.numero=compra_online.numero) JOIN Perfumaria.perf.contacto ON contactoid=id)
                    WHERE compra.numero=@numero
                END
            ELSE IF EXISTS(SELECT numero FROM Perfumaria.perf.compra_presencial WHERE numero=@numero)
                BEGIN
                    SELECT pagamento, compra.contribuinte, fname, compra.numero, compra.datacompra
                    FROM (((Perfumaria.perf.compra JOIN Perfumaria.perf.compra_presencial ON compra.numero=compra_presencial.numero) JOIN Perfumaria.perf.funcionario ON funcemail=email) JOIN Perfumaria.perf.utilizador ON funcionario.email=utilizador.email)
                    WHERE compra.numero=@numero
                END
END
GO


DROP PROCEDURE perf.getDetailsFromSell;
GO

CREATE PROCEDURE perf.getDetailsFromSell
    @numero INT
AS
BEGIN
    SELECT clienteemail, pagamento, compra.contribuinte, compra.numero, compra.datacompra
    FROM (((Perfumaria.perf.compra JOIN Perfumaria.perf.compra_presencial ON compra.numero=compra_presencial.numero) JOIN Perfumaria.perf.funcionario ON funcemail=email) JOIN Perfumaria.perf.utilizador ON funcionario.email=utilizador.email)
    WHERE compra.numero=@numero
END
GO

DROP PROCEDURE perf.getProductFilters;
GO

CREATE PROCEDURE perf.getProductFilters
    @deleted BIT = NULL,
    @nome VARCHAR(30) = NULL,
    @marca VARCHAR(30) = NULL,
    @categoria VARCHAR(30) = NULL,
    @destinatario VARCHAR(10) = NULL,
    @orderby VARCHAR(50) = NULL,
    @ordem VARCHAR(30) = NULL
AS
BEGIN
        SET NOCOUNT ON
        IF (@ordem = 'Ascendente')
        BEGIN
            SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE stock > 0 AND
                  deleted = 0 AND
                  nome LIKE ('%'+ISNULL(@nome, nome)+'%') AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria) 
            ORDER BY CASE WHEN @orderby='Nome' THEN nome END,
                     CASE WHEN @orderby='Marca' THEN marca END,
                     CASE WHEN @orderby='Categoria' THEN categoria END,
                     CASE WHEN @orderby='Preço' THEN preco END
        END

        ELSE IF (@ordem = 'Descendente')
        BEGIN
            SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE stock > 0 AND
                  deleted = 0 AND
                  nome LIKE ('%'+ISNULL(@nome, nome)+'%') AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria)
            ORDER BY CASE WHEN @orderby='Nome' THEN nome END DESC,
                     CASE WHEN @orderby='Marca' THEN marca END DESC,
                     CASE WHEN @orderby='Categoria' THEN categoria END DESC,
                     CASE WHEN @orderby='Preço' THEN preco END DESC
        END
            
END
GO

DROP PROCEDURE perf.getProductFiltersFunc;
GO

CREATE PROCEDURE perf.getProductFiltersFunc
    @deleted BIT = NULL,
    @nome VARCHAR(30) = NULL,
    @marca VARCHAR(30) = NULL,
    @categoria VARCHAR(30) = NULL,
    @destinatario VARCHAR(10) = NULL,
    @orderby VARCHAR(50) = NULL,
    @ordem VARCHAR(30) = NULL
AS
BEGIN
        SET NOCOUNT ON
        IF (@ordem = 'Ascendente')
        BEGIN
            SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE
                  nome LIKE ('%'+ISNULL(@nome, nome)+'%') AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria) 
            ORDER BY CASE WHEN @orderby='Nome' THEN nome END,
                     CASE WHEN @orderby='Marca' THEN marca END,
                     CASE WHEN @orderby='Categoria' THEN categoria END,
                     CASE WHEN @orderby='Preço' THEN preco END
        END

        ELSE IF (@ordem = 'Descendente')
        BEGIN
            SELECT id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted
            FROM Perfumaria.perf.produto
            WHERE
                  nome LIKE ('%'+ISNULL(@nome, nome)+'%') AND
                  marca = ISNULL(@marca,marca) AND
                  categoria = ISNULL(@categoria,categoria)
            ORDER BY CASE WHEN @orderby='Nome' THEN nome END DESC,
                     CASE WHEN @orderby='Marca' THEN marca END DESC,
                     CASE WHEN @orderby='Categoria' THEN categoria END DESC,
                     CASE WHEN @orderby='Preço' THEN preco END DESC
        END
            
END
GO

DROP PROCEDURE perf.Login;
GO


CREATE PROCEDURE perf.Login
    @email VARCHAR(255),
    @password VARCHAR(25),
    @responseMessage VARCHAR(250)='' OUTPUT,
    @type BIT=0 OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    IF EXISTS (SELECT TOP 1 email FROM Perfumaria.perf.utilizador WHERE email = @email)
    BEGIN
        SET @email=(SELECT email FROM Perfumaria.perf.utilizador
        WHERE email=@email AND pw=HASHBYTES('SHA2_512', @password))

        IF(@email IS NULL)
        BEGIN
            SET @type=0
            SET @responseMessage='Incorrect password'
        END
        ELSE 
        BEGIN
           SET @responseMessage='User successfully logged in'
           IF EXISTS (SELECT TOP 1 email FROM Perfumaria.perf.funcionario WHERE email = @email)
            SET @type = 1
           ELSE
            SET @type = 0
        END
    END
    ELSE
        BEGIN
		    SET @type=0
		    SET @responseMessage='Invalid login'
        END

END
GO

DROP PROCEDURE perf.newBuy;
GO

CREATE PROCEDURE perf.newBuy
    @contribuinte CHAR(9),
    @pagamento VARCHAR(10),
    @clienteemail VARCHAR(255),
    @contacto INT,
    @presente BIT,
    @pontosgastos INT = NULL,
    @pontosacumulados INT = NULL,
    @compra INT OUTPUT,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO Perfumaria.perf.compra
        (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados)
        VALUES(@contribuinte, GETDATE(), @pagamento, @clienteemail, @pontosgastos, @pontosacumulados)

        SELECT @compra = numero FROM Perfumaria.perf.compra WHERE numero = @@Identity

        INSERT INTO Perfumaria.perf.compra_online
        (numero, presente, contactoid)
        VALUES(@compra, @presente, @contacto)
        
        SET @responseMessage='Success'
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='Failure'
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.RegisterFunc
GO


CREATE PROCEDURE perf.RegisterFunc
    @email VARCHAR(255),
    @password VARCHAR(25),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @sexo BIT,
    @dataNasc DATE,
    @foto VARCHAR(100),
    @salario INT,
    @administrator TINYINT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO Perfumaria.perf.utilizador
        (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto)
    VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @password), @sexo, @dataNasc, @foto)

    INSERT INTO Perfumaria.perf.funcionario
        (email, administrator, salario)
    VALUES(@email, @administrator, @salario)

    SET @responseMessage='Success'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.RegisterClient
GO


CREATE PROCEDURE perf.RegisterClient
    @email VARCHAR(255),
    @password VARCHAR(25),
    @contribuinte CHAR(9),
    @fname VARCHAR(20),
    @lname VARCHAR(20),
    @sexo BIT,
    @dataNasc DATE,
    @foto VARCHAR(100),
    @pontos INT = 0,
    @newsletter BIT,
    @pagamento VARCHAR(10) = null,
    @responseMessage VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO Perfumaria.perf.utilizador
        (email, contribuinte, fname, lname, pw, sexo, dataNasc, foto)
    VALUES(@email, @contribuinte, @fname, @lname, HASHBYTES('SHA2_512', @password), @sexo, @dataNasc, @foto)

    INSERT INTO Perfumaria.perf.cliente
        (email, pontos, newsletter, pagamento)
    VALUES(@email, @pontos, @newsletter, @pagamento)

    SET @responseMessage='Success'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
        ROLLBACK
    END CATCH

END
GO


DROP PROCEDURE perf.removeContact
GO

CREATE PROCEDURE perf.removeContact
    @id INT,
    @email VARCHAR(255),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRANSACTION
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM Perfumaria.perf.contacto WHERE utilizador_email=@email AND id=@id)
            BEGIN
            IF EXISTS (SELECT 1 FROM Perfumaria.perf.utilizador WHERE email=@email AND contacto_default_id = @id)
                SET @responseMessage='Não é possível remover o contacto default.'
            ELSE
            BEGIN
                UPDATE Perfumaria.perf.contacto
                SET visibilidade=0
                WHERE id=@id
                SET @responseMessage='Success'
                END
            END
        ELSE
            SET @responseMessage='Permition denied'
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SET @responseMessage='ERRO' 
        ROLLBACK
    END CATCH

END
GO

DROP PROCEDURE perf.updateClient;
GO

CREATE PROCEDURE perf.updateClient
	@email VARCHAR(255), 
    @password VARCHAR(25) = NULL,
    @fname VARCHAR(20) = NULL,
    @lname VARCHAR(20) = NULL,
	@newsletter BIT = NULL,
	@pagamento VARCHAR(10) = NULL,
    @responseMsg nvarchar(250) output
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON

	BEGIN TRY

		IF @fname IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET fname = @fname
			WHERE email = @email
		END

		IF @lname IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET lname = @lname
			WHERE  email = @email
		END

		IF @password IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.utilizador
			SET pw = hashbytes('SHA2_512', @password)
			WHERE  email = @email
		END

		IF @newsletter IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.cliente
			SET newsletter = @newsletter
			WHERE  email = @email
		END

		IF @pagamento IS NOT NULL
		BEGIN
			UPDATE Perfumaria.perf.cliente
			SET pagamento = @pagamento
			WHERE  email = @email
		END

		SET @responseMsg='Success'
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @responseMsg='Erro'
		ROLLBACK
	END CATCH
END
GO

DROP PROCEDURE perf.updateFunc;
GO

CREATE PROCEDURE perf.updateFunc
	@email VARCHAR(255), 
    @admin TINYINT = null,
    @salario INT = null,
    @pw VARCHAR(25) = null,
    @emailOP VARCHAR(255)=null,
    @responseMsg nvarchar(250) output
AS
BEGIN
    BEGIN TRANSACTION
	SET NOCOUNT ON

	BEGIN TRY
        IF @admin IS NOT NULL
		BEGIN
            IF EXISTS (SELECT administrator FROM Perfumaria.perf.funcionario WHERE email = @email AND administrator = 2)
            BEGIN
                UPDATE Perfumaria.perf.funcionario
                SET administrator = @admin
                WHERE  email = @emailOP
				SET @responseMsg='Success'
            END
            ELSE
                RAISERROR ('Insuficient Permissions.', 14, 1);
		END

        IF @salario IS NOT NULL
		BEGIN
            IF EXISTS (SELECT administrator FROM Perfumaria.perf.funcionario WHERE email = @email AND administrator = 2)
            BEGIN
                UPDATE Perfumaria.perf.funcionario
                SET salario = @salario
                WHERE  email = @emailOP
				SET @responseMsg='Success'
            END
            ELSE
                RAISERROR ('Insuficient Permissions.', 14, 1);
		END

        IF @pw IS NOT NULL
            BEGIN
                UPDATE Perfumaria.perf.utilizador
                SET pw = hashbytes('SHA2_512', @pw)
                WHERE  email = @email
                SET @responseMsg='Success'
            END

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @responseMsg='Failed'
        ROLLBACK
	END CATCH
END
GO

DROP PROCEDURE perf.updateMarc;
GO


CREATE PROCEDURE perf.updateMarc
	@cliente_email VARCHAR(255),
    @idMarc INT,
    @funcionario_email VARCHAR(255),
    @dataMarc DATETIME = null,
	@responseMessage NVARCHAR(250) = 'Erro! Tente noutra hora.' OUTPUT
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		SET NOCOUNT ON
			IF EXISTS (SELECT email=@funcionario_email from Perfumaria.perf.funcionario)
			BEGIN
				
				IF (@dataMarc IS NOT NULL)
				BEGIN
					BEGIN TRY
						DECLARE @duracao INT
						SELECT @duracao=duracao_media FROM Perfumaria.perf.funcionario_faz_servico join Perfumaria.perf.marcacao on funcionario_faz_servico.servico_id=marcacao.servico_id
								WHERE marcacao.funcionario_email=@funcionario_email  
										AND marcacao.deleted = 0 
										AND marcacao.id=@idMarc
										AND funcionario_faz_servico.funcionario_email=@funcionario_email
							IF (@duracao IS NOT NULL AND @dataMarc > GETDATE()) 
							BEGIN
		 						IF (EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE (dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, @dataMarc)) AND @funcionario_email=funcionario_email) OR EXISTS(SELECT 1 FROM Perfumaria.perf.marcacao WHERE dataMarc BETWEEN @dataMarc AND DATEADD(mi, @duracao, dataMarc) AND cliente_email=@cliente_email))
									SET @responseMessage = 'Hora não disponível!'
								ELSE
								BEGIN
									UPDATE Perfumaria.perf.marcacao
									SET dataMarc=@dataMarc
									WHERE id=@idMarc
									SET @responseMessage='Marcação efetuado com sucesso!'
								END
							END
					END TRY
					BEGIN CATCH
						SET @responseMessage='Failure'
					END CATCH
				END

				
			END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @responseMessage='Failed'
		ROLLBACK
	END CATCH 
END
GO

DROP PROCEDURE perf.verifyPaymentContact
GO

CREATE PROCEDURE perf.verifyPaymentContact
    @utilizador_email VARCHAR(255),
    @contacto INT OUTPUT,
    @pagamento VARCHAR(10) OUTPUT,
    @result BIT = 0 OUTPUT
AS
BEGIN
    SET NOCOUNT ON
        IF EXISTS(SELECT contacto_default_id, pagamento FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.cliente ON utilizador.email = cliente.email WHERE utilizador.email = @utilizador_email) 
		BEGIN
		SELECT @contacto = contacto_default_id, @pagamento = pagamento FROM Perfumaria.perf.utilizador JOIN Perfumaria.perf.cliente ON utilizador.email = cliente.email WHERE utilizador.email = @utilizador_email
        SET @result = 1
		END
        ELSE
        SET @result = 0
		
END
GO

--------
-----------
-------------INDEX
-----------
--------

DROP INDEX idx_produto on Perfumaria.perf.produto;
GO

CREATE INDEX idx_produto
ON Perfumaria.perf.produto (preco, marca, nome, categoria);
GO

--------
-----------
------------INSERTS
-----------
--------

-- produto

INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (75.25, 'Cítrico Masculino', 'Eau de Toilette', 'Wanted', 'AZZARO', 'Azzaro Wanted', 100, 'Azzaro Wanted é um tributo a uma nova forma de masculinidade livre e resplandecente. Uma eau de toilette amadeirada, cítrica e condimentada com um rasto cativante e elegante.', 'https://www.perfumesecompanhia.pt/fotos/produtos/3351500002696.jpg', 2, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (71.3, 'Amadeirado Masculino', 'Eau de Toilette', 'Wanted', 'AZZARO', 'Azzaro Wanted', 100, 'Azzaro Wanted é um tributo a uma nova forma de masculinidade livre e resplandecente. Uma eau de toilette amadeirada, cítrica e condimentada com um rasto cativante e elegante.', 'https://www.perfumesecompanhia.pt/fotos/produtos/3351500002696.jpg', 3, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (81.65, 'Amadeirado Masculino', 'Eau de Toilette', 'Pour Homme', 'AZZARO', 'Azzaro Pour Homme', 100, 'Azzaro Pour Homme é um perfume de sedução em estado puro, talhado pela elegância e pelo requinte italiano.', 'https://www.perfumesecompanhia.pt/fotos/produtos/3351500980543_1.jpg', 1, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (27.2, 'Deo Spray', 'Pour Homme', 'AZZARO', 'Azzaro Pour Homme', 150, 'Num gesto só, este spray oferece uma proteção eficaz de longa duração e uma sensação de frescura, durante todo o dia. ', 'https://www.perfumesecompanhia.pt/fotos/produtos/3351500002771_1.jpg', 4, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (77.3, 'Floral Feminino', 'Eau de Parfum', '212 Vip Rosé', 'CAROLINA HERRERA', 50, 'Atrevida, sofisticada, sempre pronta para a acção de noite & dia, o NOVO 212 VIP ROSÉ Eau de Parfum introduz uma ainda maior sedução ao universo! ', 'https://www.perfumesecompanhia.pt/fotos/produtos/8411061777176.jpg', 10, 'Mulher', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (75.25, 'Eau de Toilette', 'Under The Pole', 'AZZARO', 'Azzaro Chrome', 100, 'A assinatura emblemática de Chrome —um acorde cítrico e amadeirado, ao qual se acrescenta um grande coração aquático, que inspira frescura e força — é reinterpretada numa fórmula original 100% sem álcool, substituído pela água. ', 'https://www.perfumesecompanhia.pt/fotos/produtos/3351500009756_1.jpg', 3, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (78.71, 'Oriental Masculino', 'Eau de Toilette', 'The Scent', 'HUGO BOSS', 'The Scent', 50, 'Uma fragrância irresistível e inesquecível como o sabor da sedução. Notas exclusivas de gengibre, Maninka e couro que se revelam ao longo do tempo, seduzindo os sentidos.', 'https://www.perfumesecompanhia.pt/fotos/produtos/0737052972268.jpg', 3, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (104.95, 'Oriental Masculino', 'Eau de Toilette', 'The Scent', 'HUGO BOSS', 'The Scent', 100, 'Uma fragrância irresistível e inesquecível como o sabor da sedução. Notas exclusivas de gengibre, Maninka e couro que se revelam ao longo do tempo, seduzindo os sentidos.', 'https://www.perfumesecompanhia.pt/fotos/produtos/0737052972268.jpg', 4, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (140.65, 'Oriental Masculino', 'Eau de Toilette', 'The Scent', 'HUGO BOSS', 'The Scent', 200, 'Uma fragrância irresistível e inesquecível como o sabor da sedução. Notas exclusivas de gengibre, Maninka e couro que se revelam ao longo do tempo, seduzindo os sentidos.', 'https://www.perfumesecompanhia.pt/fotos/produtos/0737052972268.jpg', 5, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (27.3, 'Oriental Masculino', 'Deo Stick', 'The Scent', 'HUGO BOSS', 'The Scent', 75, 'Uma fragrância irresistível e inesquecível como o sabor da sedução. Notas exclusivas de gengibre, Maninka e couro que se revelam ao longo do tempo, seduzindo os sentidos.', 'https://www.perfumesecompanhia.pt/fotos/produtos/0737052993546_1.jpg', 6, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (27.3, 'Oriental Masculino', 'Deo Spray', 'The Scent', 'HUGO BOSS', 'The Scent', 150, 'Uma fragrância irresistível e inesquecível como o sabor da sedução. Notas exclusivas de gengibre, Maninka e couro que se revelam ao longo do tempo, seduzindo os sentidos.', 'https://www.perfumesecompanhia.pt/fotos/produtos/0737052992785_1.jpg', 7, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, imagem, stock, destinatario, deleted) VALUES (72.5, 'Eau de Toilette', 'Bad Boy', 'CAROLINA HERRERA', 'Bad Boy', 50, 'https://www.perfumesecompanhia.pt/fotos/produtos/8411061926093_1.jpg', 2, 'Mulher', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, imagem, stock, destinatario, deleted) VALUES (47.5, 'Body Cream', 'Light Blue', 'DOLCE&GABBANA', 'Light Blue', 200, 'https://www.perfumesecompanhia.pt/fotos/produtos/3423473020219_1.jpg', 5, 'Mulher', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, imagem, stock, destinatario, deleted) VALUES (77.9, 'Coffret', 'The Scent', 'HUGO BOSS', 'The Scent', 'https://www.perfumesecompanhia.pt/fotos/produtos/3614229279337_1.jpg', 5, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, imagem, stock, destinatario, deleted) VALUES (22.28, 'Eau de Toilette', 'Tommy', 'TOMMY HILFIGER', 'Tommy', 30, 'https://www.perfumesecompanhia.pt/fotos/produtos/0022548055373.jpg', 2, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, imagem, stock, destinatario, deleted) VALUES (39.95, 'Eau de Toilette', 'Tommy', 'TOMMY HILFIGER', 'Tommy', 50, 'https://www.perfumesecompanhia.pt/fotos/produtos/0022548055373.jpg', 3, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, imagem, stock, destinatario, deleted) VALUES (50.2, 'Eau de Toilette', 'Tommy', 'TOMMY HILFIGER', 'Tommy', 100, 'https://www.perfumesecompanhia.pt/fotos/produtos/0022548055373.jpg', 4, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, linha, tamanho, imagem, stock, destinatario, deleted) VALUES (24, 'Anti-Perspirant Deodorant ', 'Tommy', 'TOMMY HILFIGER', 'Tommy', 75, 'https://www.perfumesecompanhia.pt/fotos/produtos/0022548024355_1.jpg', 2, 'Homem', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, tamanho, imagem, stock, destinatario, deleted) VALUES (29.7, 'Eau de Toilette', 'Tommy Girl', 'TOMMY HILFIGER', 30, 'https://www.perfumesecompanhia.pt/fotos/produtos/0022548055380.jpg', 5, 'Mulher', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, tamanho, imagem, stock, destinatario, deleted) VALUES (39.95, 'Eau de Toilette', 'Tommy Girl', 'TOMMY HILFIGER', 50, 'https://www.perfumesecompanhia.pt/fotos/produtos/0022548055380.jpg', 6, 'Mulher', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (47.45, 'Eau de Cologne', 'Baby', 'TOUS', 100, 'Ninguém é mais espontâneo que os pequenos da casa. Eles e o seu mundo contagiam-nos de alegria e entusiasmo, delicadeza e ternura. Fazem-nos recordar nas memórias mais profundas, a criança que todos temos dentro de nós.', 'https://www.perfumesecompanhia.pt/fotos/produtos/8436038831125.jpg', 4, 'Criança', 0)
INSERT INTO Perfumaria.perf.produto (preco, familiaolfativa, categoria, nome, marca, tamanho, descricao, imagem, stock, destinatario, deleted) VALUES (43, 'Floral Feminino', 'Eau de Senteur', 'Bébé', 'JACADI', 100, 'Perfume sem alcool para bébé (a partir dos 3 meses). Unisexo', 'https://www.perfumesecompanhia.pt/fotos/produtos/7613107400012_1.jpg', 5, 'Criança', 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, tamanho, imagem, stock, deleted) VALUES (38.65, 'Desmaquilhante Olhos', 'Bi-Facil', 'LANCÔME', 125, 'https://www.perfumesecompanhia.pt/fotos/produtos/3147758030334.jpg', 6, 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, tamanho, descricao, imagem, stock, deleted) VALUES (22, 'Tónico de Banho', 'Corpo', 'CLARINS', 200, 'Para transformar cada cm² da sua pele e a tornar mais lisa e bela - mais tonificada, mais fina e maravilhosamente nutrida. ', 'https://www.perfumesecompanhia.pt/fotos/produtos/3380810667103.jpg', 1, 0)
INSERT INTO Perfumaria.perf.produto (preco, categoria, nome, marca, tamanho, imagem, stock, deleted) VALUES (32.95, 'Cuidados de Pés', 'Bálsamo de Pés', 'GAMILA SECRET', 100, 'https://www.perfumesecompanhia.pt/fotos/produtos/8717625545688_1.jpg', 3, 0)

--promoção
-- INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ()

INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Azzaro', 5, '2020-03-24 06:30:50.000', '2020-07-24 06:30:50.000')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Natal', 15, '2020-12-20 06:30:50.000', '2020-12-25 06:30:50.000')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Black Weekend', 25, '2020-11-27 00:00:00.000', '2020-11-29 06:30:50.000')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Hugo Boss', 7, '2020-02-22 00:00:00.001', '2020-11-29 06:30:50.001')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Carolina Herrera', 10, '2020-03-27 00:00:00.002', '2020-11-29 06:30:50.002')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Tommy Hilfiger', 10, '2020-04-27 00:00:00.003', '2020-11-29 06:30:50.003')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Dia da Mãe', 12, '2021-05-01 00:00:00.003', '2021-05-04 00:00:00.003')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Dia dos Namorados', 14, '2021-02-10 00:00:00.003', '2021-02-15 00:00:00.003')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Dia do Pai', 9, '2021-03-17 00:00:00.003', '2021-03-20 00:00:00.003')
INSERT INTO Perfumaria.perf.promocao (nome, desconto, datainicio, datafim) VALUES ('Páscoa', 11, '2021-04-10 00:00:00.003', '2021-04-13 00:00:00.003')

--cupão
--INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('', '', '', )

INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('INICIOVERA', '2020-07-24 06:30:50.000', '2020-08-24 06:30:50.000', 50)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('FIMVERAO20', '2020-09-24 06:30:50.000', '2020-10-24 06:30:50.000', 150)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('ASTRGDEW32', '2019-07-24 06:30:50.000', '2020-08-24 06:30:50.000', 50)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('YD60RJR24P', '2020-03-24 06:30:50.000', '2022-08-24 06:30:50.000', 200)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('5VMGOKER2V', '2020-10-24 02:30:50.000', '2020-11-24 06:30:50.000', 50)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('JCZTWIBT7D', '2023-07-24 10:30:50.000', '2025-08-24 06:30:50.000', 300)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('FU37L2GRMQ', '2021-07-24 06:30:50.000', '2022-08-24 06:30:50.000', 400)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('C69RTAUFQJ', '2020-07-24 00:30:50.000', '2020-08-30 06:30:50.000', 150)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('WIHKFJ8VVH', '2020-12-24 06:30:50.000', '2021-01-24 06:30:50.000', 2000)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('JCZTW2BT7D', '2020-02-24 06:30:50.000', '2025-08-24 06:30:50.000', 50)
INSERT INTO Perfumaria.perf.cupao (id, datainicio, datafim, pontos_atribuidos) VALUES ('1U37L2GRMQ', '2020-01-24 06:30:50.000', '2022-08-24 06:30:50.000', 100)

--utilizador (cliente e funcionario)

DECLARE @responseMessage VARCHAR(250);
        EXEC perf.RegisterFunc @email='franciscopereira@gmail.com', @contribuinte='287567665', @fname='Francisco', @lname='Pereira', @password='fpereira10', @sexo=1, @dataNasc='1987-05-08', @foto='https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg', @administrator=0, @salario=700, @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='joseferreira@hotmail.pt', @contribuinte='457253189', @fname='José', @lname='Ferreira', @password='zeferreira01', @sexo=1, @dataNasc='1994-02-03', @foto='https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg', @pontos=50, @newsletter=0, @pagamento='MasterCard', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterFunc @email='beatrizsantos_01@outlook.com', @contribuinte='998232166', @fname='Beatriz', @lname='Santos', @password='beaSantos!', @sexo=0, @dataNasc='2002-01-23', @foto='https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg',  @administrator=2, @salario=1200, @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='pedrofernandes230@gmail.com', @contribuinte='397543100', @fname='Pedro', @lname='Fernandes', @password='pedrito02', @sexo=1, @dataNasc='1998-12-06', @foto='https://images.pexels.com/photos/594610/pexels-photo-594610.jpeg', @pontos=0, @newsletter=0, @pagamento='Paypal', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='antonio_ze@gmail.com', @contribuinte='302167890', @fname='Antonio', @lname='Silva', @password='Antonioze2', @sexo=1, @dataNasc='1960-11-04', @foto='https://images.pexels.com/photos/1138903/pexels-photo-1138903.jpeg', @pontos=100, @newsletter=0, @pagamento='Visa', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='carolinasilva09@hotmail.com', @contribuinte='592165320', @fname='Carolina', @lname='Silva', @password='carolSilvaaa', @sexo=0, @dataNasc='1995-09-14', @foto='https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg', @pontos=100, @newsletter=1, @pagamento='Visa', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='sofiabarbosa@live.pt', @contribuinte='943212111', @fname='Sofia', @lname='Barbosa', @password='sofiBarbosa', @sexo=0, @dataNasc='1999-05-12', @foto='https://images.pexels.com/photos/1036622/pexels-photo-1036622.jpeg', @pontos=0, @newsletter=0, @pagamento='MB Way', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='sarapereiraa5@gmail.pt', @contribuinte='123222985', @fname='Sara', @lname='Pereira', @password='SaraaPer1', @sexo=0, @dataNasc='2005-12-22', @foto='https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg', @pontos=200, @newsletter=1, @pagamento='Paypal', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='pipamoreira@gmail.com', @contribuinte='445976504', @fname='Filipa', @lname='Moreira', @password='pipamor', @sexo=0, @dataNasc='1990-07-07', @foto='https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg', @pontos=150, @newsletter=1, @pagamento='MB Way', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='beazinha@hotmail.com', @contribuinte='455129988', @fname='Beatriz', @lname='Ferreira', @password='beazinha', @sexo=0, @dataNasc='2000-05-05', @foto='https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg', @pontos=50, @newsletter=0, @pagamento='MasterCard', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='alexandraneves@gmail.com', @contribuinte='178495829', @fname='Alexandra', @lname='Neves', @password='aneves2004', @sexo=0, @dataNasc='2004-10-06', @foto='https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260', @pontos=100, @newsletter=0, @pagamento='Visa', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='carlosa24@outmail.com', @contribuinte='125873530', @fname='Carlos', @lname='Amorim', @password='carlosa24', @sexo=1, @dataNasc='1972-06-24', @foto='https://images.pexels.com/photos/1300402/pexels-photo-1300402.jpeg', @pontos=0, @newsletter=1, @pagamento='Paypal', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterFunc @email='adrialmeida08@live.pt', @contribuinte='573975939', @fname='Adriana', @lname='Almeida', @password='adri08', @sexo=0, @dataNasc='1999-02-08', @foto='https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg',  @administrator=1, @salario=850, @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='anagonçalves1985@gmail.com', @contribuinte='258759872', @fname='Ana', @lname='Gonçalves', @password='ana1985', @sexo=0, @dataNasc='1985-01-20', @foto='https://images.pexels.com/photos/1587009/pexels-photo-1587009.jpeg', @pontos=250, @newsletter=0, @pagamento='MB Way', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='aliceamaral1@hotmail.com', @contribuinte='287352385', @fname='Alice', @lname='Amaral', @password='amaralice', @sexo=0, @dataNasc='2000-05-01', @foto='https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg', @pontos=0, @newsletter=1, @pagamento='MB Way', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='afonsomelooo@outlook.com', @contribuinte='821358756', @fname='Afonso', @lname='Melo', @password='melooo15', @sexo=1, @dataNasc='1989-09-15', @foto='https://images.pexels.com/photos/374044/pexels-photo-374044.jpeg', @pontos=0, @newsletter=1, @pagamento='MB Way', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='andralves@gmail.com', @contribuinte='602941753', @fname='André', @lname='Alves', @password='Andralves', @sexo=1, @dataNasc='2002-02-02', @foto='https://images.pexels.com/photos/1384219/pexels-photo-1384219.jpeg', @pontos=50, @newsletter=0, @pagamento='Paypal', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='alexandrelima25@hotmail.com', @contribuinte='219589974', @fname='Alexandre', @lname='Lima', @password='alexxlima', @sexo=1, @dataNasc='1965-12-25', @foto='https://images.pexels.com/photos/834863/pexels-photo-834863.jpeg', @pontos=100, @newsletter=1, @pagamento='Visa', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='anitinhasousa@live.pt', @contribuinte='476638927', @fname='Anita', @lname='Sousa', @password='anitinha1', @sexo=0, @dataNasc='1998-03-14', @foto='https://images.pexels.com/photos/709802/pexels-photo-709802.jpeg', @pontos=0, @newsletter=1, @pagamento='MasterCard', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterClient @email='paulomatos31@gmail.com', @contribuinte='593967351', @fname='Paulo', @lname='Matos', @password='pauloo', @sexo=1, @dataNasc='1979-05-31', @foto='https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg', @pontos=0, @newsletter=1, @pagamento='Visa', @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

        EXEC perf.RegisterFunc @email='Criscosta@outlook.com', @contribuinte='129885782', @fname='Cristiana', @lname='Costa', @password='cris16', @sexo=0, @dataNasc='1970-10-16', @foto='https://images.pexels.com/photos/247322/pexels-photo-247322.jpeg',  @administrator=0, @salario=750, @responseMessage = @responseMessage OUTPUT;
        SELECT @responseMessage AS rm;

--contacto
--INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('', '', , '', '', '', '', '')

INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, localidade) VALUES ('pipamoreira@gmail.com', '914363252', 0, '3780-548', 'Portugal', 'Rua das Palmeiras', 'Tamengos')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('franciscopereira@gmail.com', '924763965', 1, '3810-082', 'Portugal', 'Avenida 5 de Outubro', 'Nº9', 'Aveiro')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('pedrofernandes230@gmail.com', '914274915', 1, '4750-765', 'Portugal', 'Rua do Rego', 'Nº5', 'Ucha')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('beazinha@hotmail.com', '964829602', 1, '4705-475', 'Portugal', 'Rua dos Azinhais', 'Nº6', 'Esporões')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('beatrizsantos_01@outlook.com', '935502152', 0, '4715-475', 'Portugal', 'Rua do Souto', 'Nº5, 2º Esquerdo', 'Pedralva')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('adrialmeida08@live.pt', '914628560', 0, '2650-476', 'Portugal', 'Rua Olival de Cambra', 'Nº2, 3º Esquerdo', 'Amadora')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('Criscosta@outlook.com', '963926453', 0, '4420-133', 'Portugal', 'Rua Doutor Lopes Cardoso', 'Nº 3', 'Gondomar')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('carlosa24@outmail.com', '921547935', 1, '4635-265', 'Portugal', 'Rua de Lenteiros', 'Nº 5, 3º Direito', 'Santo Isidoro MCN')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('anagonçalves1985@gmail.com', '918426539', 1, '4455-110', 'Portugal', 'Travessa Francisco dos Santos', 'Nº 3', 'Lavra')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('aliceamaral1@hotmail.com', '963159731', 1, '4580-294', 'Portugal', 'Rua dos Agreões', 'Nº 7', 'Paredes')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, localidade) VALUES ('andralves@gmail.com', '936267422', 1, '4575-366', 'Portugal', 'Rua de Penidelo', 'Pinheiro PNF')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('paulomatos31@gmail.com', '926375015', 1, '2240-512', 'Portugal', 'Travessa da Capela', 'Nº3, 5º Direito', 'Paio Mendes')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('sarapereiraa5@gmail.pt', '963216832', 0, '2810-168', 'Portugal', 'Rua Doutor António Elvas', 'BMP 1, 3º Esquerdo', 'Almada')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, localidade) VALUES ('sofiabarbosa@live.pt', '915392054', 0, '2855-727', 'Portugal', 'Praça José Queluz', 'Corroios')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('antonio_ze@gmail.com', '964667921', 0, '2855-713', 'Portugal', 'Rua Mário Castrim', 'Nº 5', 'Corroios')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('carolinasilva09@hotmail.com', '962468333', 0, '4925-345', 'Portugal', 'Rua de Lamelas', 'Nº 7', 'Cardielos')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('andralves@gmail.com', '925488312', 0, '5460-335', 'Portugal', 'Rua Doutor João Chaves', 'Nº 4', 'Boticas')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, localidade) VALUES ('alexandrelima25@hotmail.com', '915424675', 0, '5110-012', 'Portugal', 'Rua do Bairro Novo', 'Aldeias AMM')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ('anitinhasousa@live.pt', '963215352', 1, '3750-864', 'Portugal', 'Travessa do Amaínho', 'Nº 2', 'Borralha')
INSERT INTO Perfumaria.perf.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, localidade) VALUES ('pipamoreira@gmail.com', '924583100', 1, '3750-492', 'Portugal', 'Travessa dos Agueiros', 'Fermentelos')

--compra

INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('397543100', '2020-03-24 06:30:50.000', 'Paypal', 'pedrofernandes230@gmail.com', 0, 5)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('258759872', '2020-03-24 10:30:50.000', 'MB Way', 'anagonçalves1985@gmail.com', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('457253189', '2020-03-25 06:30:50.000', 'MasterCard', 'joseferreira@hotmail.pt', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('302167890', '2020-03-25 22:30:50.000', 'Visa', 'antonio_ze@gmail.com', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('592165320', '2020-03-26 06:30:50.000', 'Visa', 'carolinasilva09@hotmail.com', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('592165320', '2020-03-27 06:30:50.000', 'Visa', 'carolinasilva09@hotmail.com', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('592165320', '2020-03-28 06:30:50.000', 'Visa', 'carolinasilva09@hotmail.com', 0, 10)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('457253189', '2020-03-28 06:31:50.001', 'MasterCard', 'joseferreira@hotmail.pt', 50, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('476638927', '2020-03-28 06:31:52.002', 'MasterCard', 'anitinhasousa@live.pt', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('476638927', '2020-03-28 06:32:50.003', 'MasterCard', 'anitinhasousa@live.pt', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('258759872', '2020-03-30 06:30:50.000', 'MB Way', 'anagonçalves1985@gmail.com', 0, 30)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('258759872', '2020-04-01 06:30:50.000', 'MB Way', 'anagonçalves1985@gmail.com', 0, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('258759872', '2020-04-01 07:30:50.000', 'MB Way', 'anagonçalves1985@gmail.com', 0, 40)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('397543100', '2020-04-01 07:40:50.001', 'Paypal', 'pedrofernandes230@gmail.com', 20, 0)
INSERT INTO Perfumaria.perf.compra (contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados) VALUES ('602941753', '2020-04-01 07:50:50.002', 'Paypal', 'andralves@gmail.com', 100, 0)

--serviço

INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Depilação', 45.5)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Sobrancelhas', 7.5)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Axilas', 12.8)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Máscara de Rosto', 9.5)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Manicure', 15)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Pedicure', 10)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Fotodepilação', 85)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Massagem Costas', 35.7)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Pressoterapia', 24.5)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Tratamento anti-celulite', 47)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Lifting Pestanas', 14.99)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Maquilhagem', 17.9)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Verniz gel', 13)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Gel', 19.99)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Acrílico', 25.15)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Massagem Rosto', 23)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Drenagem Linfática', 67.9)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Peeling Corporal', 20.15)
INSERT INTO Perfumaria.perf.servico (tipo, preco) VALUES ('Limpeza de pele', 71)

--cliente_usa_cupao

INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('joseferreira@hotmail.pt', 'JCZTW2BT7D')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('antonio_ze@gmail.com', '1U37L2GRMQ')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('carolinasilva09@hotmail.com', '1U37L2GRMQ')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('sarapereiraa5@gmail.pt', 'YD60RJR24P')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('pipamoreira@gmail.com', 'JCZTW2BT7D')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('pipamoreira@gmail.com', '1U37L2GRMQ')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('beazinha@hotmail.com', 'JCZTW2BT7D')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('alexandraneves@gmail.com', '1U37L2GRMQ')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('anagonçalves1985@gmail.com', 'YD60RJR24P')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('anagonçalves1985@gmail.com', 'JCZTW2BT7D')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('andralves@gmail.com', 'JCZTW2BT7D')
INSERT INTO Perfumaria.perf.cliente_usa_cupao (cliente_email, cupao_id) VALUES ('alexandrelima25@hotmail.com', '1U37L2GRMQ')

--clientefavorita

INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('beazinha@hotmail.com', 4)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('alexandraneves@gmail.com', 5)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('carlosa24@outmail.com', 6)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('anagonçalves1985@gmail.com', 7)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('aliceamaral1@hotmail.com', 12)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('afonsomelooo@outlook.com', 13)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('andralves@gmail.com', 14)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('alexandrelima25@hotmail.com', 15)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('anitinhasousa@live.pt', 3)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('paulomatos31@gmail.com', 4)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('afonsomelooo@outlook.com', 5)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('anagonçalves1985@gmail.com', 6)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('beazinha@hotmail.com', 16)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('carlosa24@outmail.com', 18)
INSERT INTO Perfumaria.perf.clientefavorita (clienteemail, produtoid) VALUES ('beazinha@hotmail.com', 20)

--produto_tem_promocao

INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 1, 1)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 2, 1)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 3, 1)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 4, 1)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 6, 1)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 5, 5)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 12, 5)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 7, 4)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 8, 4)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 9, 4)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 10, 4)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 11, 4)
INSERT INTO Perfumaria.perf.produto_tem_promocao (produtoid, promocaoid) VALUES ( 14, 4)

-- cosmética

INSERT INTO Perfumaria.perf.cosmetica (id, tipo) VALUES ( 23, 'Rosto')
INSERT INTO Perfumaria.perf.cosmetica (id, tipo) VALUES ( 24, 'Corpo')
INSERT INTO Perfumaria.perf.cosmetica (id, tipo) VALUES ( 25, 'Mãos e Pés')

--perfume

INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 1)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 2)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 3)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 4)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 5)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 6)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 7)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 8)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 9)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 10)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 11)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 12)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 13)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 14)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 15)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 16)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 17)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 18)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 19)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 20)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 21)
INSERT INTO Perfumaria.perf.perfume (id) VALUES ( 22)

--compra_presencial

INSERT INTO Perfumaria.perf.compra_presencial (numero, funcemail) VALUES ( 1, 'Criscosta@outlook.com')
INSERT INTO Perfumaria.perf.compra_presencial (numero, funcemail) VALUES ( 4, 'franciscopereira@gmail.com')
INSERT INTO Perfumaria.perf.compra_presencial (numero, funcemail) VALUES ( 5, 'Criscosta@outlook.com')
INSERT INTO Perfumaria.perf.compra_presencial (numero, funcemail) VALUES ( 9, 'Criscosta@outlook.com')
INSERT INTO Perfumaria.perf.compra_presencial (numero, funcemail) VALUES ( 12, 'franciscopereira@gmail.com')
INSERT INTO Perfumaria.perf.compra_presencial (numero, funcemail) VALUES ( 13, 'adrialmeida08@live.pt')

--compra_online

INSERT INTO Perfumaria.perf.compra_online (numero, rating, rastreamento, presente, contactoid) VALUES ( 2, '4', 'hWvk5n2S5YBwS08wHRO9', 1, 1)
INSERT INTO Perfumaria.perf.compra_online (numero, presente, contactoid) VALUES ( 3, 0, 4)
INSERT INTO Perfumaria.perf.compra_online (numero, rating, rastreamento, presente, contactoid) VALUES ( 6, '3', '8cfd8bwW2hR4cAxxkDTC', 0, 12)
INSERT INTO Perfumaria.perf.compra_online (numero, rating, observacao, presente, contactoid) VALUES ( 7, '5', 'Muito bom produto!', 0, 3)
INSERT INTO Perfumaria.perf.compra_online (numero, rating, observacao, presente, contactoid) VALUES ( 8, '4', 'Poderia ter sido mais rapido a ser entregue', 0, 7)
INSERT INTO Perfumaria.perf.compra_online (numero, presente, contactoid) VALUES ( 10, 1, 20)
INSERT INTO Perfumaria.perf.compra_online (numero, presente, contactoid) VALUES ( 11, 0, 11)
INSERT INTO Perfumaria.perf.compra_online (numero, rating, observacao, rastreamento, presente, contactoid) VALUES ( 14, '5', 'Bom produto e rápida entrega', 'pbFcSarhTbZqz5wTk7mk', 1, 1)
INSERT INTO Perfumaria.perf.compra_online (numero, presente, contactoid) VALUES ( 15, 0, 2)

--compra_tem_produto

INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 1, 13, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 2, 7, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 2, 2, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 2, 3, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 3, 6, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 4, 8, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 4, 20, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 4, 14, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 4, 10, 3)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 5, 1, 4)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 6, 8, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 7, 3, 3)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 8, 23, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 9, 11, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 10, 23, 3)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 11, 21, 4)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 12, 15, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 13, 13, 1)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 14, 1, 2)
INSERT INTO Perfumaria.perf.compra_tem_produto (compranumero, produtoid, unidades) VALUES ( 15, 3, 3)

--funcionario_faz_servico

INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 1, 90)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 3, 25)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 4, 10)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 7, 55)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 8, 15)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 9, 75)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 11, 5)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('franciscopereira@gmail.com', 19, 120)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 1, 80)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 2, 30)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 3, 30)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 5, 35)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 6, 20)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 10, 25)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 12, 20)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 13, 30)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 15, 20)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 18, 55)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('Criscosta@outlook.com', 19, 120)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('adrialmeida08@live.pt', 14, 40)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('adrialmeida08@live.pt', 16, 5)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('adrialmeida08@live.pt', 17, 25)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('adrialmeida08@live.pt', 18, 60)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('adrialmeida08@live.pt', 19, 120)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 1, 60)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 2, 20)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 3, 15)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 4, 8)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 5, 20)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 6, 15)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 7, 30)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 8, 15)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 9, 40)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 10, 25)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 11, 5)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 12, 15)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 13, 25)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 14, 30)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 15, 15)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 16, 5)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 17, 25)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 18, 45)
INSERT INTO Perfumaria.perf.funcionario_faz_servico (funcionario_email, servico_id, duracao_media) VALUES ('beatrizsantos_01@outlook.com', 19, 120)

--marcacao

INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('joseferreira@hotmail.pt', 1, 'franciscopereira@gmail.com', '2020-05-15 16:30:00')
INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('antonio_ze@gmail.com', 12, 'Criscosta@outlook.com', '2020-06-14 09:30:00')
INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('aliceamaral1@hotmail.com', 16, 'Criscosta@outlook.com', '2020-05-11 19:00:00')
INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('paulomatos31@gmail.com', 3, 'adrialmeida08@live.pt', '2020-06-03 15:00:00')
INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('alexandrelima25@hotmail.com', 9, 'franciscopereira@gmail.com', '2020-07-02 11:30:00')
INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('joseferreira@hotmail.pt', 4, 'Criscosta@outlook.com', '2020-05-17 17:30:00')
INSERT INTO Perfumaria.perf.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES ('alexandrelima25@hotmail.com', 19, 'franciscopereira@gmail.com', '2020-05-23 14:15:00')



