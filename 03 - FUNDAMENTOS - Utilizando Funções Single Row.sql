/*
Autor: Vicente T Freitas
Descrição: Curso de Oracle SQL Especialista: do Básico ao Avançado

--  SEÇÃO 08 - Aula 01: Utilizando Funções Single Row

--  OBJETIVOS
     > Conhecer os vários tipos de funções disponíveis no SQL
     > Utilizar funções single row para trabalhar com string de caracteres, números e datas

--  ANOTAÇÕES
--  Tipos de Funções SQL
     > Single row functions
     > Multiple row functions
     
--  Funções SQL Single row
    > Características:
        - Podem manipular itens de dados;
        - Receber argumentos e retornar um valor;
        - Atuam sobre cada linha retornada;
        - Retornam um resultado por linha;
        - Podem modificar o tipo de dado;
        - Podem ser aninhadas;
        - Recebem argumentos que podem ser colunas ou expressões.
        
--  Sintaxe:
     > nome_funcao[(arg1,arg2,...)]
    
--  Tipos:
     > Character
     > Number
     > Date
     > Conversion
     > General

--  Funções Tipo Characterer 
     > LOWER('Introdução ORACLE 19c')   =>  introdução oracle 19c
     > UPPER('Introdução ORACLE 19c')   =>  INTRODUÇÃO ORACLE 19C
     > INITCAP('Introdução ORACLE 19c') =>  Introdução Oracle 19c
*/
--Funções de Conversão Maiúsculo e Minúsculo:
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

SELECT employee_id,last_name, department_id -- EXIBIR  UPPER(last_name)
FROM employees -- DE ONDE TABELA
WHERE UPPER(last_name) = 'KING'; -- CONDIÇÃO

--Funções de Manipulação de Caracteres
SELECT 
    CONCAT('Curso:', 'Introdução ORACLE 19c'),
    SUBSTR('Introdução ORACLE 19c',1,11),
    LENGTH('Introdução ORACLE 19c'),
    INSTR('Introdução ORACLE 19c','ORACLE')
FROM dual;

-- Funções de manipulação de caracterer
SELECT 
    CONCAT('Curso: ', 'Introdução ORACLE 19C'),      --  Curso: Introdução ORACLE 19c
    SUBSTR('Introdução ORACLE 19c',1,11),            --  Introdução
    LENGTH('Introdução ORACLE 19c'),                 --  21
    INSTR('Introdução ORACLE 19c','ORACLE'),         --  12
    LPAD('Introdução ORACLE 19c',10,'*'),            --  **********Introdução ORACLE 19c
    RPAD('Introdução ORACLE 19c',10,'*'),            --  Introdução ORACLE 19c**********
    REPLACE('Introdução ORACLE 12c','12c','19c'),    --  Introdução ORACLE 19c
    TRIM(';'FROM 'nome@gmail.com;'),                 --  nome@gmail.com
    RTRIM('nome@gmail.com',';'),                     --  nome@gmail.com
    LTRIM(' nome@gmail.com','')                      --  nome@gmail.com
FROM dual;

SELECT 
    first_name "Nome",
    LPAD(first_name,20,' ') "Nome alinhado a direita",
    RPAD(first_name,20,' ') "Nome alinhado a esquerda"
FROM employees;

SELECT 
    job_title, REPLACE(job_title,'President', 'Presidente') CARGO
FROM jobs
WHERE job_title = 'President';

/*
    > ROUND: arredonda o valor para a casa decimal especificada
    > TRUNC: Trunca o valor para a casa decimaal especificada
    > MOD: Retorna o resto da divisão
*/
--  Funções tipo NUMBER
SELECT 30000 * 1.25 FROM dual;

SELECT
    ROUND(45.923,2),ROUND(45.923,0)
FROM dual;

SELECT
    TRUNC(45.923,2),TRUNC(45.923,0)
FROM dual;

SELECT
    MOD(1300,600) RESTO
