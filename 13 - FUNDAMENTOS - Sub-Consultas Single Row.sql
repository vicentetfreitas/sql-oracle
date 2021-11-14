/*
 SEÇÃO 11- AULA 1
21. Sub-Consultas Single-Row

--  OBJETIVOS

    Entender Sub-Consultas
    Entender os tipos de problemas que Sub-Consultas pode resolver
    Conhecer os tipos de Sub-Consultas
    Escrever Sub-Consultas tipo single-row e tipo multiple row
    Escrever Sub-Consultas multiple-row
    Escrever Sub-Consultas na Cláusula FROM
    
--  Utilizando uma Sub-Consulta para resolver um problema
    
    Quais empregados possuem o salário maior do que a média de salários?

--  Sintaxe de Sub-Consulta

    SELECT select-list
    FROM tabela
    WHERE expressão operador
    (SELECT select_list FROM tabela);
    
--  Comportamento da execução de Sub-Consultas

    A Sub-Consulta é executada antes da Consulta principal
    O resultado da Sub-Consulta é utilizado pelo consulta principal

--  Diretrizes para Sub-Consultas

    A Sub-Consulta deve ficar entre parênteses
    A Sub-Consulta deve ficar a direita do operador de comparação para melhor entendimento e 
    compreensão do código, entretanto, a Sub-Consulta pode aparecer em qualquer dado do operador
    Utilize operadores single-row com Sub-Consultas single-row
    Utilize operadores multiple-row com Sub-Consultas multiple-row
    
-- Sub-Consultas Single-Row

    Devem retornar somente uma linha
    Devem utilizar operadores de comparação single-row
    
   */
  
-- Sub-Consultas Single-Row
-- Quais empregados possuem o salário maior do que a média de salários?
SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary > (SELECT AVG(NVL(salary,0))FROM employees);

--  Utilizando Sub-Consultas na Cláusula HAVING
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


















