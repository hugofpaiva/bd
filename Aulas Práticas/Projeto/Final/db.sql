CREATE DATABASE perfumaria;
GO

IF OBJECT_ID('promocao', 'U') IS NOT NULL
DROP TABLE promocao
GO
CREATE TABLE promocao
(
    id INT NOT NULL IDENTITY(1,1),
    nome VARCHAR(30) NOT NULL,
    desconto TINYINT CHECK(desconto BETWEEN 0 and 100) NOT NULL,
    datainicio SMALLDATETIME NOT NULL,
    datafim SMALLDATETIME NOT NULL,
    CONSTRAINT promocao_pk PRIMARY KEY (id)
);
GO

IF OBJECT_ID('produto_tem_promocao', 'U') IS NOT NULL
DROP TABLE produto_tem_promocao
GO
CREATE TABLE produto_tem_promocao
(
    produtoid INT NOT NULL,
    promocaoid INT NOT NULL,
    CONSTRAINT produto_tem_promocao_pk PRIMARY KEY  (produtoid, promocaoid)
);
GO

IF OBJECT_ID('produto', 'U') IS NOT NULL
DROP TABLE produto
GO
CREATE TABLE produto
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

IF OBJECT_ID('perfume', 'U') IS NOT NULL
DROP TABLE perfume
GO
CREATE TABLE perfume (
    id  INT NOT NULL,

    CONSTRAINT perfume_pk PRIMARY KEY  (id)
);
GO

IF OBJECT_ID('cosmetica', 'U') IS NOT NULL
DROP TABLE cosmetica
GO
CREATE TABLE cosmetica(
    id  INT NOT NULL,
    tipo    VARCHAR(30) NOT NULL,

    CONSTRAINT cosmetica_pk PRIMARY KEY (id)
)
GO

IF OBJECT_ID('clientefavorita', 'U') IS NOT NULL
DROP TABLE clientefavorita
GO
CREATE TABLE clientefavorita(
    clienteemail VARCHAR(255)    NOT NULL,
    produtoid   INT NOT NULL,

    CONSTRAINT clientefavorita_pk PRIMARY KEY (clienteemail, produtoid)
)
GO

IF OBJECT_ID('cupao', 'U') IS NOT NULL
DROP TABLE cupao
GO
CREATE TABLE cupao
(
    id  CHAR(10)    NOT NULL,
    datainicio  SMALLDATETIME   NOT NULL,
    datafim SMALLDATETIME   NOT NULL,
    pontos_atribuidos   INT NOT NULL,
    CONSTRAINT cupao PRIMARY KEY (id)
);
GO

IF OBJECT_ID('cliente_usa_cupao', 'U') IS NOT NULL
DROP TABLE utilizador
GO
CREATE TABLE cliente_usa_cupao
(
    cliente_email   VARCHAR(255)    NOT NULL,
    cupao_id    CHAR(10)    NOT NULL,
    CONSTRAINT cliente_usa_cupao_pk PRIMARY KEY (cliente_email, cupao_id)
    
    
);
GO

IF OBJECT_ID('cliente', 'U') IS NOT NULL
DROP TABLE cliente
GO
CREATE TABLE cliente (
    email   VARCHAR(255)    NOT NULL,
    pontos  INT NOT NULL,
    newsletter  BIT  NOT NULL,
    pagamento   VARCHAR(10),
    
    CONSTRAINT cliente_pk PRIMARY KEY (email)
);
GO

IF OBJECT_ID('utilizador', 'U') IS NOT NULL
DROP TABLE utilizador
GO
CREATE TABLE utilizador
(
    email   VARCHAR(255)    NOT NULL,
    contribuinte    CHAR(9)     NOT NULL,
    fname   VARCHAR(20)     NOT NULL,
    lname   VARCHAR(20)     NOT NULL,
    pw  BINARY(64)  NOT NULL,
    sexo    BIT     NOT NULL,
    dataNasc    DATETIME    NOT NULL,
    foto    VARCHAR(100)    NOT NULL,
    contacto_default_id     INT     NOT NULL,
    CONSTRAINT utilizador_pk PRIMARY KEY (email)
    
);
GO

