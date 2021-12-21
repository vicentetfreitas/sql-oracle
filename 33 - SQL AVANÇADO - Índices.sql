-- 33.Índice
/*
-- O que é um Índice
   > É um objeto do schema
   > Pode ser utilizado pelo Oracle para aumentar a perfomance da recuperação de 
   linhas
   > Pode reduzir o (I/O) utilizando uma forma rápida de localizar o dado
   > O Índice é um objeto independente da tabel que ele indexa
   > Utilizar um índice pode evitar um Full Table Scan desnecessário
   > Índices são utilizados e mantidos automaticamente pelo Oracle
   
-- Full Table Scan 
   > Um comando sem uma cláusula WHERE realizará um FULL TABLE SCAN mesmo que a 
   tabela tiver muitos índices
*/
-- Exemplo de FULL TABLE SCAN
SELECT *
FROM employees;

/*
-- Como os índices são criados
   > Automaticamente
   > Manualmente (explicitamente)

-- Criação automática de Índices
   > Um índice único é criado automaticamente quando você define uma CONSTRAINT
   de PRIMAKY KEY ou UNIQUE na definição da tabela

-- Criação manual(explícita) de Índices
   > Usuários (Desenvolvedores ou DBA´s) podem criar índices simples (uma coluna)
   ou índices compostos (mais de uma coluna) para melhorar a performance do acesso
   as linhas de uma tabela;
   
*/

-- Removendo índices
DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;
DROP INDEX employees_last_name_first_name_idx;
DROP INDEX employees_job_id_idx;
DROP INDEX employees_phone_number_idx;

-- FULL TABLE SCAN
SELECT * 
FROM employees;

-- Análisar plano de execução
SELECT *
FROM employees
WHERE phone_number = '515.127.4565';

-- Criando um Índice Único B-Tree Simples
CREATE UNIQUE INDEX employees_phone_number_idx
ON employees(phone_number);

SELECT *
FROM   employees
WHERE  phone_number = '515.127.4565';

-- Analize o custo do comando pelo plano de execução - Note que agora ele deve estar utilizando o índice criado
-- Criando um Índice Unico automaticamente na criação da Constraint de Unique
DROP INDEX employees_phone_number_idx;

ALTER TABLE employees
ADD CONSTRAINT employees_phone_number_uk UNIQUE (phone_number);
