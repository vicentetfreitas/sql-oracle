/*
SE��O 6 - AULA 1
Consultando dados utilizando o comando SQL SELECT

OBJETIVOS
    Conhecer o comando DESCRIBE;
    Entender as capacidades do comando SELECT;
    Executar um comando SELECT b�sico;
    Utilizar empress�es aritm�ticas;
    Entender o valor NULL;
    Definir alias de coluna;
    Utilizar strings de caracteres;
    Utilizar operador de concatena��o;
    Utilizar o Operador alternativo para �spas;
    Entender o uso do DISTINCT;

EXIBINDO A ESTRUTURA DA TABELA DESC[] tabela
    Utilize o comando DESCRIBE para exibir a estrutura da tabela

Utilizando o comando DESCRIBE

    DESCRIBE employees
    DESC departments
    DESC jobs

Comando SELECT b�sico

    SELECT * |{[DISTINCT] coluna|empress�o [alias],...} FROM tabela;
    
        SELECT identifica as colunas ou empress�es a serem exibidas;
        FROM identifica as tabelas que cont�m as colunas

Selecionando colunas espec�ficas

    SELECT department_id, location_id
    FROM departments;
    
Escrevendo comandos SQL

    Comando SQL n�o s�o case sensitives;
    Comandos SQL podem se extender por uma ou mais linhas;
    Palavras chave(Keywords) n�o podem ser abreviadas ou divididas atrav�s das linhas;
    Clausulas s�o normalmente colocadas em linhas separadas;
    Indenta��es s�o utilizadas para facilitar o entendimento do comando;
    Comandos SQL s�o terminados por ponto e v�rgula.
    
Alinhamento de Colunas em cabe�alhos

    Colunas Character e Date: alinhamento default do cabe�alho: Esquerda;
    Colunas Number Alinhamento default do cabe�alho: Direita;
    Exibi��o default do cabe�alho: Letas Mai�sculas;
    
Express�es Aritm�ticas

    Voc� pode criar express�es aritm�ticas com n�mero e datas utilizando operadores aritm�ticos
    +, -, *, /
Utilizando operadores aritm�ticos
    SELECT first_name, last_name, salary, 
        salary * 1.15
    FROM employees;
    
Regra de Preced�ncia de Operadores

    Mesma regra de preced�ncia da matem�tica
        1. Identidade(Positivo ou Negativo);
        2. Multiplica��o e Divis�o(possuem a mesma preced�nci, resolvendo da esquerda para direita).
        3. Soma e Subtra��o (possuem a mesma preced�ncia, resolvendo da esquerda para a direita).
        
    SELECT first_name, last_name, salary,
        salary + 100 * 1.15
    FROM employees;
    
Entendo o valor nulo (NULL)

    NULL � aus�ncia de valor;
    NULL n�o � zero;
    NULL n�o � espa�os em branco;
    NULL n�o zeros bin�rios.
    
    SELECT first_name, last_name, job_id,
    salary, commission_pct
    FROM employees;

Utilizando valores nulos em empress�es aritm�ticas

    Qualquer express�o aritm�tica utilzando NULL retorna NULL
    
Alias de Coluna

    Renomeia o cabe�alho da coluna;
    
        Segue imediatamente o nome da coluna;
        Opcionalmente pode ser utilizada a palavra chave AS entre a coluna e o alias;
        Quando o alis cont�m espa�os, caracteres especiais ou for case sensitive ent�o deve ser colocado entre aspas duplas("").
    
Operador de concatena��o

    Liga colunas ou strings de caracteres com outras colunas ou strings de caracteres
    � representado por duas barras verticais (||);
    Cria uma coluna resultante da liga��o que � um string de caracteres
    
Utilizando Operador alternativo para aspas

    SELECT department_name ||q'[Department�s Manager Id:]'
    || manager_id "Departamento e Gerente"
    FROM departments;

Linhas duplicadas

    Por default as consutas exibem todas as linhas retornadas, incluindo as linhas duplicadas
    SELECT department_id
    FROM employees;
    
    
    
        */

--Utilizando o comando DESCRIBE
DESCRIBE employees
DESC employees
DESC departments
DESC Jobs
DESC locations

--Utilizando o comando DESCRIBE
SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM jobs;

--Selecionando colunas espec�ficas
SELECT 
    department_id, 
    location_id
FROM departments;

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees;

SELECT
    department_id,
    department_name,
    manager_id
FROM departments;

SELECT
    job_id,
    job_title
FROM jobs;
    
--Utilizando operadores aritm�ticos
    SELECT first_name, last_name, salary, 
        salary * 1.15
    FROM employees;

--Regra de Preced�ncia dos Operadores
SELECT first_name, last_name, salary,
    salary + 100 * 1.15
FROM employees;

--Utilizando parent�ses para alterar a preced�ncia
SELECT first_name, last_name, salary,
        (salary + 100) * 1.15
    FROM employees;

--Etendendo o valor null
SELECT 
    first_name, 
    last_name, 
    job_id,
    salary, 
    commission_pct
FROM employees;

--Utilizando valores nulos em express�es aritm�ticas
SELECT 
    first_name, 
    last_name, 
    job_id, 
    commission_pct, 
    200000* commission_pct
FROM employees
WHERE commission_pct IS NULL;


--Utilizando alias de coluna
SELECT 
    first_name nome,
    last_name sobrenome,
    salary sal�rio
FROM employees;

SELECT
    first_name "Nome",
    last_name "Sobrenome",
    salary "Sal�rio ($)",
    commission_pct "Percentual de Comiss�o"
FROM employees;

--Utilizando Operador de Concatena��o
SELECT
    first_name || ' ' ||
    last_name  || ', data de admiss�o:  ' || 
    hire_date "Funcion�rios"
FROM employees;    

--Utilizando Operaro de Concatena��o e Strings de Caracteres
SELECT 
    first_name || ' ' ||
    last_name || ' ' || ', data de admiss�o: ' ||
    hire_date "Funcion�rio"
FROM employees;

--Utilizando Operador alternativo para aspas

SELECT department_name ||q'[ Department�s Manager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;

--Linhas duplicadas

SELECT department_id
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;
    





















































