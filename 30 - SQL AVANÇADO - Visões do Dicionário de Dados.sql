-- 30.SQL AVANÇADO - Visões do Dicionário de Dados
/*
-- O que são Visões do Dicionário de Dados 
   > São uma coleção de visões que contém informações sobre o banco de dados
   > São criadas e mantidas pelo prórprio Oracle Server
   > São utilizadas pelos usuários do banco de dados, tais como: desenvolvedores
   e administradores do banco de dados.
   > São Read Only - APENAS CONSULTAS
   > Utiliza-se comandos SQL para acessar as visões do dicionários de dados
   
-- Quais informações as Visões do Dicionário de Dados contém
   > Informações sobre:
     - Objetos do banco de dados tais como: tabelas, visões, sequencias, índices,
     procedures, funções, etc.
     - Usuários do banco de dados;
     - Constraints
     - Privilégios
     - Informações sobre o banco de dados tais como: tablespaces, datafiles, tempfiles,
     etc.
     - E muitas outras informações sobre o banco de dados
     
-- Visão Dictionary
   > A visão DICTIONARY contém o nome de todas as viões do dicionário de dados
   > Todos os nomes na visão Dictionary estão em letras maiúsculas
   > Existe um sinônimo público DICT para a visão DICTIONARY
*/

-- Consultando a visão DICTIONARY
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

-- Exemplo de consultas as Visões do Dicionário de dados
-- Conectar com usuário

-- Informações dos os obejtos do usuário conectado
SELECT *
FROM user_objects;

-- Informações sobre as tabelas do usuário conectado
SELECT * 
FROM user_tables;

-- Informações sobre as sequences do usuário conectado
SELECT *
FROM user_sequences;

-- Informações sobre as views do usuário conectado
SELECT *
FROM user_views;

-- Informações do usuário SYS
-- Comandos abaixo apenas para usuários SYS
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