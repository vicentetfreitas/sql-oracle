-- 32.Visões com prefixo V$ - Visões Dinâmicas de Performance
/*
-- Visões com prefixo V$ - Visões Dinâmicas de Performance
   > As visões com prefixo V$ incluem informações sobre:
     - Performance
     - A instância do banco de dados;
     - As estruturas de memória da Instância
     - As estruturas físicas do banco de dados, tais como: controlfiles, datafies,
     tempfiles;
     - Somente os usuário DBA´s podem acessálas ou usuário que possuem os privilégios
     necessários. 
*/

-- Conectar com usuário SYS

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
