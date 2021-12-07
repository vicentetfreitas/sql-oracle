/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

-- SE��O 11 - Aula 01: Exibindo dados a partir de M�ltiplas Tabelas

-- OBJETIVOS
    > Escrever comandos SELECT para acessar dados de mais de uma tabela utilizando os v�rios tipos de JOIN;
    > Visualizar dados que n�o correspondem a uma condi��o de JOIN utilizando OUTER JOIN;
    > Executar um JOIN de uma tabela com ela mesma utilizando um SELF JOIN;;
    > Entender o que � um produto cartesiano;
    > Gerar um produto cartesiano utilizando um CROSS JOIN.

--  Tipos de JOIN compat�veis com SQL ANSI 1999
        Natural JOIN:
            -NATURAL JOIN
            -USING
            -ON
        OUTER JOIN:
            -LEFT OUTER JOIN
            -RIGHT OUTER JOIN
            -FULL OUTER JOIN
        CROSS JOIN
    
--  Qualificando nomes de colunas amb�guos
     > Utilize prefixos de tabelas para qualificar nomes de colunas que s�o iguais em multiplas tabelas;
     > Utilize preficos de tabela para otimizar a performace.
*/

-- Utilizando prefixos de coluna com nomes de tabelas
SELECT
    employees.employee_id, employees.last_name, employees.department_id,
    departments.department_name
FROM employees JOIN departments
    ON(employees.department_id = departments.department_id);
    
/*  
--  Qualificando nomes de colunas amb�guos
     > Ao inv�s de prefixos com o nome completo da tabela utilize Alias de Tabela;
     > Alias de Tabela podem ser nomes abreviados mantendo o c�digo SQL menor
       e utilizando menos mem�ria;
     > Utilize Alias de Tabela para diferenciar colunas que possuem nomes id�nticos,
       mas residem em tabelas diferentes.  */
SELECT 
    e.employee_id, e.last_name, e.department_id,
    d.department_name
FROM
    employees e JOIN departments d
    ON(e.employee_id = d.department_id);
    
/*  
--  Criando Natural Joins
     > A cl�usula NATURAL JOIN � baseada nem todas as colunas nas duas tabelas que
       possuem o mesmo nome;
     > Seleciona as linhas a partir de duas tabelas que possuem valores iguais em todas
       as colunas envolvidas na cl�usula;
     > Se as colunas possuem o mesmo nome, mas possuem diferentes tipos de dados, 
       um erro ser� retornado. 
*/
 -- Utilizando NATURAL JOIN
SELECT 
    department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations ;

/*  JOIN com a cl�usula USING - SQL ANSI 1999
        SELECT tabela.coluna, tabela.coluna
        FROM tabela
        JOIN tabela USING(nome_coluna)
    
    Utilizando Alias de Tabela com a Cl�usula USING
        N�o qualifique (prefixe) uma coluna que � utilizada na cl�usula USING
        */
SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e
    JOIN departments d USING(department_id);
    
    
/*  
--  Criando JOIN com a cl�usual ON
     > Utilize a cl�usula ON para especificar coindi��es ou espeficifcar colunas para o JOIN;
     > A condi��o de JOIN � separada de outras coindi��es de pesquisa;
     > A cl�usula ON torna o c�digo mais simples e f�cil de entender.
*/
SELECT
    e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
    ON(e.department_id = d.department_id);

-- JOIN utilizando v�rias tabelas com a cl�usula ON
SELECT 
    e.employee_id, 
    j.job_title, 
    d.department_name, 
    l.city, 
    l.state_province, 
    l.country_id
FROM employees e
    JOIN jobs j         ON (e.job_id        = j.job_id)
    JOIN departments d  ON (e.department_id = d.department_id)
    JOIN locations l    ON (d.location_id   = l.location_id)
ORDER BY e.employee_id;

-- Incluindo condi��es adicionais a condi��o de JOIN na cl�usula WHERE
SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    e.department_id,
    d.department_name
FROM 
    employees e JOIN departments d
    ON (e.department_id = d.department_id)
WHERE
    (e.salary BETWEEN 10000 AND 15000);

-- Incluindo condi��es adicionais a condi��o de JOIN utilizando AND
SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    e.department_id,
    d.department_name
FROM employees e JOIN departments d
    ON (e.department_id = d.department_id)
    AND (e.salary BETWEEN 1000 AND 15000);

-- Self JOIN utilizando a cl�usula ON
SELECT
    empregado.employee_id   "ID.EMPREGADO",
    empregado.last_name     "SOBRENOME EMPREGADO",
    gerente.employee_id     "ID.GERENTE",
    gerente.last_name       "SOBRENOME GERENTE"
FROM employees empregado JOIN employees gerente
    ON (empregado.employee_id = gerente.employee_id)
ORDER BY empregado.employee_id;
    