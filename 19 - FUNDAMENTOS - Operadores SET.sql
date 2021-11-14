/*
 SEÇÃO 13- AULA 1
27. Operadores SET

-- OBJETIVOS
    
    Conhecer e entender os operadores SET
    Utilizar operadores SET para combinar mútiplas consultas em uma única consulta
    Controlar a ordem que as linhas são retornadas.

--  Diretrizes para utilização de operadores SET
    
    O número de colunas ou expressões na lista de colunas ou expressões em cada SELECT
    devem ser iguais.
    O tipo de daddo de cada coluna ou expressão na lista de colunas ou expressions em cada SELECT
    respectivamente devem combinar;
    Parênteses podem ser utilizados para alterar a sequência de execução;
    A cláusula ORDER BY deve ser somente para o resultado final.
    Linhas duplicadas são automatcamente eliminadas, exceto pelo operador UNION ALL
    São os nomes de colunas da primeira consulta que aparecem no cabeçalho do resultado.
    A cláusula ORDER BY somente pode aparecer no final da consulta resultante.
    As consultas componentes não podem ter cláusula ORDER BY individual.
    Na cláusula ORDER BY referencie somente as colunas ou expressões do primeiro SELECT
    
--  Utilizando o operador UNION

    O operador UNION retorna linhas de ambas as consultas após eliminar as duplicadas

   */


--  Utilizando o operador UNION

   -- O operador UNION retorna linhas de ambas as consultas após eliminar as duplicadas
DESC employees;   
   
SELECT 
    e.employee_id,
    e.job_id,
    e.hire_date,
    e.salary
FROM 
    employees e
WHERE
    e.department_id IN(60, 90, 100)
UNION
SELECT
    e.employee_id, 
    e.job_id, 
    e.hire_date, 
    e.salary
FROM employees e
WHERE job_id = 'IT_PROG'
ORDER BY employee_id;
    
--  Utilizando o operador UNION ALL
/*  O operador UNION ALL retorna linhas de ambas as consultas, incluindo todas as
    linhas duplicadas*/

SELECT
    employee_id, job_id, hire_date, salary
FROM
    employees
WHERE
    job_id = 'IT_PROG'
UNION ALL
SELECT
    employee_id, job_id, hire_date, salary
FROM
    employees
WHERE
    department_id = 60
ORDER BY employee_id;
    
-- Utilizando operador INTERSECT

SELECT
    employee_id,
    job_id
FROM 
    employees
WHERE
    job_id = 'IT_PROG'
INTERSECT
SELECT
    employee_id,
    job_id
FROM
    employees
WHERE
    department_id IN (60,90,100)
ORDER BY employee_id;
    
-- Utilizando operador MINUS

SELECT
    employee_id,
    job_id
FROM
    employees
WHERE
    department_id IN (60,90,100)
MINUS
SELECT
    employee_id,
    job_id
FROM
    employees
WHERE
    job_id = 'IT_PROG'
ORDER BY employee_id;
    

-- Cuidados com os tipos de dados na lista de colunas ou expressões do SELECT

SELECT employee_id, job_id, hire_date
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Corrigindo o erro

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Utilizando mais de um operador SET

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
(SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  salary > 10000)
ORDER BY employee_id;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

            
            