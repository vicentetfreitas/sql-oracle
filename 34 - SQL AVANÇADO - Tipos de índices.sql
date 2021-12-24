-- 34.Tipos de �ndices
/*
-- Tipos de �ndices
   > �ndice �nico (Unique Index)
   > �ndice N�o �nico (Non Unique Index)
   
-- �ndice �nico
   > N�o permite valores duplicados para o �ndice
   > S�o automaticamente criados pelo Oracle quando criamos uma CONSTRAINT de 
   PRIMARY KEY ou UNIQUE para uma tabela
   > Podem ser criados manualmente, mas � recomendado que sejam criados a partir
   de uma defini��o de CONSTRAINT de PRIMARY KEY ou UNIQUE

-- �ndice n�o �nico
  > Permite valores duplicados para o �ndice;
  > S�o criados pelo usu�rio(desenvolvedo) para aumentar a performance da
  recupera��o de linhas
  > � o tipo default de �ndice, se nada for especifcado na cria��o do �ndice, o 
  �ndice criado ser� do tipo n�o �nico
  
-- Tipos de �ndice
   > �ndice B-tree
   > �ndice Bitmap

-- B-Tree
   > � o tipo default de �ndice,se nada for especificado na cria��o do �ndice,
   o �ndice criado ser� do tipo B-tree
   > Recomendado para �ndices para colunas de alta cardinalidade, ou seja, muitos
   valores distindos para o �ndice
   > Implementado fisicamente utilizando uma estrutura de uma �rvore bin�ria invertida
   
-- �ndice Bitmap
   > � preciso especificar a palavra chave BITMAP para cria��o do �ndice tipo
   BITMAP;
   > Implementado fisicamente utilizando um mapa de bits
   > Recomendado para �ndices com colunas de baixa cardinalidade, ou seja, poucos
   valores distindos para os �ndices
   > Recomendado para �ndices para Tabelas com pouco uso de comandos DML, tabelas
   de sistemas de Business Intelligence
   
*/

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;
DROP INDEX employees_last_name_first_name_idx;
DROP INDEX employees_job_id_idx;
DROP INDEX employees_phone_number_idx;
ALTER TABLE employees 
DROP CONSTRAINT employees_phone_number_uk;

-- Criando um Indice B-tree Simples
DROP INDEX employees_job_id_idx;

CREATE INDEX employees_job_id_idx
ON employees(job_id);	

SELECT *
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Analize o custo do comando no plano de execu��o	  

DROP INDEX employees_last_name_idx;

SELECT *
FROM   employees
WHERE  last_name = 'Himuro';

-- Analize o custo do comando no plano de execu��o

-- Criando um Indice N�o �nico B-tree Simples
CREATE INDEX employees_last_name_idx
ON employees(last_name);

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- Analize o custo do comando no plano de execu��o

-- Criando um Indice N�o �nico B-tree Composto
CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

SELECT *
FROM   employees
WHERE  last_name = 'Himuro' AND 
       first_name = 'Guy';

-- Analize o custo do comando no plano de execu��o	  

-- Criando um Indice Bitmap Simples
DROP INDEX employees_job_id_idx;

CREATE BITMAP INDEX employees_job_id_idx
ON employees(job_id);

SELECT *
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Analize o custo do comando no plano de execu��o	 
SELECT COUNT(DISTINCT job_id)
FROM employees;
