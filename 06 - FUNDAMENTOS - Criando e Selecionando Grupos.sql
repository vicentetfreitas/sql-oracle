/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

-- SE��O 10 - Aula 02: Criando e Selecionando Grupos

--  Sequencia L�gica
     > 1.WHERE - Selecione as linhas a serem recuperadas;
     > 2.GROUP BY - Formar os grupos;
     > 3.HAVING - Selecione so grupos a serem recuperados;
     > 4.Exibir colunas ou express�es do SELECT ordenando pelo crit�rio definido no ORDER BY
*/

-- Criando grupos utilizando a cl�usula GROUP BY
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

/*
-- Utilizando a cl�usula GROUP BY
    > Se o SELECT utiliza grupos, ent�o todas as colunas ou express�es na lista da
    cl�usula SELECT que n�o est�o em uma fun��o de groupo devem estar na cl�usula GROUP BY
*/

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas incorretas utilizando fun��es de grupo
SELECT department_id, AVG(salary)
FROM employees;

-- Corrigindo consulta incorretas utilizando fun��es de grupo
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

/* 
--  Consultas incorretas utilizando fun��es de grupo
     > Voc� n�o pode utilizar a cl�usula WHERE para retringir grupos
     > Voc� n�o pode utilizar a Fun��es de grupo na cl�usula WHERE
     OBS: Utilizar a cl�usula HAVING para restringir grupos.
*/
SELECT department_id, MAX(salary)
FROM employees
WHERE MAX(salary) > 10000
GROUP BY department_id;

/*  
--  Corrigindo consultas incorretas utilizando Fun��es de Grupo
    Restrigindo grupos utilizando a cl�usula HAVING
        SELECT coluna, fun��o_grupo
        FROM tabela
        [WHERE condi��o_linhas]
        [GROUP BY express�o_grupo]
        [HAVING condi��o_grupos]
        [ORDER BY coluna]; 
*/
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

--  Usando sequ�ncia l�gica
SELECT job_id, SUM(salary) TOTAL
FROM employees
WHERE job_id <> 'SAP_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary);

/*  
--  Aninhando fun��es de grupo
     > Exibindo a maior m�dia de sal�rio por departamento
*/
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;
   