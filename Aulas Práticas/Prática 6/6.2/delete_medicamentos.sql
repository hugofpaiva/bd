ALTER TABLE Medicamentos.Prescricao DROP CONSTRAINT FK_numMedico;
ALTER TABLE Medicamentos.Prescricao DROP CONSTRAINT FK_numUtente;
ALTER TABLE Medicamentos.Prescricao DROP CONSTRAINT FK_farmacia;

ALTER TABLE Medicamentos.Farmaco DROP CONSTRAINT FK_numRegFarm;

ALTER TABLE Medicamentos.Presc_Farmaco DROP CONSTRAINT FK_nome_numReg;
ALTER TABLE Medicamentos.Presc_Farmaco DROP CONSTRAINT FK_numPresc;

DROP TABLE Medicamentos.Prescricao;
DROP TABLE Medicamentos.Farmaco;
DROP TABLE Medicamentos.Presc_Farmaco;
DROP TABLE Medicamentos.Farmaceutica;
DROP TABLE Medicamentos.Farmacia;
DROP TABLE Medicamentos.Medico;
DROP TABLE Medicamentos.Paciente;


DROP SCHEMA Medicamentos;







