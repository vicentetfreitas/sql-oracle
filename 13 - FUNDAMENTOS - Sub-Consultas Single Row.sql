/*
 SE��O 11- AULA 1
21. Sub-Consultas Single-Row

--  OBJETIVOS

    Entender Sub-Consultas
    Entender os tipos de problemas que Sub-Consultas pode resolver
    Conhecer os tipos de Sub-Consultas
    Escrever Sub-Consultas tipo single-row e tipo multiple row
    Escrever Sub-Consultas multiple-row
    Escrever Sub-Consultas na Cl�usula FROM
    
--  Utilizando uma Sub-Consulta para resolver um problema
    
    Quais empregados possuem o sal�rio maior do que a m�dia de sal�rios?

--  Sintaxe de Sub-Consulta

    SELECT select-list
    FROM tabela
    WHERE express�o operador
    (SELECT select_list FROM tabela);
    
--  Comportamento da execu��o de Sub-Consultas

    A Sub-Consulta � executada antes da Consulta principal
    O resultado da Sub-Consulta � utilizado pelo consulta principal

--  Diretrizes para Sub-Consultas

    A Sub-Consulta deve ficar entre par�nteses
    A Sub-Consulta deve ficar a direita do operador de compara��o para melhor entendimento e 
    compreens�o do c�digo, entretanto, a Sub-Consulta pode aparecer em qualquer dado do operador
    Utilize operadores single-row com Sub-Consultas single-row
    Utilize operadores multiple-row com Sub-Consultas multiple-row
    
-- Sub-Consultas Single-Row

    Devem retornar somente uma linha
    Devem utilizar operadores de compara��o single-row
    
   */
  
-- Sub-Consultas Single-Row
-- Quais empregados possuem o sal�rio maior do que a m�dia de sal�rios?
SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary > (SELECT AVG(NVL(salary,0))FROM employees);

--  Utilizando Sub-Consultas na Cl�usula HAVING
SELECT 
    el.department_id, 
    MAX(el.salary)
FROM
    employees el
GROUP BY
    el.department_id
HAVING MAX(salary) < (SELECT AVG(e2.salary)FROM employees e2);
                                        
-- Erros utilizando Sub-consultas Single-Row
SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary =
                (SELECT    AVG(NVL(salary,0))
                 FROM      employees
                 GROUP BY  department_id);

-- O que ocorre quando a Sub-Consulta retorna nenhuma linha?
SELECT employee_id, first_name, last_name
FROM   employees
WHERE  last_name =  (SELECT last_name
                     FROM   employees
                     WHERE  last_name = 'Suzuki');


