FROM dual;

SELECT ABS(-9), SQRT(9)
FROM dual;

/*
--  Funções tipo DATE - Trabalhando com Datas
     > O format default de exibição de datas é definido pelo DBA através do parametro NLS_DATE_FORMAT;
     > No Brasil normalmente o formato default de exibição de datas é definido para 'DD/MM/YY' ou 'DD/MM/RR'.
*/
SELECT sysdate
FROM dual;

DESC dual;
SELECT * FROM dual;

/*
    > Uma vez que o banco de dados armazena datas como números, você pode executar 
    cálculos utilizando os operadores aritméticos como a adição e subtração
    
     - data + número       =   data            =>  Adiciona o número de dias para uma data
     - data - número       =   data            =>  Subtrai um número de dias a partir de uma data
     - data - data         =   Número de dias  =>  Subtrai uma data a partir de outra
     - data + número/24    =   data            =>  Adiciona o número de horas para uma data
     
     - MONTHS_BETWEEN      =   Número de meses entre duas datas
     - ADD_MONTHS          =   Adiciona meses a uma data.
     - NEXT_DAY            =   Próximo dia relativo a data especificada.
     - LAST_DAY            =   Últimos dias do mês.
     - ROUND               =   Arredonda a data.
     - TRUNC               =   Trunca a data.
    
     - SYSDATE = '07/02/20'
     - ROUND(SYSDATE, 'MONTH')      =>  01/02/20
     - ROUND(SYSDATE, 'YEAR')       =>  01/01/20
     - TRUNC(SYSDATE, 'MONTH')      =>  01/02/20
     - TRUNC(SYSDATE, 'YEAR')       =>  01/01/20
     - TRUNC(SYSDATE)               =>  07/02/20
                                         Zero Hora, Zero Minuto, Zero Segundo
*/
-- Cálculos com Datas
SELECT SYSDATE, SYSDATE + 30, SYSDATE + 40, SYSDATE - 30
FROM dual;

SELECT last_name, ROUND((SYSDATE-hire_date)/7,2) "SEMANAS DE TRABALHO"
FROM employees;

-- Outras funções do tipo DATE
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE,hire_date),2)"MESES DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE,3), NEXT_DAY(SYSDATE,'SEXTA FEIRA'), LAST_DAY(SYSDATE)
FROM dual;

SELECT SYSDATE, ROUND(SYSDATE,'MONTH'), ROUND(SYSDATE,'YEAR'), TRUNC(SYSDATE,'MONTH'), TRUNC(SYSDATE,'YEAR')
FROM dual;

SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE),'DD/MM/YYYY HH24:MI:SS')
FROM dual;

SELECT last_name, TO_CHAR(hire_date,'DD, "de", Month, "de",YYYY') DT_ADMISSÃO
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD "de", Month, "de" YYYY  ')DT_ADMISSÃO
FROM employees;

-- Utilizando a função TO_CHAR com Números
SELECT first_name, last_name, TO_CHAR(salary,'L99G999G999D99') SALARIO
FROM employees;

-- Utilizando a função TO_NUMBER
SELECT TO_NUMBER('21000,50')
FROM dual;

 --Utilizando a função TO_DATE
 SELECT TO_DATE('06/02/2020','DD/MM/YYYY')DATA
 FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

/*
--  Funções Genéricas
     > As funções a seguir trabalham com quaisquer tipo de dado:
     > NVL(expr1, expr2)
     > NVL2(expr1,expr2, expr3)
     > NULLIF(expr1, expr2,)
     > COALESCE(expr1, expr2, ..., exprn)
*/
--Utilizando funções aninhadas
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0)NUMERO_MESES
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Utilizando Função NVL
SELECT last_name, salary, NVL(commission_pct,0), salary*12 SALARIO_ANUAL,
(salary*12) + (salary*12*NVL(commission_pct,0)) REMUNERAÇÃO_ANUAL
FROM employees;