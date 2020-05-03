CREATE DATABASE Perfumaria;
GO

IF OBJECT_ID('Perfumaria.dbo.promocao', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.promocao
GO
CREATE TABLE Perfumaria.dbo.promocao
(
    id INT NOT NULL IDENTITY(1,1),
    nome VARCHAR(30) NOT NULL,
    desconto TINYINT CHECK(desconto BETWEEN 0 and 100) NOT NULL,
    datainicio SMALLDATETIME NOT NULL,
    datafim SMALLDATETIME NOT NULL,
    CONSTRAINT promocao_pk PRIMARY KEY (id)
);
GO

IF OBJECT_ID('Perfumaria.dbo.produto_tem_promocao', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.produto_tem_promocao
GO
CREATE TABLE Perfumaria.dbo.produto_tem_promocao
(
    produtoid INT NOT NULL,
    promocaoid INT NOT NULL,
    CONSTRAINT produto_tem_promocao_pk PRIMARY KEY  (produtoid, promocaoid)
);
GO

IF OBJECT_ID('Perfumaria.dbo.produto', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.produto
GO
CREATE TABLE Perfumaria.dbo.produto
(
    id INT NOT NULL IDENTITY(1,1),
    preco INT NOT NULL,
    familiaolfativa VARCHAR(30),
    categoria VARCHAR(30) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    linha VARCHAR(30) NOT NULL,
    tamanho SMALLINT,
    descricao VARCHAR(280),
    imagem VARCHAR(100) NOT NULL,
    stock SMALLINT NOT NULL,
    destinatario VARCHAR(10),

    CONSTRAINT produto_pk PRIMARY KEY  (id)
);
GO

IF OBJECT_ID('Perfumaria.dbo.perfume', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.perfume
GO
CREATE TABLE Perfumaria.dbo.perfume (
    id  INT NOT NULL,

    CONSTRAINT perfume_pk PRIMARY KEY  (id)
);
GO

IF OBJECT_ID('Perfumaria.dbo.cosmetica', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.cosmetica
GO
CREATE TABLE Perfumaria.dbo.cosmetica(
    id  INT NOT NULL,
    tipo    VARCHAR(30) NOT NULL,

    CONSTRAINT cosmetica_pk PRIMARY KEY (id)
)
GO

IF OBJECT_ID('Perfumaria.dbo.clientefavorita', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.clientefavorita
GO
CREATE TABLE Perfumaria.dbo.clientefavorita(
    clienteemail VARCHAR(255)    NOT NULL,
    produtoid   INT NOT NULL,

    CONSTRAINT clientefavorita_pk PRIMARY KEY (clienteemail, produtoid)
)
GO

IF OBJECT_ID('Perfumaria.dbo.cupao', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.cupao
GO
CREATE TABLE Perfumaria.dbo.cupao
(
    id  CHAR(10)    NOT NULL,
    datainicio  SMALLDATETIME   NOT NULL,
    datafim SMALLDATETIME   NOT NULL,
    pontos_atribuidos   INT NOT NULL,
    CONSTRAINT cupao_pk PRIMARY KEY (id)
);
GO

IF OBJECT_ID('Perfumaria.dbo.cliente_usa_cupao', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.cliente_usa_cupao
GO
CREATE TABLE Perfumaria.dbo.cliente_usa_cupao
(
    cliente_email   VARCHAR(255)    NOT NULL,
    cupao_id    CHAR(10)    NOT NULL,
    CONSTRAINT cliente_usa_cupao_pk PRIMARY KEY (cliente_email, cupao_id)
    
    
);
GO

IF OBJECT_ID('Perfumaria.dbo.cliente', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.cliente
GO
CREATE TABLE Perfumaria.dbo.cliente (
    email   VARCHAR(255)    NOT NULL,
    pontos  INT NOT NULL,
    newsletter  BIT  NOT NULL,
    pagamento   VARCHAR(10),
    
    CONSTRAINT cliente_pk PRIMARY KEY (email)
);
GO

IF OBJECT_ID('Perfumaria.dbo.utilizador', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.utilizador
GO
CREATE TABLE Perfumaria.dbo.utilizador
(
    email   VARCHAR(255)    NOT NULL,
    contribuinte    CHAR(9)     NOT NULL,
    fname   VARCHAR(20)     NOT NULL,
    lname   VARCHAR(20)     NOT NULL,
    pw  BINARY(64)  NOT NULL,
    sexo    BIT     NOT NULL,
    dataNasc    DATE    NOT NULL,
    foto    VARCHAR(100)    NOT NULL,
    contacto_default_id     INT,
    CONSTRAINT utilizador_pk PRIMARY KEY (email)
    
);
GO

IF OBJECT_ID('Perfumaria.dbo.funcionario', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.funcionario
GO
CREATE TABLE Perfumaria.dbo.funcionario
(
    email   VARCHAR(255)    NOT NULL,
    administrator   TINYINT NOT NULL,
    salario INT NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (email)
    
);
GO

IF OBJECT_ID('Perfumaria.dbo.contacto', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.contacto
GO
CREATE TABLE Perfumaria.dbo.contacto
(
    id   INT IDENTITY(1,1)   NOT NULL,
    utilizador_email    VARCHAR(255)     NOT NULL,
    telemovel   CHAR(9)     NOT NULL,
    visibilidade    BIT     NOT NULL,
    codigo_postal   CHAR(8)     NOT NULL,
    pais    VARCHAR(20)     NOT NULL,
    endereco    VARCHAR(50)     NOT NULL,
    apartamento     VARCHAR(50),
    localidade      VARCHAR(20) NOT NULL,
    
    CONSTRAINT contacto_pk PRIMARY KEY (id)
    
);
GO


IF OBJECT_ID('Perfumaria.dbo.compra_tem_produto', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.compra_tem_produto
GO
CREATE TABLE Perfumaria.dbo.compra_tem_produto
(
    compranumero    INT NOT NULL,
    produtoid   INT NOT NULL,
    unidades INT NOT NULL,
    
    CONSTRAINT compra_tem_produto_pk PRIMARY KEY (compranumero, produtoid)
);
GO


IF OBJECT_ID('Perfumaria.dbo.compra', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.compra
GO
CREATE TABLE Perfumaria.dbo.compra
(
    numero    INT NOT NULL IDENTITY(1,1),
    contribuinte    CHAR(9)     NOT NULL,
    datacompra  DATETIME    NOT NULL,
    pagamento   VARCHAR(10) NOT NULL,
    clienteemail    VARCHAR(255)    NOT NULL,
    pontosgastos INT,
    pontosacumulados    INT,
    
    CONSTRAINT compra_pk PRIMARY KEY (numero)
);
GO

IF OBJECT_ID('Perfumaria.dbo.servico', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.servico
GO
CREATE TABLE Perfumaria.dbo.servico
(
    id  INT IDENTITY(1,1)   NOT NULL,
    tipo VARCHAR(40)    NOT NULL,
    preco   FLOAT   NOT NULL,
    
    CONSTRAINT servico_pk PRIMARY KEY (id)
);
GO


IF OBJECT_ID('Perfumaria.dbo.funcionario_faz_servico', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.funcionario_faz_servico
GO
CREATE TABLE Perfumaria.dbo.funcionario_faz_servico
(
    funcionario_email   VARCHAR(255)   NOT NULL,
    servico_id  INT	NOT NULL,
    duracao_media   INT   NOT NULL,
    
    CONSTRAINT funcionario_faz_servico_pk PRIMARY KEY (funcionario_email, servico_id)
);
GO


IF OBJECT_ID('Perfumaria.dbo.compra_online', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.compra_online
GO
CREATE TABLE Perfumaria.dbo.compra_online
(
    numero    INT NOT NULL,
    rating    CHAR(1),
    descricao VARCHAR(280),
    rastreamento   VARCHAR(20),
    presente    BIT NOT NULL,
    contactoid  INT NOT NULL, 
    
    CONSTRAINT compra_online_pk PRIMARY KEY (numero)
);
GO

IF OBJECT_ID('Perfumaria.dbo.compra_presencial', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.compra_presencial
GO
CREATE TABLE Perfumaria.dbo.compra_presencial
(
    numero    INT NOT NULL,
    funcemail   VARCHAR(255)    NOT NULL, 
    
    CONSTRAINT compra_presencial_pk PRIMARY KEY (numero)
);
GO


IF OBJECT_ID('Perfumaria.dbo.marcacao', 'U') IS NOT NULL
DROP TABLE Perfumaria.dbo.marcacao
GO
CREATE TABLE Perfumaria.dbo.marcacao
(
    id  INT NOT NULL    IDENTITY(1,1),
    cliente_email   VARCHAR(255)    NOT NULL,
    servico_id  INT   NOT NULL,
    funcionario_email VARCHAR(255)  NOT NULL,
    data    DATETIME    NOT NULL,
    
    CONSTRAINT marcacao_pk PRIMARY KEY (id)
);
GO







ALTER TABLE Perfumaria.dbo.produto_tem_promocao ADD CONSTRAINT produto_tem_promocao_produtoid_fr FOREIGN KEY (produtoid) REFERENCES Perfumaria.dbo.produto(id);
ALTER TABLE Perfumaria.dbo.produto_tem_promocao ADD CONSTRAINT produto_tem_promocao_promocaoid_fr FOREIGN KEY (promocaoid) REFERENCES Perfumaria.dbo.promocao(id);

ALTER TABLE Perfumaria.dbo.perfume ADD CONSTRAINT perfume_id_fr FOREIGN KEY (id) REFERENCES Perfumaria.dbo.produto(id);

ALTER TABLE Perfumaria.dbo.cosmetica ADD CONSTRAINT cosmetica_id_fr FOREIGN KEY (id) REFERENCES Perfumaria.dbo.produto(id);

ALTER TABLE Perfumaria.dbo.clientefavorita ADD CONSTRAINT clientefavorita_clienteemail_fr FOREIGN KEY (clienteemail) REFERENCES Perfumaria.dbo.cliente(email);
ALTER TABLE Perfumaria.dbo.clientefavorita ADD CONSTRAINT clientefavorita_produtoid_fr FOREIGN KEY (produtoid) REFERENCES Perfumaria.dbo.produto(id);

ALTER TABLE Perfumaria.dbo.cliente_usa_cupao ADD CONSTRAINT clienteusacupao_clienteemail_fr FOREIGN KEY (cliente_email) REFERENCES Perfumaria.dbo.cliente(email);
ALTER TABLE Perfumaria.dbo.cliente_usa_cupao ADD CONSTRAINT clienteusacupao_cupaoid_fr FOREIGN KEY (cupao_id) REFERENCES Perfumaria.dbo.cupao(id);

ALTER TABLE Perfumaria.dbo.cliente ADD CONSTRAINT cliente_email_fr FOREIGN KEY (email) REFERENCES Perfumaria.dbo.cliente(email);

ALTER TABLE Perfumaria.dbo.utilizador ADD CONSTRAINT utilizador_contactodefaultid_fr FOREIGN KEY (contacto_default_id) REFERENCES Perfumaria.dbo.contacto(id);

ALTER TABLE Perfumaria.dbo.funcionario ADD CONSTRAINT funcionario_email_fr FOREIGN KEY (email) REFERENCES Perfumaria.dbo.utilizador(email);

ALTER TABLE Perfumaria.dbo.compra_tem_produto ADD CONSTRAINT compra_tem_produto_compranumero_fr FOREIGN KEY (compranumero) REFERENCES Perfumaria.dbo.compra(numero);
ALTER TABLE Perfumaria.dbo.compra_tem_produto ADD CONSTRAINT compra_tem_produto_produtoid_fr FOREIGN KEY (produtoid) REFERENCES Perfumaria.dbo.produto(id);

ALTER TABLE Perfumaria.dbo.contacto ADD CONSTRAINT contacto_utilizadoremail_fr FOREIGN KEY (utilizador_email) REFERENCES Perfumaria.dbo.utilizador(email);

ALTER TABLE Perfumaria.dbo.compra ADD CONSTRAINT compra_clienteemail_fr FOREIGN KEY (clienteemail) REFERENCES Perfumaria.dbo.cliente(email);

ALTER TABLE Perfumaria.dbo.funcionario_faz_servico ADD CONSTRAINT func_faz_serv_servicoid_fr FOREIGN KEY (servico_id) REFERENCES Perfumaria.dbo.servico(id);
ALTER TABLE Perfumaria.dbo.funcionario_faz_servico ADD CONSTRAINT func_faz_serv_funcionario_email_fr FOREIGN KEY (funcionario_email) REFERENCES Perfumaria.dbo.funcionario(email);

ALTER TABLE Perfumaria.dbo.compra_online ADD CONSTRAINT compra_online_numero_fr FOREIGN KEY (numero) REFERENCES Perfumaria.dbo.compra(numero);
ALTER TABLE Perfumaria.dbo.compra_online ADD CONSTRAINT compra_online_contactoid_fr FOREIGN KEY (contactoid) REFERENCES Perfumaria.dbo.contacto(id);

ALTER TABLE Perfumaria.dbo.compra_presencial ADD CONSTRAINT compra_presencial_numero_fr FOREIGN KEY (numero) REFERENCES Perfumaria.dbo.compra(numero);
ALTER TABLE Perfumaria.dbo.compra_presencial ADD CONSTRAINT compra_presencial_funcemail_fr FOREIGN KEY (funcemail) REFERENCES Perfumaria.dbo.funcionario(email);

ALTER TABLE Perfumaria.dbo.marcacao ADD CONSTRAINT marcacao_clienteemail_fr FOREIGN KEY (cliente_email) REFERENCES Perfumaria.dbo.cliente(email);
ALTER TABLE Perfumaria.dbo.marcacao ADD CONSTRAINT marcacao_servicoid_fr FOREIGN KEY (servico_id) REFERENCES Perfumaria.dbo.servico(id);
ALTER TABLE Perfumaria.dbo.marcacao ADD CONSTRAINT marcacao_funcemail_fr FOREIGN KEY (funcionario_email) REFERENCES Perfumaria.dbo.funcionario(email);