-- 30.SQL AVAN�ADO - Vis�es do Dicion�rio de Dados
/*
-- O que s�o Vis�es do Dicion�rio de Dados 
   > S�o uma cole��o de vis�es que cont�m informa��es sobre o banco de dados
   > S�o criadas e mantidas pelo pr�rprio Oracle Server
   > S�o utilizadas pelos usu�rios do banco de dados, tais como: desenvolvedores
   e administradores do banco de dados.
   > S�o Read Only - APENAS CONSULTAS
   > Utiliza-se comandos SQL para acessar as vis�es do dicion�rios de dados
   
-- Quais informa��es as Vis�es do Dicion�rio de Dados cont�m
   > Informa��es sobre:
     - Objetos do banco de dados tais como: tabelas, vis�es, sequencias, �ndices,
     procedures, fun��es, etc.
     - Usu�rios do banco de dados;
     - Constraints
     - Privil�gios
     - Informa��es sobre o banco de dados tais como: tablespaces, datafiles, tempfiles,
     etc.
     - E muitas outras informa��es sobre o banco de dados
     
-- Vis�o Dictionary
   > A vis�o DICTIONARY cont�m o nome de todas as vi�es do dicion�rio de dados
   > Todos os nomes na vis�o Dictionary est�o em letras mai�sculas
   > Existe um sin�nimo p�blico DICT para a vis�o DICTIONARY
*/

-- Consultando a vis�o DICTIONARY
DESC dictionary;

SELECT *
FROM dictionary
ORDER BY table_name;

SELECT * 
FROM dictionary
WHERE table_name = 'USER_TABLES'
ORDER BY table_name;

SELECT *
FROM dictionary
WHERE table_name LIKE '%TABLES%'
ORDER BY table_name;

SELECT *
FROM dict
WHERE table_name LIKE '%TABLES%'
ORDER BY table_name;

-- Exemplo de consultas as Vis�es do Dicion�rio de dados
-- Conectar com usu�rio

-- Informa��es dos os obejtos do usu�rio conectado
SELECT *
FROM user_objects;

-- Informa��es sobre as tabelas do usu�rio conectado
SELECT * 
FROM user_tables;

-- Informa��es sobre as sequences do usu�rio conectado
SELECT *
FROM user_sequences;

-- Informa��es sobre as views do usu�rio conectado
SELECT *
FROM user_views;

-- Informa��es do usu�rio SYS
-- Comandos abaixo apenas para usu�rios SYS
SELECT *
FROM dba_objects
WHERE owner = 'HR';

SELECT *
FROM dba_tables
WHERE owner = 'HR';

SELECT *
FROM dba_sequences
WHERE sequences_owner = 'HR';

SELECT *
FROM dba_views
WHERE owner = 'HR';

SELECT *
FROM dba_users;

SELECT *
FROM dba_tablespaces;

SELECT * 
FROM dba_data_files;

SELECT *
FROM dba_temp_files; 