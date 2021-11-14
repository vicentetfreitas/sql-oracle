/*
 SEÇÃO 11- AULA 6
20. Joins utilizando sintaxe Oracle

--  Tipos de Joins utilizando sintaxe Oracle
    EQUIJOIN
    NONEQUINJOIN
    OUTER JOIN
    SELF-JOIN
    
    --  EQUIJOIN  utilizando a sintaxe oracle
    Sintaxe:
    SELECT tabela1.coluna, tabela2.coluna...
    FROM tabela1, tabela2
    WHERE tabela1.coluna = tabela2.coluna;

   */
  
/* Sintaxe:
    SELECT tabela1.coluna, tabela2.coluna...
    FROM tabela1, tabela2
    WHERE tabela1.coluna = tabela2.coluna;*/
--  EQUIJOIN  utilizando a sintaxe oracle
SELECT
    e.employee_id, 
    e.last_name, 
    e.department_id, 
    d.department_id, 
    d.location_id 
FROM 
    employees e,
    departments d
WHERE   (e.department_id = d.department_id)
ORDER BY e.department_id;

-- Joins entre várias tabelas utilizando a Sintaxe Oracle
SELECT
    e.employee_id,
    j.job_title,
    d.department_name,
    l.city,
    l.state_province,
    l.country_id
FROM
    employees e,
    jobs j,
    departments d,
    locations l
WHERE 
        (e.job_id           =  j.job_id) 
    AND (d.department_id    =  e.department_id)
    AND (d.location_id      =  l.location_id)    
ORDER BY employee_id;

-- Incluindo condições adicionais a coindição de JOIN utilizando AND

SELECT
    e.employee_id       "ID EMPREGADO",
    e.salary            "SALÁRIO",
    j.job_title         "CARGO",
    d.department_name   "NOME DAPARTAMENTO",
    l.city              "CIDADE",
    l.state_province    "ESTADO",
    l.country_id        "PAÍS"
FROM
    employees e,
    jobs j,
    departments d,
    locations l
WHERE
    (e.job_id = j.job_id)               AND
    (e.department_id = d.department_id) AND
    (d.location_id = l.location_id)     AND
    (e.salary >= 1000)
ORDER BY e.employee_id;

-- NONEQUINJOIN utilizando Sintaxe ORACLE

SELECT
    e.employee_id,
    e.salary,
    j.grade_level,
    j.lowest_sal,
    j.highest_sal
FROM 
    employees e,
    job_grades j
WHERE 
    NVL(e.salary,0) BETWEEN
    j.lowest_sal AND j.highest_sal
ORDER BY e.salary;

/*
-- OUTER JOIN utilizando Sintaxe ORACLE

    --  SINTAXE:
    SELECT tabela1.coluna, tabela2.coluna
    FROM tabela1, tabela2
    WHERE tabela1.coluna(+) = tabela2.coluna;
    
    SELECT tabela1.coluna, tabela2.coluna
    FROM tabela1, tabela2
    WHERE tabela1.coluna = tabela2.coluna(+)
*/

SELECT 
    e.first_name, 
    e.last_name, 
    d.department_id, 
    d.department_name
FROM 
    employees e,
    departments d
WHERE
    e.department_id = d.department_id(+)
ORDER BY e.department_id;

SELECT 
    e.first_name, 
    e.last_name, 
    d.department_id, 
    d.department_name
FROM 
    employees e,
    departments d
WHERE
    e.department_id(+) = d.department_id
ORDER BY e.first_name;

-- Self-join Utilizando Sintaxe Oracle

SELECT
    empregado.employee_id "ID EMPREGADO",
    empregado.last_name "SOBRENOME EMPREGADO",
    gerente.employee_id "ID GERENTE",
    gerente.last_name "SOBRENOME GERENTE"
FROM
    employees empregado,
    employees gerente
WHERE
    (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id;


SELECT
    empregado.employee_id "ID EMPREGADO",
    empregado.last_name "SOBRENOME EMPREGADO",
    gerente.employee_id "ID GERENTE",
    gerente.last_name "SOBRENOME GERENTE"
FROM
    employees empregado,
    employees gerente
WHERE
    (empregado.manager_id = gerente.employee_id(+))
ORDER BY empregado.employee_id;

-- Produto Cartesiano

SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;














