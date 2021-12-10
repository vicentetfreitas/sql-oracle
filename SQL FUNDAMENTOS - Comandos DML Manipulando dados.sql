/*Comandos DML Manipulando dados*/

-- INSERT 
INSERT INTO departments( department_id, department_name, manager_id, location_id )
VALUES (280, 'Project Management', 103, 1400);

-- INSERT NULL 
INSERT INTO departments( department_id, department_name, manager_id, location_id )
VALUES (280, 'Data Science', NULL, NULL);

COMMIT;

-- Inserindo valores especiais retornados de funções
INSERT INTO employees 
( employee_id, first_name, last_name, email, phone_number, hire_date, 
  job_id, salary, commission_pct, manager_id, department_id )
VALUES ( 207, 'Rock', 'Balboa', 'DROCK', '525.342.237', SYSDATE,
         'IT_PROG', 7000, NULL, 103, 60);
  
-- Inserindo data e hora específicas
INSERT INTO employees 
( employee_id, first_name, last_name, email, phone_number, hire_date, 
  job_id, salary, commission_pct, manager_id, department_id )
VALUES ( 208, 'Vito', 'Corleone', 'VCORL', '525.342.237', TO_DATE('08/12/2021','DD/MM/YY'),
         'IT_PROG', 20000, NULL, 103, 60) ;
         
SELECT * FROM employees
ORDER BY employee_id DESC;

-- Variáveis de substituição
INSERT INTO departments
( department_id, department_name, location_id )
VALUES ( &department_id, '&department_name', &location ) ;

SELECT * FROM departments
ORDER BY department_id;

-- Criando tabela
CREATE TABLE sales_reps(
    id NUMBER(6,0),
    name VARCHAR2(20),
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2)
) ;

-- Inserindo dados apartir de uma consulta
INSERT INTO sales_reps( id, name, salary, commission_pct )
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

SELECT * FROM sales_reps;
-- Delete tabela
DROP TABLE sales_reps;
ROLLBACK;

-- UPDATE
UPDATE employees
SET salary = salary * 1.2;
ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';
ROLLBACK;
SELECT * FROM employees;

-- UPDATE com sub-consultas
UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 141)
WHERE employee_id = 140;

-- DELETE
DELETE FROM countries
WHERE country_name = 'Nigeria';
ROLLBACK;

-- ROLLBACK
DELETE FROM employees
WHERE employee_id = 206;
SELECT * FROM employees
WHERE employee_id = 206;
ROLLBACK;
SELECT * FROM employees
WHERE employee_id = 206;
-- COMMIT;

  