IF OBJECT_ID('funcionario', 'U') IS NOT NULL
DROP TABLE funcionario
GO
CREATE TABLE funcionario
(
    email   VARCHAR(255)    NOT NULL,
    administrator   TINYINT NOT NULL,
    salario INT NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (email)
    
);
GO

IF OBJECT_ID('contacto', 'U') IS NOT NULL
DROP TABLE contacto
GO
CREATE TABLE contacto
(
    id   INT IDENTITY(1,1)   NOT NULL,
    utilizador_email    VARCHAR(255)     NOT NULL,
    telemovel   CHAR(9)     NOT NULL,
    visibilidade    BIT     NOT NULL,
    codigo_postal   CHAR(8)     NOT NULL,
    pais    VARCHAR(20)     NOT NULL,
    endereco    VARCHAR(50)     NOT NULL,
    apartamento     VARCHAR(10)     NOT NULL,
    localidade      VARCHAR(20) NOT NULL,
    
    CONSTRAINT contacto_pk PRIMARY KEY (id)
    
);
GO


IF OBJECT_ID('compra_tem_produto', 'U') IS NOT NULL
DROP TABLE compra_tem_produto
GO
CREATE TABLE compra_tem_produto
(
    compranumero    INT NOT NULL,
    produtoid   INT NOT NULL,
    unidades INT NOT NULL,
    
    CONSTRAINT compra_tem_produto_pk PRIMARY KEY (compranumero, produtoid)
);
GO


IF OBJECT_ID('compra', 'U') IS NOT NULL
DROP TABLE compra
GO
CREATE TABLE compra
(
    numero    INT NOT NULL IDENTITY(1,1),
    contribuinte    CHAR(9)     NOT NULL,
    datacompra  DATETIME    NOT NULL,
    pagamento   VARCHAR(10) NOT NULL,
    clienteemail    VARCHAR(255)    NOT NULL,
    pontosgatos INT,
    pontosacumulados    INT,
    
    CONSTRAINT compra_pk PRIMARY KEY (numero)
);
GO

IF OBJECT_ID('servico', 'U') IS NOT NULL
DROP TABLE servico
GO
CREATE TABLE servico
(
    funcionario_email    VARCHAR(255)   NOT NULL,
    id  INT IDENTITY(1,1)   NOT NULL,
    tipo VARCHAR(40)    NOT NULL,
    preco   FLOAT   NOT NULL,
    
    CONSTRAINT servico_pk PRIMARY KEY (funcionario_email, id)
);
GO


IF OBJECT_ID('funcionario_faz_servico', 'U') IS NOT NULL
DROP TABLE funcionario_faz_servico
GO
CREATE TABLE funcionario_faz_servico
(
    funcionario_email   VARCHAR(255)   NOT NULL,
    servico_id  INT IDENTITY(1,1)   NOT NULL,
    duracao_media   INT   NOT NULL,
    
    CONSTRAINT funcionario_faz_servico_pk PRIMARY KEY (funcionario_email, servico_id)
);
GO


IF OBJECT_ID('compra_online', 'U') IS NOT NULL
DROP TABLE compra_online
GO
CREATE TABLE compra_online
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

IF OBJECT_ID('compra_presencial', 'U') IS NOT NULL
DROP TABLE compra_presencial
GO
CREATE TABLE compra_presencial
(
    numero    INT NOT NULL,
    funcemail   VARCHAR(255)    NOT NULL, 
    
    CONSTRAINT compra_presencial_pk PRIMARY KEY (numero)
);
GO


IF OBJECT_ID('marcacao', 'U') IS NOT NULL
DROP TABLE marcacao
GO
CREATE TABLE marcacao
(
    id  INT NOT NULL    IDENTITY(1,1),
    cliente_email   VARCHAR(255)    NOT NULL,
    servico_id  INT IDENTITY(1,1)   NOT NULL,
    funcionario_email VARCHAR(255)  NOT NULL,
    data    DATETIME    NOT NULL,
    
    CONSTRAINT marcacao_pk PRIMARY KEY (id)
);
GO







