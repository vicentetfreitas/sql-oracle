/*
 SEÇÃO 9 - AULA 1
12. Utilizando Funções de Conversão e Expressões Condicionais

-- OBJETIVOS

    Descrever os vários tipos de funções de conversão disponíveis no SQL
    Utilizar as funções de convesão TO_CHAR, TO_NUMBER e TO_DATE
    Utilizar expressões condicionais em um comando SELECT

-- Tipos de Conversão

    Data type conversion: Implicit data type conversion; Explicit data type conversion.

-- Conversão Implícita de Tipo de Dados

    O Oracle pode realizar conversões
    automaticamente em expressões:
    
    De                  Para
    VARCHAR2 OU CHAR    NUMBER
    VARCHAR2 OU CHAR    DATE
    NUMBER              VARCHAR2 or CHAR
    DATE                VARCHAR2 or CHAR
    
-- Utilizando a Função TO_CHAR com Datas

    TO_CHAR(date,'formato')
    O formato:
        Deve ser definido entre aspas simples.
        É case-sensitive.
        Pode incluir quaisquer formatos de datas.
        O formato fm é utilizado para remover espaços em branco desnecessários ou suprimir zeros a esquerda.
        Deve ser separado do valor da data por vírgula.
    
    SELECT last_name, TO_CHAR(hire_date,'DD/MM/YYYY HH24:MI:SS') DT_ADMISSÃO
    FROM employees;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:24:MI:SS') DATA
    FROM dual;
    
--  Utilizando a função TO_CHAR com Números

FORMATO             RESULTADOR
    9           Números com supressão de zeros a esquerda
    0           Números incluindo zeros a partir a esquerda a partir da posição onde foi colocado o elemento de formato (0)
    $           Simbolo de moeda($)
    L           Símbolo de moeda definido pelo parâmetro NLS_CURRENCY()
    .           Decima(.)
    ,           (Milhar)
    D           Símbolo de decimal definido de acordo com o parâmetro do banco de dados
    G           Símbolo de milhar definido de acordo com o parâmetro do banco de dados
    
    Utilize a função de conversão TO_NUMBER para converter um string de caracteres para um número
    TO_NUMBER(char[,'formato'])
    
--  Utilizando a função TO_DATE

    Utilize a função de Conversão TO_DATE para converter um string de caracters para data:
    TO_DATE(char[,'formato'])

-- Funções Aninhadas

    Funções Single-row functions podem ser aninhadas em vários níveis
    Funções aninhadas são resolvidas nível mais profundo (interno) para o nível externo.
    
    F3(F2(F1(col,arg1),arg2),arg3)
    
--  Funções Genéricas

    As funções a seguir trabalham com quaisquer tipo de dado:
        NVL(expr1, expr2)
        NLV2(expr1,expr2,expr3)
        NULLIF(expr1, expr2)
        COALESCE(expr1, expr2, ..., expr)
-- Utilizando a Função COALESCE
    
    A funação COALESCE pode receber multiplos argumentos
    Se a primeira expressão retorna NULL a função COALESCE retorna esta expressão;
    se não, a função COALESCE seguirá avaliando as expressões seguintes.
    
-- Expressões Condicionais

    Proporciona o uso da lógica IF-THEN-ELSE dentro do SQL
    Existem 2 métodos:
        _expressão CASE
        _expressão DECODE
        
    Expressão CASE
        CASE expr WHEN expr1 THEN
         return_expr1
         [WHEN expr2 THEN
         return_expr2
         WHEN exprn THEN
         return_exprn
         ELSE
         else_expr]
        END alias;

--  Função DECODE
DECODE(col|expressão, arg1, resulta1 [, arg2, result2, ...,]
    [, default]
    
    */
    
    -- Utilizando a Função TO_CHAR com Datas
    SELECT last_name, TO_CHAR(hire_date,'DD/MM/YYYY HH24:MI:SS') DT_ADMISSÃO
    FROM employees;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') DATA
    FROM dual;
    
    SELECT last_name, TO_CHAR(hire_date,'DD,"de" Month ,"de" YYYY') DT_ADMISSÃO
    FROM employees;
    
    SELECT last_name, TO_CHAR(hire_date,'FMDD,"de",Month,"de", YYYY') DT_ADMISSÃO
    FROM employees;
    
    SELECT SYSDATE,TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MM:SS')DATA
    FROM dual;

--  Utilizando a função TO_CHAR com Números
SELECT first_name, last_name, TO_CHAR(salary,'L99G999G999D99') SALARIO
FROM employees;
    
-- Utilizando a função TO_NUMBER
SELECT TO_NUMBER('12000,50')
FROM dual;
    
-- Utilizando a função TO_DATE
SELECT TO_DATE('06/02/2020','DD/MM/YYYY')DATA 
FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

--  Utilizando funções ainhadas
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0) NUMERO_MESES
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Utilizando a função NVL
SELECT last_name, salary, NVL(commission_pct,0), salary*12 SALARIO_ANUAL,
(salary*12) + (salary*12*NVL(commission_pct,0)) REMUNERACAO_ANUAL
FROM employees;

-- Utilizando a Função COALESCE
SELECT 
    COALESCE(NULL, NULL, 'Expressão 3'), COALESCE(NULL, 'Expressão 2','Expressão 3'),
    COALESCE('Expressão 1','Expressão 2','Expressão3')
FROM dual;

SELECT last_name, employee_id, commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'Sem percentual de comissão e sem gerente')
FROM employees;

--  Utilizando a Função NVL2
SELECT last_name, salary, commission_pct,
NVL2(commission_pct, 10, 0) PERCENTUAL_ALTERADO
FROM employees;
    
-- Utilizando a função NULLIF
SELECT NULLIF(1000,1000), NULLIF(1000,2000)
FROM dual;

-- Expressão CASE
SELECT first_name, job_id, salary,
    CASE job_id
        WHEN 'IT_PROG'
            THEN 1.10 * salary
        WHEN 'ST_CLERK'
            THEN 1.15 * salary
        WHEN 'SA_REP'
            THEN 1.20 * salary
        ELSE salary
    END"NOVO SALÁRIO"
FROM employees;

-- Expressão DECODE
SELECT last_name, job_id, salary,
    DECODE(job_id, 'IT_PROG',   1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP',   1.20 * salary,
                    salary) "NOVO SALÁRIO"
FROM employees;


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    