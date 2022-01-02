-- 40.Criando índices baseados em funções
/*
-- Índices baseados em funções
   > Normalmente, para que o Oracle utilize um índice basta referenciar a coluna
   indexada, mas se for utilizado alguma função sobre a coluna o índice pode não 
   ser utilizado e ocorrerá um FULL Table Scan
   > Nestas situações utilizamos índices baseados em funções
   > Índices baseados em Funções podem utilizar SQL e Funções definidas pelo
   usuário(desenvolvedor)
   > O Oracle somente utilizará o índice baseado em Funções quando a Função 
   for utilizada no comando (query)
*/

-- Criando o índice para a coluna first_name
DROP INDEX employees_first_name_idx;

CREATE INDEX employees_first_name_idx ON employees (first_name);

SELECT *
FROM employees
WHERE UPPER(first_name) = 'DANIEL';

-- Analise o custo do comando no plano de execução
-- Criando um índice baseado em funções

CREATE INDEX employees_upper_first_name_idx ON employees(UPPER(first_name));
SELECT *
FROM employees
WHERE UPPER(first_name) = 'DANIEL';

