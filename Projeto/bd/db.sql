IF DB_ID('Perfumaria') IS NULL
CREATE DATABASE Perfumaria;
GO

USE Perfumaria;
GO

CREATE SCHEMA perf;
GO

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

