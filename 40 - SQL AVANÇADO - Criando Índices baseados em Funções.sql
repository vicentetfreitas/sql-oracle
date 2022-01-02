-- 40.Criando �ndices baseados em fun��es
/*
-- �ndices baseados em fun��es
   > Normalmente, para que o Oracle utilize um �ndice basta referenciar a coluna
   indexada, mas se for utilizado alguma fun��o sobre a coluna o �ndice pode n�o 
   ser utilizado e ocorrer� um FULL Table Scan
   > Nestas situa��es utilizamos �ndices baseados em fun��es
   > �ndices baseados em Fun��es podem utilizar SQL e Fun��es definidas pelo
   usu�rio(desenvolvedor)
   > O Oracle somente utilizar� o �ndice baseado em Fun��es quando a Fun��o 
   for utilizada no comando (query)
*/

-- Criando o �ndice para a coluna first_name
DROP INDEX employees_first_name_idx;

CREATE INDEX employees_first_name_idx ON employees (first_name);

SELECT *
FROM employees
WHERE UPPER(first_name) = 'DANIEL';

-- Analise o custo do comando no plano de execu��o
-- Criando um �ndice baseado em fun��es

CREATE INDEX employees_upper_first_name_idx ON employees(UPPER(first_name));
SELECT *
FROM employees
WHERE UPPER(first_name) = 'DANIEL';

