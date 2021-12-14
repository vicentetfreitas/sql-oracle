/*
SQL FUNDAMENTOS - Criando e gerenciando Visões

--  OBJETIVOS
     > Entender o que á visão
     > Criar uma visão
     > Recuperar dados através de uma visão
     > Alterar a definição de uma visão
     > Inserir, atualizar e remover dados atrav´s de uma visão
     > Remover uma visão

--  O que é uma visão?
    > Uma visão é uma representação lógica baseada em um SELECT sobre uma ou ma-
    is tabelas ou sobre outras visões;
    > Uma visão é um sub-conjunto lógico dos dados de uma ou mais tabelas;
    > A visão é armazenada no Dicionário de Dados justamente com o SELECT que
    a representa
    
-- Vantagens de utilizar Visões
    > Restringir acesso aos dados
    > Torna simples consultas complexas
    > Proporciona independência dos dados
    > Representar visões diferentes do mesmo dado
    
-- Regras para executar operações DML através de uma Visão Simples
    > DML pode ser execultado em visões simples

-- Regras para executar operaçoes DML através de uma Visão
   > DELETE:
     - Não se remove linhas através de uma visão complexa que contém:
       * FUNÇÕES DE GRUPO
       * Cláusula GROUP BY
       * Palavra chave DISTINCT
       * Pseudocoluna ROWNUM
   > UPDATE:
     - Não se pode modificar linhas através de uma visão complexa que contém:
       * Funções de Grupo
       * GROUP BY
       * Palavra chave DISTINCT
       * Pseudocoluna ROWNUM
       * Colunas definidas por expressões
    > INSERT:
     - Não se pode modificar linhas através de uma visão complexa que contém:
       * Funções de Grupo
       * GROUP BY
       * Palavra chave DISTINCT
       * Pseudocoluna ROWNUM
       * Colunas definidas por expressões
       * Colunas NOT NULL nas tabelas base que não estejam no SELECT da Visão
       
-- Utilizando a Cláusula CHECK POINT
    > É possível garantir a expressão da cláusula WHERE da Visão para operações 
    DML executadas através da visão seja validas

-- Utilizando operações DML através da Visão
    > Você pode garantir que uma visão não permita operações DML incluindo a opção
    WITH READ ONLY na definição da Visão
    > Qualquer tentativa de executar uma operação DML através da visão resultará
    num erro ORACLE
*/

-- Criando uma visão
CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60;
-- Recuperando dados utilizando uma Visão
SELECT * 
FROM vemployeesdept60;

-- Criando uma visão complexa
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

-- Utilizando a cláusula CHECKE OPTION
CREATE OR REPLACE VIEW vemployeesdept100
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck; 

-- Utilizando a cláusula READ ONLY
CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

-- Removendo uma visão
 DROP VIEW vemployeesdept20;
