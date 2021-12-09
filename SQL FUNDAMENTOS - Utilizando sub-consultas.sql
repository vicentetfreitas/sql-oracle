/*Sub-consultas*/

-- Sub-consulta single-row
-- A sub-consulta retorna apenas uma linha
SELECT 
    e.first_name    "NOME",
    e.last_name     "SOBRENOME",
    e.job_id        "ID.CARGO",
    e.salary        "SALÁRIO"
FROM employees e
WHERE e.salary > 
                ( SELECT AVG(NVL(e.salary,0)) FROM employees e ) ;
            
--  Utilizando Sub-consultas na cláusula HAVING
--  Maior salário menor que a média
SELECT 
    e1.department_id "CÓD.DEPARTAMENTO",
    MAX(e1.salary)   "MAIOR SALÁRIO"
FROM employees e1
GROUP BY e1.department_id
HAVING MAX(e1.salary) < ( SELECT AVG(e2.salary) 
                          FROM employees e2 ) 
ORDER BY 1 ;

-- Sub-consultas multiple-row
-- Retorna mais de uma linha
-- Empregados que possuem média de salário igual a média de salário de seu departamento
SELECT
    e.employee_id "ID.EMPREGADO",
    e.first_name "NOME",
    e.last_name "SOBRENOME"
FROM employees e
WHERE e.salary IN 
                ( SELECT AVG(NVL(e.salary,0)) 
                  FROM employees e
                  GROUP BY e.department_id ) ;
                  
-- Empregados que possuem média de salário igual a média de salário de seu departamento
SELECT
    e.employee_id "ID.EMPREGADO",
    e.first_name "NOME",
    e.last_name "SOBRENOME"
FROM employees e
WHERE e.salary NOT IN 
                ( SELECT AVG(NVL(e.salary,0)) 
                  FROM employees e
                  GROUP BY e.department_id ) ;
                  
-- Utilizando operador ANY em Sub-consultas Multiple-row
-- Empregados cujo salario seja menor do que ANY(qualquer coisa) do resultado da sub-consulta
SELECT
    e.employee_id "ID.EMPREGADO",
    e.last_name   "SOBRENOME",
    e.job_id      "CARGO",
    e.salary      "SALARIO"
FROM employees e
WHERE salary < ANY 
                  ( SELECT e.salary "SALARIO"
                    FROM   employees e
                    WHERE  e.job_id = 'IT_PROG' );

-- Utilizando operador ALL em Sub-consultas Multiple-row
-- Empregados cujo salario seja menor do que ALL(Todos) do resultado da sub-consulta
SELECT
    e.employee_id "ID.EMPREGADO",
    e.last_name   "SOBRENOME",
    e.job_id      "CARGO",
    e.salary      "SALARIO"
FROM employees e
WHERE salary < ALL 
                  ( SELECT e.salary "SALARIO"
                    FROM   employees e
                    WHERE  e.job_id = 'IT_PROG' );
                    
-- Valores nulos em uma sub-consulta com operador NOT IN
SELECT  e.employee_id, e.last_name 
FROM employees e
WHERE e.employee_id NOT IN
                    ( SELECT mgr.manager_id
                        FROM employees mgr);
                        
-- Utilizando operadores EXISTS e NOT EXISTS
-- Alternativa ao operador IN e NOT IN - Verificar performace
SELECT 
    d.department_id,
    d.department_name
FROM departments d
WHERE EXISTS
        ( SELECT e.department_id
          FROM employees e
          WHERE d.department_id = e.department_id ) ;
          
SELECT 
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS 
        ( SELECT e.department_id
          FROM employees e
          WHERE d.department_id = e.department_id ) ;

-- Utilizando Sub-consulta correlacionada
SELECT
    e1.employee_id      "ID.EMPREGADO",
    e1.first_name       "NOME",
    e1.last_name        "SOBRENOME", 
    e1.department_id    "ID.DEPARTAMENTO",
    e1.salary           "SALÁRIO"
FROM
    employees e1
WHERE e1.salary >=
                 ( SELECT TRUNC(AVG(NVL(e2.salary,0)),0) 
                   FROM  employees e2
                   WHERE e1.department_id = e2.department_id ) ;

-- Utilizando Sub-consulta Multiple-Column
-- Retorna mais de uma coluna
SELECT 
    e1.employee_id  "ID.EMPREGADO", 
    e1.first_name   "NOME", 
    e1.job_id       "CÓD.DEPARTAMENTO", 
    e1.salary       "SALÁRIO"
FROM employees e1
WHERE (e1.job_id, e1.salary) IN ( SELECT e2.job_id, MAX(e2.salary) 
                                  FROM employees e2
                                  GROUP BY e2.job_id ) 
ORDER BY e1.salary DESC ;

-- Utilizando Sub-consultas na Cláusula FROM
SELECT
    e.employee_id   "ID.EMPREGADO",
    e.first_name    "NOME",
    e.last_name     "SOBRENOME",
    e.job_id        "CÓD.DEPARTAMENTO",
    e.salary        "SALÁRIO",
    ROUND(max_salary_job.max_salary, 2) "MAIOR SALÁRIO",
    e.salary - ROUND(max_salary_job.max_salary, 2) DIFERENÇA
FROM employees e 
    LEFT JOIN 
             ( SELECT e2.job_id , MAX(e2.salary) max_salary
               FROM  employees e2
               GROUP BY e2.job_id ) max_salary_job
         ON e.job_id = max_salary_job.job_id ;


