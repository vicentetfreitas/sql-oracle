/*
 SEÇÃO 11- AULA 4
25.Utilizando Sub-consultas Multiple-Column

SINTAXE:
    SELECT t1.coluna1, t1.coluna2, t1.coluna3
    FROM tabela1 t1
    WHERE(t1.coluna1, t1.coluna2) IN (SELECT t2.coluna1, t2.coluna2)
        FROM tabela2 t2
        WHERE condição...)
    
   */

--  Utilizando Sub-consultas Multiple-Column

SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.salary
FROM
    employees e1
WHERE (e1.job_id, e1.salary) IN (SELECT e2.job_id, MAX(e2.salary)
                                 FROM
                                    employees e2
                                 GROUP BY e2.job_id);


            
            