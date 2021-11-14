/*
 SEÇÃO 10 - AULA 2
14. Criando e Selecionando Grupos

-- Criando Grupos utilizando a Cláusula GROUP BY

  SELECT coluna, função_group(coluna)
  FROM tabela
  [WHERE condição]
  [GROUP BY expressão_group_by]
  [ORDER BY];

-- Sequencia Lógica

    1.WHERE - Selecione as linhas a serem recuperadas;
    2.GROUP BY - Formar os grupos;
    3.HAVING - Selecione so grupos a serem recuperados;
    4.Exibir colunas ou expressões do SELECT ordenando pelo critério definido no ORDER BY
*/
-- Criando grupos utilizando a cláusula GROUP BY
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

/*
-- Utilizando a cláusula GROUP BY

   Se o SELECT utiliza grupos, então todas as colunas ou expressões na lista da
   cláusula SELECT que não estão em uma função de groupo devem estar na cláusula
   GROUP BY
*/

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas incorretas utilizando funções de grupo
SELECT department_id, AVG(salary)
FROM employees;

-- Corrigindo consulta incorretas utilizando funções de grupo
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

/* Consultas incorretas utilizando funções de grupo
    Você não pode utilizar a cláusula WHERE para retringir grupos
    Você não pode utilizar a Funções de grupo na cláusula WHERE
    
    OBS: Utilizar a cláusula HAVING para restringir grupos.
*/
SELECT department_id, MAX(salary)
FROM employees
WHERE MAX(salary) > 10000
GROUP BY department_id;

/*  Corrigindo consultas incorretas utilizando Funções de Grupo
    Restrigindo grupos utilizando a cláusula HAVING
        SELECT coluna, função_grupo
        FROM tabela
        [WHERE condição_linhas]
        [GROUP BY expressão_grupo]
        [HAVING condição_grupos]
        [ORDER BY coluna]; */
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

--  Usando sequência lógica
SELECT job_id, SUM(salary) TOTAL
FROM employees
WHERE job_id <> 'SAP_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary);

/*  Aninhando funções de grupo
        Exibindo a maior média de salário por departamento*/
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;


 
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    