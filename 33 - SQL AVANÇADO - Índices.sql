-- 33.�ndice
/*
-- O que � um �ndice
   > � um objeto do schema
   > Pode ser utilizado pelo Oracle para aumentar a perfomance da recupera��o de 
   linhas
   > Pode reduzir o (I/O) utilizando uma forma r�pida de localizar o dado
   > O �ndice � um objeto independente da tabel que ele indexa
   > Utilizar um �ndice pode evitar um Full Table Scan desnecess�rio
   > �ndices s�o utilizados e mantidos automaticamente pelo Oracle
   
-- Full Table Scan 
   > Um comando sem uma cl�usula WHERE realizar� um FULL TABLE SCAN mesmo que a 
   tabela tiver muitos �ndices
*/
-- Exemplo de FULL TABLE SCAN
SELECT *
FROM employees;

/*
-- Como os �ndices s�o criados
   > Automaticamente
   > Manualmente (explicitamente)

-- Cria��o autom�tica de �ndices
   > Um �ndice �nico � criado automaticamente quando voc� define uma CONSTRAINT
   de PRIMAKY KEY ou UNIQUE na defini��o da tabela

-- Cria��o manual(expl�cita) de �ndices
   > Usu�rios (Desenvolvedores ou DBA�s) podem criar �ndices simples (uma coluna)
   ou �ndices compostos (mais de uma coluna) para melhorar a performance do acesso
   as linhas de uma tabela;
   
*/

-- Removendo �ndices
DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;
DROP INDEX employees_last_name_first_name_idx;
DROP INDEX employees_job_id_idx;
DROP INDEX employees_phone_number_idx;

-- FULL TABLE SCAN
SELECT * 
FROM employees;

-- An�lisar plano de execu��o
SELECT *
FROM employees
WHERE phone_number = '515.127.4565';

-- Criando um �ndice �nico B-Tree Simples
CREATE UNIQUE INDEX employees_phone_number_idx
ON employees(phone_number);

SELECT *
FROM   employees
WHERE  phone_number = '515.127.4565';

-- Analize o custo do comando pelo plano de execu��o - Note que agora ele deve estar utilizando o �ndice criado
-- Criando um �ndice Unico automaticamente na cria��o da Constraint de Unique
DROP INDEX employees_phone_number_idx;

ALTER TABLE employees
ADD CONSTRAINT employees_phone_number_uk UNIQUE (phone_number);
