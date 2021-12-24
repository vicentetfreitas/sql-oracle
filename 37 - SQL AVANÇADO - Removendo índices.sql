-- 37 - SQL AVAN�ADO - Removendo �ndices
/*
-- Removendo �ndices
   > Quando se remove uma Tabela todos os �ndices da Tabela s�o removidos automaticamente;
   > Se voc� remove um �ndice as tabelas e todos seus outros �ndices permanecem;
   normalmente;
   > Voc� n�o pode remover um �ndice utilizado por uma CONSTRAINT de PRIMARY KEY
   ou UNIQUE;
   > Quando se remove um �ndice todas as opera��es DML s�o bloqueadas at� que a
   remo��o do �ndice seja conclu�da;
   > Se voc� deseja permitir opera��es DML enquanto esta executando a remo��o do 
   �ndice utilize a palavra chave ONLINE.
*/

-- Removendo �ndices
DROP INDEX employees_job_id_idx;

-- Consultando �ndices 
SELECT 
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name,
 visibility
FROM user_indexes ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) 
 AND (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY 
 ix.index_name, 
 ic.column_position ; 

-- Criando �ndice employees_job_id_idx
CREATE INDEX employees_job_id_idx
ON employees(job_id);

-- Consultando �ndices 
DESC all_indexes

SELECT 
 ix.owner,
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name,
 visibility
FROM    
 all_indexes ix
 JOIN  all_ind_columns ic ON (ix.index_name = ic.index_name) 
 AND (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- Removendo �ndices ONLINE
DROP INDEX employees_job_id_idx ONLINE;

-- Consultando �ndices 
SELECT 
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name,
 visibility
FROM 
 user_indexes ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) 
 AND (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY 
 ix.index_name, 
 ic.column_position ; 
