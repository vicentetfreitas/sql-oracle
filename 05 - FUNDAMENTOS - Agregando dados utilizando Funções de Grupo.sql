/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

-- SE��O 10 - Aula 01: Agregando dados utilizando Fun��es de Grupo

-- OBJETIVOS
    > Conhecer as pr�ncipais fun��es de grupo dispon�veis
    > Utilizar Fun��es de Grupo
    > Agrupar dados utilizando a cl�usula GROUP BY
    > Incluir ou excluir grupos utilizando a cl�usula HAVING

-- Pr�ncipais fun��es de grupo
    > AVG      -  Retorna a m�dia do grupo
    > COUNT    -  N�mero de linhas do grupo
    > MAX      -  Maior valor do grupo
    > MIN      -  Menor valor do grupo
    > SUM      -  Somat�rio do grupo
    > STDDEV   -  Desvio padr�o do grupo
    > VARIANCE -  Vari�ncia do grupo      

OBS: por padr�o as fun��es de grupo n�o incluem valores nulos
*/
    
/*  Utilizando as fun��es AVG e SUM
    > As fun��es AVG e SUM podem ser utilizadas para dados n�mericos
*/
SELECT AVG(salary), SUM(salary)
FROM employees;

/*  Utilizando as fun��es MIN e MAX
        As fun��es MIN e MAX podem ser utilizadas para dados n�mericos, caracteres e datas
*/
SELECT MIN(hire_date) "MENOR DATA", MAX(hire_date) "MAIOR DATA"
FROM employees;

SELECT MIN(salary) "MENOR SAL�RIO", MAX(salary)  "MAIOR SAL�RIO"
FROM employees;

/*  Utilizando a fun��o COUNT
        COUNT(*) retorna o n�mero total de linhas */
SELECT COUNT(*)
FROM employees;

-- COUNT(express�o) retorna o n�mero de linhas com valores n�o nulos para express�o
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

/*  Utilizando a fun��o COUNT com DISTINCT
     > COUNT(DISTINCT express�o) retorna o n�mero de linhas distintas e valores
        n�o nulos para express�o.
*/
SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(department_id)
FROM employees;

SELECT  department_id
FROM employees ;

/*  Fun��es de grupo e valores NULOS
        Fun��es de Grupo ignoram valores NULOS */
SELECT AVG(commission_pct)
FROM employees; -- FORMA ERRADA n�o leva em considera��o null

SELECT AVG(NVL(commission_pct,0))
FROM employees;
  