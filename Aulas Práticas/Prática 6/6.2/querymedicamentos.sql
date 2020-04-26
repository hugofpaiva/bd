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


