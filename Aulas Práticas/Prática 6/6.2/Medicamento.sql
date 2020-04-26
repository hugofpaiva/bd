CREATE SCHEMA Medicamentos;
GO

CREATE TABLE Medicamentos.Medico(

	numSNS int ,
	nome varchar (50) ,
	especialidade varchar(15)

	PRIMARY KEY (numSNS)
);

CREATE TABLE Medicamentos.Paciente(

	NumUtente int ,
	nome varchar (50) ,
	dataNasc date ,
	endereco varchar (50)

	PRIMARY KEY (NumUtente)

);


CREATE TABLE Medicamentos.Farmacia (

	nome varchar (50),
	telefone char(9),
	endereco varchar (50)

	PRIMARY KEY(nome)

);

CREATE TABLE Medicamentos.Prescricao(

	numPresc int,
	numUtente int,
	numMedico int ,
	farmacia varchar (50),
	dataProc date

	PRIMARY KEY (numPresc),

);


CREATE TABLE Medicamentos.Farmaceutica (

	numReg int ,
	nome varchar (50) ,
	endereco varchar (50) 

	PRIMARY KEY(numReg)

);

CREATE TABLE Medicamentos.Farmaco(
	
	numRegFarm int ,
	nome varchar (50) ,
	formula varchar (15)

	PRIMARY KEY (nome, numRegFarm),

);

CREATE TABLE Medicamentos.Presc_Farmaco(

	numPresc int,
	numRegFarm int,
	nomeFarmaco varchar (50)

	PRIMARY KEY (nomeFarmaco, numPresc, numRegFarm),
	
);

ALTER TABLE Medicamentos.Presc_Farmaco  ADD constraint FK_nome_numReg FOREIGN KEY (nomeFarmaco, numRegFarm) REFERENCES Medicamentos.Farmaco(nome, numRegFarm);
ALTER TABLE Medicamentos.Presc_Farmaco  ADD constraint FK_numPresc FOREIGN KEY (numPresc) REFERENCES Medicamentos.Prescricao(numPresc);
ALTER TABLE Medicamentos.Farmaco  ADD constraint FK_numRegFarm FOREIGN KEY (numRegFarm) REFERENCES Medicamentos.Farmaceutica(numReg);
ALTER TABLE Medicamentos.Prescricao  ADD constraint FK_numMedico FOREIGN KEY (numMedico) REFERENCES Medicamentos.Medico(numSNS);
ALTER TABLE Medicamentos.Prescricao  ADD constraint FK_numUtente FOREIGN KEY (numUtente) REFERENCES Medicamentos.Paciente(NumUtente);
ALTER TABLE Medicamentos.Prescricao  ADD constraint FK_farmacia FOREIGN KEY (farmacia) REFERENCES Medicamentos.Farmacia(nome);


/** Adding VALUES to tables **/


INSERT INTO Medicamentos.Medico VALUES (101,'Joao Pires Lima','Cardiologia');
INSERT INTO Medicamentos.Medico VALUES (102,'Manuel Jose Rosa','Cardiologia');
INSERT INTO Medicamentos.Medico VALUES (103,'Rui Luis Caraca','Pneumologia');
INSERT INTO Medicamentos.Medico VALUES (104,'Sofia Sousa Silva','Radiologia');
INSERT INTO Medicamentos.Medico VALUES (105,'Ana Barbosa', 'Neurologia');
			
INSERT INTO Medicamentos.Paciente VALUES (1,'Renato Manuel Cavaco','1980-01-03','Rua Nova do Pilar 35');
INSERT INTO Medicamentos.Paciente VALUES (2,'Paula Vasco Silva','1972-10-30','Rua Direita 43');
INSERT INTO Medicamentos.Paciente VALUES (3,'Ines Couto Souto','1985-05-12','Rua de Cima 144');
INSERT INTO Medicamentos.Paciente VALUES (4,'Rui Moreira Porto','1970-12-12','Rua Zig Zag 235');
INSERT INTO Medicamentos.Paciente VALUES (5,'Manuel Zeferico Polaco','1990-06-05','n se');
		
INSERT INTO Medicamentos.Farmacia VALUES ('Farmacia BelaVista',221234567,'Avenida Principal 973');
INSERT INTO Medicamentos.Farmacia VALUES ('Farmacia Central',234370500,'Avenida da Liberdade 33');
INSERT INTO Medicamentos.Farmacia VALUES ('Farmacia Peixoto',234375111,'Largo da Vila 523');
INSERT INTO Medicamentos.Farmacia VALUES ('Farmacia Vitalis',229876543,'Rua Visconde Salgado 263');

INSERT INTO Medicamentos.Farmaceutica VALUES (905,'Roche','Estrada Nacional 249');
INSERT INTO Medicamentos.Farmaceutica VALUES (906,'Bayer','Rua da Quinta do Pinheiro 5');
INSERT INTO Medicamentos.Farmaceutica VALUES (907,'Pfizer','Empreendimento Lagoas Park - Edificio 7');
INSERT INTO Medicamentos.Farmaceutica VALUES (908,'Merck', 'Alameda Fernão Lopes 12');
			
