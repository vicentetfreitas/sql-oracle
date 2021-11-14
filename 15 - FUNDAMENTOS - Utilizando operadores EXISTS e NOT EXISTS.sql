/*
 SEÇÃO 11- AULA 3
23.Utilizando operadores EXISTS e NOT EXISTS
    
   */
-- Utilizando operador IN
SELECT 
    d.department_id,
    d.department_name
FROM 
    departments d
WHERE
    d.department_id IN (SELECT e.department_id FROM employees e);
    
-- Utilizando o operador EXISTS
SELECT
    d.department_id,
    d.department_name
FROM 
    departments d
WHERE 
    EXISTS (SELECT e.department_id
            FROM employees e
            WHERE d.department_id = e.department_id);
            
-- Utilizando o operador NOT IN
SELECT
    d.department_id,
    d.department_name
FROM 
    departments d
WHERE 
    d.department_id NOT IN (SELECT e.department_id
            FROM employees e
            WHERE d.department_id = e.department_id);
            
 -- Utilizando o operador NOT EXISTS
SELECT
    d.department_id,
    d.department_name
FROM 
    departments d
WHERE 
    NOT EXISTS (SELECT e.department_id
            FROM employees e
            WHERE d.department_id = e.department_id);           
            
            
            