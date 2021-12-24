-- 34.Tipos de Índices
/*
-- Tipos de Índices
   > Índice único (Unique Index)
   > Índice Não Único (Non Unique Index)
   
-- Índice único
   > Não permite valores duplicados para o índice
   > São automaticamente criados pelo Oracle quando criamos uma CONSTRAINT de 
   PRIMARY KEY ou UNIQUE para uma tabela
   > Podem ser criados manualmente, mas é recomendado que sejam criados a partir
   de uma definição de CONSTRAINT de PRIMARY KEY ou UNIQUE

-- Índice não único
  > Permite valores duplicados para o índice;
  > São criados pelo usuário(desenvolvedo) para aumentar a performance da
  recuperação de linhas
  > É o tipo default de índice, se nada for especifcado na criação do índice, o 
  índice criado será do tipo não único
  
-- Tipos de Índice
   > Índice B-tree
   > Índice Bitmap

-- B-Tree
   > É o tipo default de índice,se nada for especificado na criação do índice,
   o índice criado será do tipo B-tree
   > Recomendado para índices para colunas de alta cardinalidade, ou seja, muitos
   valores distindos para o índice
   > Implementado fisicamente utilizando uma estrutura de uma árvore binária invertida
   
-- Índice Bitmap
   > É preciso especificar a palavra chave BITMAP para criação do índice tipo
   BITMAP;
   > Implementado fisicamente utilizando um mapa de bits
   > Recomendado para índices com colunas de baixa cardinalidade, ou seja, poucos
   valores distindos para os índices
   > Recomendado para índices para Tabelas com pouco uso de comandos DML, tabelas
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

-- Analize o custo do comando no plano de execução	  

DROP INDEX employees_last_name_idx;

SELECT *
FROM   employees
WHERE  last_name = 'Himuro';

-- Analize o custo do comando no plano de execução

-- Criando um Indice Não Único B-tree Simples
CREATE INDEX employees_last_name_idx
ON employees(last_name);

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- Analize o custo do comando no plano de execução

-- Criando um Indice Não Único B-tree Composto
CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

SELECT *
FROM   employees
WHERE  last_name = 'Himuro' AND 
       first_name = 'Guy';

-- Analize o custo do comando no plano de execução	  

-- Criando um Indice Bitmap Simples
DROP INDEX employees_job_id_idx;

CREATE BITMAP INDEX employees_job_id_idx
ON employees(job_id);

SELECT *
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Analize o custo do comando no plano de execução	 
SELECT COUNT(DISTINCT job_id)
FROM employees;
