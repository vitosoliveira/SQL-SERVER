CREATE TABLE TB_CATEGORIA
(
ID_CATEGORIA TINYINT PRIMARY KEY,
NM_CATEGORIA VARCHAR (50) NOT NULL UNIQUE
);
CREATE TABLE TB_SUBCATEGORIA
(
ID_SUBCATEGORIA TINYINT PRIMARY KEY,
NM_SUBCATEGORIA VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE TB_LIVRO
(
ISBN INT PRIMARY KEY,
NM_TITULO VARCHAR(100),
NM_AUTOR VARCHAR(100),
VL_LIVRO DECIMAL (10,2),
QT_PAGINAS SMALLINT,
PESO_GRAMAS SMALLINT,
NM_IDIOMA VARCHAR(50),
NM_EDITORA VARCHAR(50),
ID_CATEGORIA TINYINT,
ID_SUBCATEGORIA TINYINT,
CONSTRAINT FK_LIVRO_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES TB_CATEGORIA(ID_CATEGORIA),
CONSTRAINT FK_LIVRO_SUBCATEGORIA FOREIGN KEY (ID_SUBCATEGORIA) REFERENCES TB_SUBCATEGORIA(ID_SUBCATEGORIA)
);

INSERT INTO TB_CATEGORIA
(ID_CATEGORIA,NM_CATEGORIA)
VALUES
(1,'Administracao, negocios e economia'),
(2,'Artes cinema'),
(3,'Computacao informatica e Midias Digitais'),
(4,'Cronica humor e entreterimento'),
(5,'Esportes e lazer'),
(6,'Fantansia, Horror e Ficicao cientifica'),
(7,'Medicina'),
(8,'Policial,suspense e misterio'),
(9,'Politica, Filosofia e ciencia sociais');


SELECT * FROM TB_CATEGORIA

INSERT INTO TB_SUBCATEGORIA
(ID_SUBCATEGORIA,NM_SUBCATEGORIA)
VALUES
(1,'Finanças'),
(2,'Finanças Pessoais'),
(3,'Gestão Lideraça'),
(4,'Graficos de Web'),
(5,'Programação'),
(6,'Futebol'),
(7,'Doenças'),
(8,'Ciencias Sociais'),
(9,'Arquitetura');

SELECT * FROM TB_SUBCATEGORIA

INSERT INTO TB_LIVRO
(ISBN,NM_TITULO,NM_AUTOR,VL_LIVRO,QT_PAGINAS,PESO_GRAMAS,NM_IDIOMA,NM_EDITORA,ID_CATEGORIA)
VALUES
(321348109,'The Brand Gap: Revised Edition','Marty Neumeier, Neumeier',111.76,208,295,'Inglês','New Riders Publishing',3);


INSERT INTO TB_LIVRO
(ISBN,NM_TITULO,NM_AUTOR,VL_LIVRO,QT_PAGINAS,PESO_GRAMAS,NM_IDIOMA,NM_EDITORA
,ID_CATEGORIA,ID_SUBCATEGORIA)
VALUES
(850111652,'Factfulness: O hábito libertador de só ter opiniões baseadas emH faantoss','Rosling, Ola Rosling',44.92,360,499,'Portugues','Record',9,8),
(856921408,'A pirâmide invertida: A história da tática no futebol','Jonathan Wilson',55.92,472,689,'Português','Grande Área',5,6),
(857608998,'Data Science do Zero: Primeiras Regras com o Python','Joel Grus',53.83,336,499,'Português','Alta Books',3,5),
(857655567,'Fibromialgia. O Mal- Estar do Século XX','Rafael da Silva Mattos',48.28,240,581,'Português','Phorte',7,7);



SELECT * FROM TB_LIVRO

UPDATE TB_LIVRO
SET VL_LIVRO += 10
WHERE ISBN = 850111652

DELETE TB_LIVRO WHERE ISBN IN (321348109,857655567)