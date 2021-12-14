/*
SQL FUNDAMENTOS - Criando e gerenciando Vis�es

--  OBJETIVOS
     > Entender o que � vis�o
     > Criar uma vis�o
     > Recuperar dados atrav�s de uma vis�o
     > Alterar a defini��o de uma vis�o
     > Inserir, atualizar e remover dados atrav�s de uma vis�o
     > Remover uma vis�o

--  O que � uma vis�o?
    > Uma vis�o � uma representa��o l�gica baseada em um SELECT sobre uma ou ma-
    is tabelas ou sobre outras vis�es;
    > Uma vis�o � um sub-conjunto l�gico dos dados de uma ou mais tabelas;
    > A vis�o � armazenada no Dicion�rio de Dados justamente com o SELECT que
    a representa
    
-- Vantagens de utilizar Vis�es
    > Restringir acesso aos dados
    > Torna simples consultas complexas
    > Proporciona independ�ncia dos dados
    > Representar vis�es diferentes do mesmo dado
    
-- Regras para executar opera��es DML atrav�s de uma Vis�o Simples
    > DML pode ser execultado em vis�es simples

-- Regras para executar opera�oes DML atrav�s de uma Vis�o
   > DELETE:
     - N�o se remove linhas atrav�s de uma vis�o complexa que cont�m:
       * FUN��ES DE GRUPO
       * Cl�usula GROUP BY
       * Palavra chave DISTINCT
       * Pseudocoluna ROWNUM
   > UPDATE:
     - N�o se pode modificar linhas atrav�s de uma vis�o complexa que cont�m:
       * Fun��es de Grupo
       * GROUP BY
       * Palavra chave DISTINCT
       * Pseudocoluna ROWNUM
       * Colunas definidas por express�es
    > INSERT:
     - N�o se pode modificar linhas atrav�s de uma vis�o complexa que cont�m:
       * Fun��es de Grupo
       * GROUP BY
       * Palavra chave DISTINCT
       * Pseudocoluna ROWNUM
       * Colunas definidas por express�es
       * Colunas NOT NULL nas tabelas base que n�o estejam no SELECT da Vis�o
       
-- Utilizando a Cl�usula CHECK POINT
    > � poss�vel garantir a express�o da cl�usula WHERE da Vis�o para opera��es 
    DML executadas atrav�s da vis�o seja validas

-- Utilizando opera��es DML atrav�s da Vis�o
    > Voc� pode garantir que uma vis�o n�o permita opera��es DML incluindo a op��o
    WITH READ ONLY na defini��o da Vis�o
    > Qualquer tentativa de executar uma opera��o DML atrav�s da vis�o resultar�
    num erro ORACLE
*/

-- Criando uma vis�o
CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60;
-- Recuperando dados utilizando uma Vis�o
SELECT * 
FROM vemployeesdept60;

-- Criando uma vis�o complexa
CREATE OR REPLACE VIEW vdepartments_total
( department_id, department_name, minsal,
 maxsal, avgsal )
AS SELECT e.department_id, d.department_name,
    MIN(e.salary), 
    MAX(e.salary), 
    AVG(e.salary)
FROM employees e
JOIN departments d
    ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name ;

SELECT * 
FROM vdepartments_total;

-- Utilizando a cl�usula CHECKE OPTION
CREATE OR REPLACE VIEW vemployeesdept100
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck; 

-- Utilizando a cl�usula READ ONLY
CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

-- Removendo uma vis�o
 DROP VIEW vemployeesdept20;
