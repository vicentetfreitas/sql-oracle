/*
 SEÇÃO 12 - AULA 4
18. OUTERT Joins
   Retornando Registros que não correspondem a coindição de JOIN utilizando 
   OUTER JOIN

    LEFT JOIN
        Um JOIN entre duas tabelas que retorna as linhas que resultam do INNER JOIN
        e também as linhas que não coincidem a partir da tabela left é chamado de LEFT OUTER JOIN
   */
  
-- LEFT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;

-- RIGHT OUTER JOIN
SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM employees e RIGHT OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;

-- FULL OUTER JOIN
SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM   employees e FULL OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;