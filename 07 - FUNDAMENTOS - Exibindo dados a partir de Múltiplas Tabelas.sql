/*
 SEÇÃO 11 - AULA 1
15. Exibindo dados a partir de Múltiplas Tabelas

-- OBJETIVOS
    Escrever comandos SELECT para acessar dados de mais de uma tabela utilizando os vários tipos de JOIN;
    Visualizar dados que não correspondem a uma condição de JOIN utilizando OUTER JOIN;
    Executar um JOIN de uma tabela com ela mesma utilizando um SELF JOIN;;
    Entender o que é um produto cartesiano;
    Gerar um produto cartesiano utilizando um CROSS JOIN.

--  Tipos de JOIN compatíveis com SQL ANSI 1999
        Natural JOIN:
            -NATURAL JOIN
            -USING
            -ON
        OUTER JOIN:
            -LEFT OUTER JOIN
            -RIGHT OUTER JOIN
            -FULL OUTER JOIN
        CROSS JOIN
    
--  Qualificando nomes de colunas ambíguos
        Utilize prefixos de tabelas para qualificar nomes de colunas que são iguais em multiplas tabelas;
        Utilize preficos de tabela para otimizar a performace.
*/

-- Utilizando prefixos de coluna com nomes de tabelas
SELECT
    employees.employee_id, employees.last_name, employees.department_id,
    departments.department_name
FROM employees JOIN departments
    ON(employees.department_id = departments.department_id);
    
/*  Qualificando nomes de colunas ambíguos
        Ao invés de prefixos com o nome completo da tabela utilize Alias de Tabela;
        Alias de Tabela podem ser nomes abreviados mantendo o código SQL menor
        e utilizando menos memória;
        Utilize Alias de Tabela para diferenciar colunas que possuem nomes idênticos,
        mas residem em tabelas diferentes.  */
SELECT 
    e.employee_id, e.last_name, e.department_id,
    d.department_name
FROM
    employees e JOIN departments d
    ON(e.employee_id = d.department_id);
    
/*  Criando Natural Joins
        A cláusula NATURAL JOIN é baseada nem todas as colunas nas duas tabelas que
        possuem o mesmo nome;
        Seleciona as linhas a partir de duas tabelas que possuem valores iguais em todas
        as colunas envolvidas na cláusula;
        Se as colunas possuem o mesmo nome, mas possuem diferentes tipos de dados, 
        um erro será retornado. */
 -- Utilizando NATURAL JOIN
SELECT 
    department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations ;

/*  JOIN com a cláusula USING - SQL ANSI 1999
        SELECT tabela.coluna, tabela.coluna
        FROM tabela
        JOIN tabela USING(nome_coluna)
    
    Utilizando Alias de Tabela com a Cláusula USING
        Não qualifique (prefixe) uma coluna que é utilizada na cláusula USING
        */
SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e
    JOIN departments d USING(department_id);
    
    
/*  Criando JOIN com a cláusual ON
        Utilize a cláusula ON para especificar coindições ou espeficifcar colunas para o JOIN;
        A condição de JOIN é separada de outras coindições de pesquisa;
        A cláusula ON torna o código mais simples e fácil de entender.
        
        SELECT tabela.coluna, tabela.coluna
        FROM tabela
        JOIN tabela ON(condição_join)
*/
SELECT
    e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
    ON(e.department_id = d.department_id);

-- JOIN utilizando várias tabelas com a cláusula ON
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

-- Incluindo condições adicionais a condição de JOIN na cláusula WHERE
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

-- Incluindo condições adicionais a condição de JOIN utilizando AND
SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    e.department_id,
    d.department_name
FROM employees e JOIN departments d
    ON (e.department_id = d.department_id)
    AND (e.salary BETWEEN 1000 AND 15000);

-- Self JOIN utilizando a cláusula ON
SELECT
    empregado.employee_id   "ID.EMPREGADO",
    empregado.last_name     "SOBRENOME EMPREGADO",
    gerente.employee_id     "ID.GERENTE",
    gerente.last_name       "SOBRENOME GERENTE"
FROM employees empregado JOIN employees gerente
    ON (empregado.employee_id = gerente.employee_id)
ORDER BY empregado.employee_id;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    