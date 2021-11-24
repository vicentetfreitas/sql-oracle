/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

-- SE��O 07 - Aula 01: Restringindo e Ordenando Dados

-- OBJETIVOS
    Restringir as linhas recuperadas por uma consulta
    Classificar as linhas recuperadas por uma consulta
    Utilizar Vari�veis de Substitui��o
*/

-- Utilizando a cl�usula WHERE
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 60;

/*
--  String de caratere e datas
     > Strings de caracteres e dastas s�o delimitados por aspas simples(');
     > Valores de strings de caracteres s�o case sensitives;
     > Valores de strings de data s�o sensitivos ao formato definitivo para o banco de dados ou para sess�o;
     > O format default para exibi��o de datas mais utilizado no Brasil � 'DD/MM/YYYY' ou 'DD/MM/RR'.
*/
-- Utilizando Strings de caractere na cl�usula WHERE
SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

/*
--  Operadores de compara��o
        =           Equal to
        >           Greater than
        >=          Greater than or equal to
        <           Lesss than
        <=          Less than or equal to
        <>          Not equal to
        BETWEEN     Beteween two values (inclusive) INTERVALOS
        ...AND...
        IN(set)     Match any of a list of values   LISTA DE VALORES
        LIKE        Match a character pattern
        IS NULL     'Is a null value
*/
--  Utilizando operadores de compara��o na cl�usula WHERE
SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

--  Selecione faixa de valores utilizando o operador BETWEEN
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;-- >= ou <=

--  Selecionando valores dentro de uma lista utilizando o operador IN
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG','FI_ACCOUNT', 'SA_REP');

/*
--  Selecionando valores por coincid�ncia com padr�es utilizando o operador LIKE
     > Use o operador LIKE para executar pesquisas de valores que coincidem com padr�es utlzando
     > caracteres curingas (wildcards)
     > As condi��es de pesquisa podem conter carcteres ou n�meros:
        % Combina com zero ou mais caracteres
        _ Combina com um e somente um caracter
*/
-- Utilizando o operador LIKE
SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de v�rios caracteres curinga
SELECT  first_name, last_name
FROM employees
WHERE last_name LIKE'%a'; -- O segundo nome de empregados segunda letra a minusculo seguido de qualquer coisa

/*  
--  Compara��es com valor nulo (NULL)
     > Qualquer compra��o com valor NULL retorna o booleano NULLL
     > Para podermos verificar se um valor � NULL deve ser utilizado a express�o IS NULL
*/
--Compara��o com valo NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL;

-- Utilizando a express�o de compra��o IS NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

/* 
--  Definindo condi��es utilizando Operadores L�gicos
     > AND - Retorna TRUE  se ambas as condi��es s�o verdadeiras;
     > OR - Retorna TRUE se pelo menos uma das condi��es for verdadeira;
     > NOT - Retorna a nega��o da condi��o:
        Retorna TRUE se a condi��o � falsa;
        Retorna FALSE se a condi��o for verdadeira
        Retorna null se a condi��o for NULL
*/
--  Utilizando o operador AND
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE 
    salary >= 5000
    AND job_id = 'IT_PROG';

--  Utilizando o operador OR
SELECT employee_id,  last_name, job_id, salary
FROM employees
WHERE 
    salary >= 5000 OR 
    job_id = 'IT_PROG';
    
-- Utilizando o operador NOT
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE 
    job_id NOT IN('IT_PROG', 'FI_ACCOUNT','SA_REP');
    
/*
--  Regras de Preced�ncia
     1.Operadoers aritm�ticos
     2.Operador de concatena��o
     3.Condi��es de compara��o
     4.IS[NOT] NULL, LIKE, [NOT] IN
     5.[NOT] BEYWEEN
     6.NOT EQUAL TO
     7.NOT condi��o l�gica
     8.AND condi��o l�gica
     9.OR condi��o l�gica
*/
-- Regras de preced�ncia
SELECT last_name, job_id, salary
FROM employees
WHERE 
    job_id = 'SA_REP' OR 
    job_id = 'IT_PROG' AND
    salary > 10000;

--  Utilizando par�nteses para sobrepor as regras de Preced�ncia
    SELECT last_name, job_id, salary
    FROM employees
    WHERE (job_id = 'SA_REP' OR job_id = 'IT_PROG')
    AND salary > 10000;   
/*
-- Utilizando a cl�usula ORDER BY
    > Ordene as linhas recuperadas utilizando a cl�usula ORDER BY:
        - ASC: Ordem ascente, default;
        - DESC: Ordem descendente.
    > A cl�usula ORDER BY � a �ltima no comando SELECT
*/
-- Utilizando a cl�usula ORDER BY - ORDEM ascendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- Utilizando a cl�usula ORDER BY � Referenciando ALIAS
SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cl�usula ORDER BY � Referenciando a Posi��o
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Utilizando a cl�usula ORDER BY � M�ltiplas colunas ou express�es
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- Utilizando Vari�veis de Substitui��o - &
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

-- Utilizando Vari�veis de Substitui��o - &&
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

-- Vari�veis de substitui��o com valores tipo Character e Date
SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id' ;

-- Utilizando o comando DEFINE
DEFINE employee_id = 101

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id ;

DEFINE employee_id

UNDEFINE employee_id

-- 290 linhas