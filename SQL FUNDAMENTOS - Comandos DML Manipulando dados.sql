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
         
-- Variáveis de substituição
INSERT INTO departments
( department_id, department_name, location_id )
VALUES ( &department_id, '&department_name', &location ) ;
  