/*
 SEÇÃO 10 - AULA 1
13. Agregando dados utilizando Funções de Grupo

-- OBJETIVOS

   Conhecer as príncipais funções de grupo disponíveis
   Utilizar Funções de Grupo
   Agrupar dados utilizando a cláusula GROUP BY
   Incluir ou excluir grupos utilizando a cláusula HAVING

-- Príncipais funções de grupo

    AVG      -  Retorna a média do grupo
    COUNT    -  Número de linhas do grupo
    MAX      -  Maior valor do grupo
    MIN      -  Menor valor do grupo
    SUM      -  Somatório do grupo
    STDDEV   -  Desvio padrão do grupo
    VARIANCE -  Variância do grupo

-- Utilizando funções de grupo

   SELECT função_grupo(coluna),...
   FROM tabela
   [WHERE condição]
   [ORDER BY coluna];          
*/
    
/*  Utilizando as funções AVG e SUM
        As funções AVG e SUM podem ser utilizadas para dados númericos
*/
SELECT AVG(salary), SUM(salary)
FROM employees;

/*  Utilizando as funções MIN e MAX
        As funções MIN e MAX podem ser utilizadas para dados númericos, caracteres e datas
*/
SELECT MIN(hire_date) "MENOR DATA", MAX(hire_date) "MAIOR DATA"
FROM employees;

SELECT MIN(salary) "MENOR SALÁRIO", MAX(salary)  "MAIOR SALÁRIO"
FROM employees;

/*  Utilizando a função COUNT
        COUNT(*) retorna o número total de linhas */
SELECT COUNT(*)
FROM employees;

-- COUNT(expressão) retorna o número de linhas com valores não nulos para expressão
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

/*  Utilizando a função COUNT com DISTINCT
        COUNT(DISTINCT expressão) retorna o número de linhas distintas e valores
        não nulos para expressão.*/
SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(department_id)
FROM employees;

SELECT  department_id
FROM employees ;

/*  Funções de grupo e valores NULOS
        Funções de Grupo ignoram valores NULOS */
SELECT AVG(commission_pct)
FROM employees; -- FORMA ERRADA não leva em consideração null

SELECT AVG(NVL(commission_pct,0))
FROM employees;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    