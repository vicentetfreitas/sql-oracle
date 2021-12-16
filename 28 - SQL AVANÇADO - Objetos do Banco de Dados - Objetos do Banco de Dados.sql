-- 28.SQL AVAN�ADO - Objetos do Banco de Dados
/*
-- Objetos do Banco de Dados
    > Categorias de Objetos do Banco de Dados ORACLE
      => Schema Objects
      => Nonschema Objects
      
-- Schema Objects
    > � uma cole��o de estrutura l�gica de objetos
    > Um usu�rio do Banco de Dados Oracle possui um e somente um schema com o mesmo
    nome do seu username
    > Tabela: unidade b�sica do banco de dados para armazenar dados, composta por
    linhas e colunas
    > Sin�nimo: nome alternativa para um obejto no banco de dados
    > View: uma consulta SQL armazenada o dicion�rio de dados referenciando tabelas
    ou outras views.
    > Materialized View: possui uma tabela real preenchida com o resultado de uma
    consulta SQL com nas views normais. Existe uma tabela real que � esvaziada 
    (truncad) e repreenchida com uma frequ�ncia especificada
    > Constraind: s�o regras de restri��o para valida��o de entrada de dados em
    tabelas.
    > Database Links: conex�o entre dois bancos de dados f�sicos
    > �ndices: s�o utilizados para melhorar a performance da recupera��o de dados
    de uma tabela.
    > Procedure e Fun��o: s�o unidades de program codificadas em PL/SQL compiladas
    e salvas no banco de dados Oracle. Pode realizar chamadas de procedures e fun��es
    de qualquer ambiente que se conect ao ORACLE.Fun��es retornam um valor, procedures
    n�o retornam valor.
    > Package: s�o schema objects codificadas em PL/SQL compiladas e salvas no banco
    de dados ORACLE. Uma package(pacote) pode conter: procedures, fun��es, cursores,
    exce��es, vari�veis e constantes.
    > Triggers: s�o unidades de programa compiladas e armazenadas no banco de dados
    e executadas automaticamente para um evento espec�fico do banco de dados
    > Sequence: s�o objetos do banco de dados utilizados para gera��o de n�meros
    sequenciais �nicos. Sequence s�o geralmente utilizadas para gera��o de n�meros
    para valores de Primary Key

-- Nonschemas Objects
    > Outros tipos de objetos do banco de dados s�o chamados de Nonschemas Objects
    > N�o pertencem a um schema s�o objetos de administra��o de banco de dados
    > Ex: directories, roles, tablespaces, users e etc.
*/
-- Objetos do schema do usu�rio conectado
DESC user_objects;

SELECT 
 object_name,
 object_type,
 status
FROM 
 user_objects
ORDER BY object_type;

-- Conectar como usu�rio SYS (DBA)
DESC DBA_OBJECTS

SELECT   owner, object_name, object_type, status
FROM     dba_objects
WHERE    owner = 'HR'
ORDER BY object_type;
-- Exemplos de consultas a Nonschema Objects pelo Dicion�rio de Dados Oracle
SELECT *
FROM dba_tablespaces;

SELECT *
FROM   dba_users;