INSERT INTO Medicamentos.Farmaco VALUES (905,'Boa Saude em 3 Dias','XZT9');
INSERT INTO Medicamentos.Farmaco VALUES (906,'Voltaren Spray','PLTZ32');
INSERT INTO Medicamentos.Farmaco VALUES (906,'Xelopironi 350','FRR-34');
INSERT INTO Medicamentos.Farmaco VALUES (906,'Gucolan 1000','VFR-750');
INSERT INTO Medicamentos.Farmaco VALUES (907,'GEROaero Rapid','DDFS-XEN9');
INSERT INTO Medicamentos.Farmaco VALUES (908,'Aspirina 1000','BIOZZ02');

INSERT INTO Medicamentos.Prescricao VALUES (10001,1,105,'Farmacia Central','2015-03-03');
INSERT INTO Medicamentos.Prescricao VALUES (10002,1,105,NULL,NULL);
INSERT INTO Medicamentos.Prescricao VALUES (10003,3,102,'Farmacia Central','2015-01-17');
INSERT INTO Medicamentos.Prescricao VALUES (10004,3,101,'Farmacia BelaVista','2015-02-09');
INSERT INTO Medicamentos.Prescricao VALUES (10005,3,102,'Farmacia Central','2015-01-17');
INSERT INTO Medicamentos.Prescricao VALUES (10006,4,102,'Farmacia Vitalis','2015-02-22');
INSERT INTO Medicamentos.Prescricao VALUES (10007,5,103,NULL,NULL);
INSERT INTO Medicamentos.Prescricao VALUES (10008,1,103,'Farmacia Central','2015-01-02');
INSERT INTO Medicamentos.Prescricao VALUES (10009,3,102,'Farmacia Peixoto','2015-02-02');

INSERT INTO Medicamentos.Presc_Farmaco VALUES (10001,905,'Boa Saude em 3 Dias');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10002,907,'GEROaero Rapid');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10003,906,'Voltaren Spray');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10003,906,'Xelopironi 350');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10003,908,'Aspirina 1000');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10004,905,'Boa Saude em 3 Dias');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10004,908,'Aspirina 1000');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10005,906,'Voltaren Spray');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10006,905,'Boa Saude em 3 Dias');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10006,906,'Voltaren Spray');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10006,906,'Xelopironi 350');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10006,908,'Aspirina 1000');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10007,906,'Voltaren Spray');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10008,905,'Boa Saude em 3 Dias');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10008,908,'Aspirina 1000');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10009,905,'Boa Saude em 3 Dias');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10009,906,'Voltaren Spray');
INSERT INTO Medicamentos.Presc_Farmaco VALUES (10009,908,'Aspirina 1000');

/** queries AR to SQL **/

/** a) **/
SELECT Medicamentos.Paciente.numUtente, Medicamentos.Paciente.nome 
FROM Medicamentos.Paciente LEFT OUTER JOIN Medicamentos.Prescricao ON Medicamentos.Paciente.numUtente=Medicamentos.Prescricao.numUtente
WHERE Medicamentos.Prescricao.numUtente IS NULL;

/** b) **/
SELECT Medicamentos.Medico.especialidade, COUNT(Medicamentos.Medico.especialidade) AS num_prescricoes
FROM Medicamentos.Medico INNER JOIN Medicamentos.prescricao ON Medicamentos.Medico.numSNS=Medicamentos.Prescricao.numMedico
WHERE Medicamentos.Prescricao.farmacia IS NOT NULL
GROUP BY Medicamentos.Medico.especialidade;

/** c) **/
SELECT Medicamentos.Prescricao.farmacia, COUNT(Medicamentos.Prescricao.farmacia) AS num_precricoes
FROM Medicamentos.Prescricao
WHERE Medicamentos.Prescricao.farmacia IS NOT NULL
GROUP BY Medicamentos.Prescricao.farmacia;

/** d) **/
SELECT Medicamentos.Farmaco.nome
FROM Medicamentos.Farmaceutica, Medicamentos.Farmaco
WHERE Medicamentos.Farmaceutica.numReg=906
EXCEPT (SELECT Medicamentos.Farmaco.nome FROM Medicamentos.Farmaco INNER JOIN Medicamentos.Presc_Farmaco ON Medicamentos.Farmaco.nome=Medicamentos.Presc_Farmaco.nomeFarmaco);

/** e) **/
SELECT Medicamentos.Farmacia.nome, Medicamentos.Farmaceutica.nome, COUNT(Medicamentos.Presc_Farmaco.nomeFarmaco) AS num_farmacos_vendidos
FROM Medicamentos.Farmaceutica INNER JOIN (Medicamentos.Presc_Farmaco INNER JOIN (Medicamentos.Farmacia INNER JOIN Medicamentos.Prescricao ON Medicamentos.Farmacia.nome=Medicamentos.Prescricao.farmacia) ON Medicamentos.Presc_Farmaco.numPresc=Medicamentos.Prescricao.numPresc)  ON Medicamentos.Presc_Farmaco.numRegFarm=Medicamentos.Farmaceutica.numReg
GROUP BY Medicamentos.Farmacia.nome, Medicamentos.Farmaceutica.nome;

/** f) **/
SELECT Medicamentos.Paciente.nome, COUNT(Medicamentos.Prescricao.numMedico) AS num_medicos
FROM Medicamentos.Paciente INNER JOIN Medicamentos.Prescricao ON Medicamentos.Paciente.NumUtente=Medicamentos.Prescricao.numUtente
GROUP BY Medicamentos.Paciente.nome
HAVING COUNT(Medicamentos.Prescricao.numMedico)>1;


