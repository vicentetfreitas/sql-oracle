/*
 SEÇÃO 11- AULA 2
22. Sub-Consultas Multiple-row

--  Sub-Consultas Multiple-Row

    Possibilitam que a Sub-Consulta retorne mais do que uma linha
    Utiliza operadores de comparação multiple-row
    
--  Operadores de comparação Multiple-row
    
    IN Igual a qualquer membro da lista
    
    ANY Deve ser precedido por =, !=, >, <, <=, >=
    Compara um valor para qualquer valor na lista retornada pela Sub-Consulta.
    Retorna FALSE se a Sub-Consulta retornar nenhuma linha.

    ALL Deve ser precedido por =, !=, >, <, <=, >=.
    Compara um valor para todos os valores na lista retornada pela Sub-Consulta.
    Retorna TRUE se a Sub-Consulta retornar nenhuma linha.
    

    
   */
  
-- Sub-Consultas Multiple-Row
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    salary IN (SELECT AVG(NVL(salary,0))FROM employees GROUP BY department_id);

--  Utilizando NOT IN em Sub-Consultas Multiple-row
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary NOT IN 
             (SELECT AVG(NVL(salary,0))FROM employees GROUP BY department_id);

-- Utilizando operador ANY em Sub-consultas Multiple-Row
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG' );

-- Utilizando operador ALL em Sub-consultas Multiple-Row
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG' );

-- Cuidados com Valores Nulos em uma Sub-Consulta com Operador IN
SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id IN(SELECT mgr.manager_id FROM employees mgr);

-- Cuidados com Valores Nulos em uma Sub-Consulta com operador NOT IN
    --  Quando a subconsulta retorna valores NULL a consulta principal não retorna nenhuma linha
SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN (SELECT mgr.manager_id FROM employees mgr);





