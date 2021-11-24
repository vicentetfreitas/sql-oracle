/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

--  SE��O 08 - Aula 01: Utilizando Fun��es Single Row

--  OBJETIVOS
     > Conhecer os v�rios tipos de fun��es dispon�veis no SQL
     > Utilizar fun��es single row para trabalhar com string de caracteres, n�meros e datas

--  ANOTA��ES
--  Tipos de Fun��es SQL
     > Single row functions
     > Multiple row functions
     
--  Fun��es SQL Single row
    > Caracter�sticas:
        - Podem manipular itens de dados;
        - Receber argumentos e retornar um valor;
        - Atuam sobre cada linha retornada;
        - Retornam um resultado por linha;
        - Podem modificar o tipo de dado;
        - Podem ser aninhadas;
        - Recebem argumentos que podem ser colunas ou express�es.
        
--  Sintaxe:
     > nome_funcao[(arg1,arg2,...)]
    
--  Tipos:
     > Character
     > Number
     > Date
     > Conversion
     > General

--  Fun��es Tipo Characterer 
     > LOWER('Introdu��o ORACLE 19c')   =>  introdu��o oracle 19c
     > UPPER('Introdu��o ORACLE 19c')   =>  INTRODU��O ORACLE 19C
     > INITCAP('Introdu��o ORACLE 19c') =>  Introdu��o Oracle 19c
*/
--Fun��es de Convers�o Mai�sculo e Min�sculo:
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

SELECT employee_id,last_name, department_id -- EXIBIR  UPPER(last_name)
FROM employees -- DE ONDE TABELA
WHERE UPPER(last_name) = 'KING'; -- CONDI��O

--Fun��es de Manipula��o de Caracteres
SELECT 
    CONCAT('Curso:', 'Introdu��o ORACLE 19c'),
    SUBSTR('Introdu��o ORACLE 19c',1,11),
    LENGTH('Introdu��o ORACLE 19c'),
    INSTR('Introdu��o ORACLE 19c','ORACLE')
FROM dual;

-- Fun��es de manipula��o de caracterer
SELECT 
    CONCAT('Curso: ', 'Introdu��o ORACLE 19C'),      --  Curso: Introdu��o ORACLE 19c
    SUBSTR('Introdu��o ORACLE 19c',1,11),            --  Introdu��o
    LENGTH('Introdu��o ORACLE 19c'),                 --  21
    INSTR('Introdu��o ORACLE 19c','ORACLE'),         --  12
    LPAD('Introdu��o ORACLE 19c',10,'*'),            --  **********Introdu��o ORACLE 19c
    RPAD('Introdu��o ORACLE 19c',10,'*'),            --  Introdu��o ORACLE 19c**********
    REPLACE('Introdu��o ORACLE 12c','12c','19c'),    --  Introdu��o ORACLE 19c
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
    > MOD: Retorna o resto da divis�o
*/
--  Fun��es tipo NUMBER
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
--  Fun��es tipo DATE - Trabalhando com Datas
     > O format default de exibi��o de datas � definido pelo DBA atrav�s do parametro NLS_DATE_FORMAT;
     > No Brasil normalmente o formato default de exibi��o de datas � definido para 'DD/MM/YY' ou 'DD/MM/RR'.
*/
SELECT sysdate
FROM dual;

DESC dual;
SELECT * FROM dual;

/*
    > Uma vez que o banco de dados armazena datas como n�meros, voc� pode executar 
    c�lculos utilizando os operadores aritm�ticos como a adi��o e subtra��o
    
     - data + n�mero       =   data            =>  Adiciona o n�mero de dias para uma data
     - data - n�mero       =   data            =>  Subtrai um n�mero de dias a partir de uma data
     - data - data         =   N�mero de dias  =>  Subtrai uma data a partir de outra
     - data + n�mero/24    =   data            =>  Adiciona o n�mero de horas para uma data
     
     - MONTHS_BETWEEN      =   N�mero de meses entre duas datas
     - ADD_MONTHS          =   Adiciona meses a uma data.
     - NEXT_DAY            =   Pr�ximo dia relativo a data especificada.
     - LAST_DAY            =   �ltimos dias do m�s.
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
-- C�lculos com Datas
SELECT SYSDATE, SYSDATE + 30, SYSDATE + 40, SYSDATE - 30
FROM dual;

SELECT last_name, ROUND((SYSDATE-hire_date)/7,2) "SEMANAS DE TRABALHO"
FROM employees;

-- Outras fun��es do tipo DATE
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE,hire_date),2)"MESES DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE,3), NEXT_DAY(SYSDATE,'SEXTA FEIRA'), LAST_DAY(SYSDATE)
FROM dual;

SELECT SYSDATE, ROUND(SYSDATE,'MONTH'), ROUND(SYSDATE,'YEAR'), TRUNC(SYSDATE,'MONTH'), TRUNC(SYSDATE,'YEAR')
FROM dual;

SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE),'DD/MM/YYYY HH24:MI:SS')
FROM dual;

SELECT last_name, TO_CHAR(hire_date,'DD, "de", Month, "de",YYYY') DT_ADMISS�O
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD "de", Month, "de" YYYY  ')DT_ADMISS�O
FROM employees;

-- Utilizando a fun��o TO_CHAR com N�meros
SELECT first_name, last_name, TO_CHAR(salary,'L99G999G999D99') SALARIO
FROM employees;

-- Utilizando a fun��o TO_NUMBER
SELECT TO_NUMBER('21000,50')
FROM dual;

 --Utilizando a fun��o TO_DATE
 SELECT TO_DATE('06/02/2020','DD/MM/YYYY')DATA
 FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

/*
--  Fun��es Gen�ricas
     > As fun��es a seguir trabalham com quaisquer tipo de dado:
     > NVL(expr1, expr2)
     > NVL2(expr1,expr2, expr3)
     > NULLIF(expr1, expr2,)
     > COALESCE(expr1, expr2, ..., exprn)
*/
--Utilizando fun��es aninhadas
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0)NUMERO_MESES
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Utilizando Fun��o NVL
SELECT last_name, salary, NVL(commission_pct,0), salary*12 SALARIO_ANUAL,
(salary*12) + (salary*12*NVL(commission_pct,0)) REMUNERA��O_ANUAL
FROM employees;