use LMS

-- 1)Em um único SELECT exiba o rótulo e a data de iníncio de resposta da(s) atividades
--vinculadas com nota 8 nas ACs 3 entregues no primeiro semestre de 2016

SELECT NOTA,
	DTINIRESPOSTA,
	ROTULO

FROM ATIVIDADEVINCULADA 
INNER JOIN ENTREGA ON ATIVIDADEVINCULADA.ID = ENTREGA.IDAVINCULADA

WHERE DATEPART(MONTH,DTENTREGA) IN (1,2,3,4,5,6) AND DATEPART(YEAR,DTENTREGA) = 2016 AND NOTA = 8 AND ROTULO = 'AC 3' 







-- 2) Em um único SELECT exiba o nome, email e login do(s) alunos(s) que não possuem
--nenhuma solicitacao de matricula. Ordenado alfabeticamente pelo nome do aluno.

SELECT 
	ALUNO.NOME, 
	ALUNO.EMAIL, 
	USUARIO.LOGIN 

FROM ALUNO LEFT  OUTER JOIN SOLICITACAOMATRICULA ON SOLICITACAOMATRICULA.IDALUNO = IDALUNO
LEFT JOIN USUARIO ON USUARIO.ID = ALUNO.IDUSUARIO
WHERE NOT (ALUNO.ID = SOLICITACAOMATRICULA.IDALUNO)

SELECT * FROM ALUNO
SELECT * FROM SOLICITACAOMATRICULA

-- 3) Em um único SELECT exiba nome das disciplinas, dos professores, e do coordenador da
--turma A do semestre 2 do ano de 2017 do curso de 'Sistemas de Informação'. Ordenados
--pelo nome dos professores. Crie alias/apelido para identificaras colunas.

SELECT 
	DISC.NOME AS NOME_DISCIPLINA , 
	PROF.NOME AS NOME_PROF ,
	COOD.NOME AS NOME_COORDE,
	CUR.NOME AS NOME_CURSO,
	TURMA,
	SEMESTRE, DTFIMMATRICULA,DTINICIOMATRICULA


FROM DISCIPLINAOFERTADA DISCOF
INNER JOIN COORDENADOR COOD ON DISCOF.IDCOORDENADOR = COOD.ID
INNER JOIN DISCIPLINA DISC ON DISC.ID = DISCOF.IDDISCIPLINA
INNER JOIN PROFESSOR PROF ON DISCOF.IDPROFESSOR = PROF.ID
INNER JOIN CURSO CUR ON DISCOF.IDCURSO = CUR.ID

WHERE DISCOF.TURMA = 'A' AND 
DISCOF.SEMESTRE = '2' AND 
CUR.NOME = 'SISTEMAS DE INFORMAÇÃO' AND
DATEPART(YEAR,DTFIMMATRICULA) = 2017 AND
DATEPART(YEAR,DTINICIOMATRICULA) = 2017


-- 4)Em um único SELECT exiba em 4 colunas o login, senha, o nome da pessoa (coordenador
--ou professor) e na quarta coluna exiba se aquele nome é de um professor, de um-
--coordenador ou de um professor coordenador(quando o professor também é um
--coordenador). Exibir somente logins de professores ou coordenadores. Ordene exibindo
--primeiramente os professores coordenadores, e depois os professores e por ultimo os
--coordenadores. Crie alias/apelido para identificaras colunas.

SELECT * FROM USUARIO