ALTER TABLE produto_tem_promocao ADD CONSTRAINT produto_tem_promocao_produtoid_fr FOREIGN KEY (produtoid) REFERENCES produto(id);
ALTER TABLE produto_tem_promocao ADD CONSTRAINT produto_tem_promocao_promocaoid_fr FOREIGN KEY (promocaoid) REFERENCES promocao(id);

ALTER TABLE perfume ADD CONSTRAINT perfume_id_fr FOREIGN KEY (id) REFERENCES produto(id);

ALTER TABLE cosmetica ADD CONSTRAINT cosmetica_id_fr FOREIGN KEY (id) REFERENCES produto(id);

ALTER TABLE clientefavorita ADD CONSTRAINT clientefavorita_clienteemail_fr FOREIGN KEY (clienteemail) REFERENCES cliente(email);
ALTER TABLE clientefavorita ADD CONSTRAINT clientefavorita_produtoid_fr FOREIGN KEY (produtoid) REFERENCES produto(id);

ALTER TABLE cliente_usa_cupao ADD CONSTRAINT clienteusacupao_clienteemail_fr FOREIGN KEY (cliente_email) REFERENCES cliente(email);
ALTER TABLE cliente_usa_cupao ADD CONSTRAINT clienteusacupao_cupaoid_fr FOREIGN KEY (cupao_id) REFERENCES cupao(id);

ALTER TABLE cliente ADD CONSTRAINT cliente_email_fr FOREIGN KEY (email) REFERENCES cliente(email);

ALTER TABLE utilizador ADD CONSTRAINT utilizador_contactodefaultid_fr FOREIGN KEY (contacto_default_id) REFERENCES contacto(id);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_email_fr FOREIGN KEY (email) REFERENCES utilizador(id);

ALTER TABLE compra_tem_produto ADD CONSTRAINT compra_tem_produto_compranumero_fr FOREIGN KEY (compranumero) REFERENCES compra(numero);
ALTER TABLE compra_tem_produto ADD CONSTRAINT compra_tem_produto_produtoid_fr FOREIGN KEY (produtoid) REFERENCES produto(id);

ALTER TABLE contacto ADD CONSTRAINT contacto_utilizadoremail_fr FOREIGN KEY (utilizador_email) REFERENCES utilizador(email);

ALTER TABLE servico ADD CONSTRAINT servico_funcionarioemail_fr FOREIGN KEY (funcionario_email) REFERENCES funcionario(email);

ALTER TABLE compra ADD CONSTRAINT compra_clienteemail_fr FOREIGN KEY (clienteemail) REFERENCES cliente(email);

ALTER TABLE funcionario_faz_servico ADD CONSTRAINT func_faz_serv_funcemail_fr FOREIGN KEY (funcionario_email) REFERENCES funcionario(email);
ALTER TABLE funcionario_faz_servico ADD CONSTRAINT func_faz_serv_servicoid_fr FOREIGN KEY (servico_id) REFERENCES servico(id);

ALTER TABLE compra_online ADD CONSTRAINT compra_online_numero_fr FOREIGN KEY (numero) REFERENCES compra(numero);
ALTER TABLE compra_online ADD CONSTRAINT compra_online_contactoid_fr FOREIGN KEY (contactoid) REFERENCES contacto(id);

ALTER TABLE compra_presencial ADD CONSTRAINT compra_presencial_numero_fr FOREIGN KEY (numero) REFERENCES compra(numero);
ALTER TABLE compra_presencial ADD CONSTRAINT compra_presencial_funcemail_fr FOREIGN KEY (funcemail) REFERENCES funcionario(email);

ALTER TABLE marcacao ADD CONSTRAINT marcacao_clienteemail_fr FOREIGN KEY (cliente_email) REFERENCES cliente(email);
ALTER TABLE marcacao ADD CONSTRAINT marcacao_servicoid_fr FOREIGN KEY (servico_id) REFERENCES servico(id);
ALTER TABLE marcacao ADD CONSTRAINT marcacao_funcemail_fr FOREIGN KEY (funcionario_email) REFERENCES funcionario(email);