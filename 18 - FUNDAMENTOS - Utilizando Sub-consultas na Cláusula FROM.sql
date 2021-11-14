/*
 SEÇÃO 12- AULA 6
26.Utilizando Sub-consultas na Cláusula FROM

   
   */

--  Utilizando Sub-consultas Multiple-Column

SELECT
    empregados.employee_id,
    empregados.first_name,
    empregados.last_name,
    empregados.job_id,
    empregados.salary,
    ROUND(max_salary_job.max_salary,2) MAX_SALARY,
    empregados.salary - ROUND(max_salary_job.max_salary,2) DIFERENÇA
FROM
    employees empregados
    LEFT JOIN (SELECT e2.job_id, MAX(e2.salary)max_salary 
                FROM employees e2
                GROUP BY e2.job_id) max_salary_job
            ON empregados.job_id = max_salary_job.job_id;


            
            