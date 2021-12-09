/*OPERADORES SET*/

-- UNION
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date ,
    e.salary 
FROM employees e
WHERE department_id IN (60,90,100)
UNION
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date,
    e.salary 
FROM employees e 
WHERE e.job_id = 'IT_PROG'
ORDER BY employee_id ;

-- UNION ALL
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date ,
    e.salary 
FROM employees e
WHERE department_id IN (60,90,100)
UNION ALL
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date,
    e.salary 
FROM employees e 
WHERE e.job_id = 'IT_PROG'
ORDER BY employee_id ;

-- UNION ALL
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date ,
    e.salary 
FROM employees e
WHERE department_id IN (60,90,100)
INTERSECT
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date,
    e.salary 
FROM employees e 
WHERE e.job_id = 'IT_PROG'
ORDER BY employee_id ;

-- MINUS
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date ,
    e.salary 
FROM employees e
WHERE department_id IN (60,90,100)
MINUS
SELECT
    e.employee_id,
    e.job_id,
    e.hire_date,
    e.salary 
FROM employees e 
WHERE e.job_id = 'IT_PROG'
ORDER BY employee_id ;