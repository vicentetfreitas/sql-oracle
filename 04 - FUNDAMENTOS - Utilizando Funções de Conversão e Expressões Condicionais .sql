/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

-- SE��O 09 - Aula 01: Utilizando fun��es de Conves�o e Express�es Condicionais

-- OBJETIVOS
    > Descrever os v�rios tipos de fun��es de convers�o dispon�veis no SQL
    > Utilizar as fun��es de conves�o TO_CHAR, TO_NUMBER e TO_DATE
    > Utilizar express�es condicionais em um comando SELECT
    
-- Tipos de Convers�o
    > Data type conversion: Implicit data type conversion; Explicit data type conversion.

-- Convers�o Impl�cita de Tipo de Dados
    > O Oracle pode realizar convers�es automaticamente em express�es:
    
    De                  Para
    VARCHAR2 OU CHAR    NUMBER
    VARCHAR2 OU CHAR    DATE
    NUMBER              VARCHAR2 or CHAR
    DATE                VARCHAR2 or CHAR
    
--  Utilizando a Fun��o TO_CHAR com Datas
    
    TO_CHAR(date,'formato')
    
    O formato:
    > Deve ser definido entre aspas simples.
    > � case-sensitive.
    > Pode incluir quaisquer formatos de datas.
    > O formato fm � utilizado para remover espa�os em branco desnecess�rios ou suprimir zeros a esquerda.
    > Deve ser separado do valor da data por v�rgula.
*/
-- Utilizando a Fun��o TO_CHAR com Datas

SELECT last_name, TO_CHAR(hire_date,'DD/MM/YYYY HH24:MI:SS') DT_ADMISS�O
FROM employees;
    
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM dual;

SELECT last_name, TO_CHAR(hire_date,'DD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;
    
SELECT last_name, TO_CHAR(hire_date,'FMDD, "de" Month "de"  YYYY') DT_ADMISS�O
FROM employees;

/*    
FORMATO             RESULTADOR
    9           N�meros com supress�o de zeros a esquerda
    0           N�meros incluindo zeros a partir a esquerda a partir da posi��o onde foi colocado o elemento de formato (0)
    $           Simbolo de moeda($)
    L           S�mbolo de moeda definido pelo par�metro NLS_CURRENCY()
    .           Decima(.)
    ,           (Milhar)
    D           S�mbolo de decimal definido de acordo com o par�metro do banco de dados
    G           S�mbolo de milhar definido de acordo com o par�metro do banco de dados
    
    > Utilize a fun��o de convers�o TO_NUMBER para converter um string de caracteres para um n�mero
      TO_NUMBER(char[,'formato'])
*/

--  Utilizando a fun��o TO_CHAR com N�meros
SELECT first_name, last_name, TO_CHAR(salary,'L99G999G999D99') SALARIO
FROM employees;
    
-- Utilizando a fun��o TO_NUMBER
SELECT TO_NUMBER('12000,50')
FROM dual;

/*    
--  Fun��o TO_DATE
    > Utilize a fun��o de Convers�o TO_DATE para converter um string de caracters para data:
    TO_DATE(char[,'formato'])
*/

-- Utilizando a fun��o TO_DATE
SELECT TO_DATE('06/02/2020','DD/MM/YYYY')DATA 
FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

/*
-- Fun��es Aninhadas
    > Fun��es Single-row functions podem ser aninhadas em v�rios n�veis
    > Fun��es aninhadas s�o resolvidas n�vel mais profundo (interno) para o n�vel externo.
    F3(F2(F1(col,arg1),arg2),arg3)
*/

--  Utilizando fun��es aninhadas
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0) NUMERO_MESES
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

/*
--  Fun��es Gen�ricas
    > As fun��es a seguir trabalham com quaisquer tipo de dado:
    > NVL(expr1, expr2)
    > NLV2(expr1,expr2,expr3)
    > NULLIF(expr1, expr2)
    > COALESCE(expr1, expr2, ..., expr)
*/
-- Utilizando a fun��o NVL
SELECT last_name, salary, NVL(commission_pct,0), salary*12 SALARIO_ANUAL,
(salary*12) + (salary*12*NVL(commission_pct,0)) REMUNERACAO_ANUAL
FROM employees;

/*
-- Fun��o COALESCE
    > A funa��o COALESCE pode receber multiplos argumentos
    > Se a primeira express�o retorna NULL a fun��o COALESCE retorna esta express�o;
    > se n�o, a fun��o COALESCE seguir� avaliando as express�es seguintes.
*/
-- Utilizando a Fun��o COALESCE
SELECT 
    COALESCE(NULL, NULL, 'Express�o 3'), COALESCE(NULL, 'Express�o 2','Express�o 3'),
    COALESCE('Express�o 1','Express�o 2','Express�o3')
FROM dual;

SELECT last_name, employee_id, commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'Sem percentual de comiss�o e sem gerente')
FROM employees;

/* 
-- Express�es Condicionais
    Proporciona o uso da l�gica IF-THEN-ELSE dentro do SQL
    Existem 2 m�todos:
        _express�o CASE
        _express�o DECODE

    Express�o CASE
        CASE expr WHEN expr1 THEN
         return_expr1
         [WHEN expr2 THEN
         return_expr2
         WHEN exprn THEN
         return_exprn
         ELSE
         else_expr]
        END alias;

--  Fun��o DECODE
    DECODE(col|express�o, arg1, resulta1 [, arg2, result2, ...,]
    [, default]
*/

--  Utilizando a Fun��o NVL2
SELECT last_name, salary, commission_pct,
NVL2(commission_pct, 10, 0) PERCENTUAL_ALTERADO
FROM employees;
    
-- Utilizando a fun��o NULLIF
SELECT NULLIF(1000,1000), NULLIF(1000,2000)
FROM dual;

-- Express�o CASE
SELECT first_name, job_id, salary,
    CASE job_id
        WHEN 'IT_PROG'
            THEN 1.10 * salary
        WHEN 'ST_CLERK'
            THEN 1.15 * salary
        WHEN 'SA_REP'
            THEN 1.20 * salary
        ELSE salary
    END"NOVO SAL�RIO"
FROM employees;

-- Express�o DECODE
SELECT last_name, job_id, salary,
    DECODE(job_id, 'IT_PROG',   1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP',   1.20 * salary,
                    salary) "NOVO SAL�RIO"
FROM employees;