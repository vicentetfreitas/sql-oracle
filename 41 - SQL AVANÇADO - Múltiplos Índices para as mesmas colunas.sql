-- 41.M�ltiplos �ndices para as mesmas colunas
/*
-- M�ltiplos �ndices para as mesmas colunas
   > Podemos criar m�ltiplos �ndiecs para o mesmo conjunto de colunas se os �ndices
   s�o de tipos difentes

-- Visibilidade para M�ltiplos �ndices para as mesmas colunas
   > Se tivermos m�ltiplos �ndices para o mesmo conjunto de colunas somente um
   �ndice pode estar vis�vel
   > Utilizamos m�ltiplos �ndices para o mesmo conjunto de colunas para compara��o
   de performance sem necessidade de criar e remover �ndices que � um processo
   demorado para tabelas grandes
*/

-- Criando um Indice B-tree para coluna job_id

DROP INDEX employees_job_id_idx;

CREATE INDEX employees_job_id_idx
ON employees(job_id);

SELECT *
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Analize o custo do comando no plano de execu��o

-- Criando um Indice B-tree para coluna job_id

DROP INDEX employees_job_id_idx2;

CREATE BITMAP INDEX employees_job_id_idx2
ON employees(job_id);  -- Observe a mensagem de erro

-- Resolvendo o problema

ALTER INDEX employees_job_id_idx INVISIBLE;

CREATE BITMAP INDEX employees_job_id_idx2
ON employees(job_id);  

SELECT *
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Analize o custo do comando no plano de execu��o

-- Consultando os �ndices para a Tabela employees

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name,
       visibility
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

ALTER INDEX employees_job_id_idx2 INVISIBLE;

ALTER INDEX employees_job_id_idx VISIBLE;

-- Consultando os �ndices para a Tabela employees

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name,
       visibility
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

SELECT *
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Analize o custo do comando no plano de execu��o

-- Consultando os �ndices para a Tabela employees

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name,
       visibility
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 