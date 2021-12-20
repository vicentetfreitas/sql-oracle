-- 32.Vis�es com prefixo V$ - Vis�es Din�micas de Performance
/*
-- Vis�es com prefixo V$ - Vis�es Din�micas de Performance
   > As vis�es com prefixo V$ incluem informa��es sobre:
     - Performance
     - A inst�ncia do banco de dados;
     - As estruturas de mem�ria da Inst�ncia
     - As estruturas f�sicas do banco de dados, tais como: controlfiles, datafies,
     tempfiles;
     - Somente os usu�rio DBA�s podem acess�las ou usu�rio que possuem os privil�gios
     necess�rios. 
*/

-- Conectar com usu�rio SYS

SELECT *
FROM   v$tablespace;

SELECT * 
FROM   v$datafile;

SELECT file#, name, bytes/1024/1024 MB, blocks, status
FROM   v$datafile;

SELECT * 
FROM v$tempfile;

SELECT file#, name, bytes/1024/1024 MB, blocks, status 
FROM   v$tempfile;

SELECT * 
FROM   v$controlfile;

SELECT * 
FROM   v$parameter;

SELECT * 
FROM   v$parameter
WHERE  name = 'db_block_size';
