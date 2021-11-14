/*
Autor: Vicente T Freitas
Descri��o: Curso de Oracle SQL Especialista: do B�sico ao Avan�ado

-- SE��O 06 - Aula 01: Consultando dados utilizando o comando SQL SELECT

-- OBJETIVOS:
    Comando DESCRIBE;
    Comando SELECT;
    Express�es aritm�ticas;
    Valor NULL;
    Alias de coluna;
    Strings de caracteres;
    Operadores de concatena��o;
    Operador alternativo para �spas;
    Comando DISTINCT;
    
--  ANOTA��ES:
     *Proje��o: selecionar colunas
     *Sele��o: selecionar linhas

    Escrevendo comandos SQL:
     > Comando SQL n�o s�o case sensitives;
     > Comandos SQL podem se extender por uma ou mais linhas;
     > Palavras chave(Keywords) n�o podem ser abreviadas ou divididas atrav�s das linhas;
     > Clausulas s�o normalmente colocadas em linhas separadas;
     > Indenta��es s�o utilizadas para facilitar o entendimento do comando;
     > Comandos SQL s�o terminados por ponto e v�rgula(;). 
*/

--  Comando DESCRIBE ou DESC para exibir a estrutura de uma tabela
DESCRIBE employees
DESC employees
DESC departments
DESC Jobs
DESC locations

/*
    SELECT identifica as colunas ou empress�es a serem exibidas;
    FROM identifica as tabelas que cont�m as colunas;
*/
--  Comando SELECT b�sico
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

/*
    Alinhamento de Colunas em cabe�alhos:
     > Colunas Character e Date: alinhamento default do cabe�alho: Esquerda;
     > Colunas Number Alinhamento default do cabe�alho: Direita;
     > Exibi��o default do cabe�alho: Letras Mai�sculas;
*/
--  Selecionando colunas espec�ficas
SELECT  department_id, location_id
FROM departments;

SELECT  employee_id, first_name, last_name, salary
FROM employees;

/*
    Express�es Aritm�ticas:
     > Criar express�es aritm�ticas com n�meros e datas utilizando operadores aritm�ticos
     > +, -, *, /
*/

--  Operadores aritm�ticos
SELECT first_name, last_name, salary, 
       salary * 1.15
FROM employees;

/*
    Regra de Preced�ncia de Operadores:
        Mesma regra de preced�ncia da matem�tica.
        > 1.Identidade(Positivo ou Negativo);
        > 2.Multiplica��o e Divis�o(possuem a mesma preced�ncia, resolvendo da esquerda para direita;
        > 3.Soma e Subtra��o (possuem a mesma preced�ncia, resolvendo da esquerda para a direita).
*/
--  Preced�ncia dos Operadores
SELECT first_name, last_name, salary,
       salary + 100 * 1.15
FROM employees;

--  Parent�ses para alterar a preced�ncia
SELECT first_name, last_name, salary,
        (salary + 100) * 1.15
FROM employees;

/*
    Entendo o valor nulo (NULL):
        > NULL � aus�ncia de valor;
        > NULL n�o � zero;
        > NULL n�o � espa�os em branco;
        > NULL n�o � zeros bin�rios.
*/
--  Valor null
SELECT first_name, last_name, job_id, salary, commission_pct
FROM employees;

/*
    Utilizando valores nulos em empress�es aritm�ticas:
        > Qualquer express�o aritm�tica utilzando NULL retorna NULL
*/
--  Valores nulos em express�es aritm�ticas
SELECT first_name, last_name, job_id, commission_pct, 
    200000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

/*
    Alias de Coluna:
        > Renomeia o cabe�alho da coluna;
        > Segue imediatamente o nome da coluna;
        > Opcionalmente pode ser utilizada a palavra chave AS entre a coluna e o alias;
        > Quando o alis cont�m espa�os, caracteres especiais ou for case sensitive ent�o deve ser colocado entre aspas duplas("").
*/
--  Alias de coluna
SELECT first_name AS nome, -- AS(opcional)
       last_name sobrenome, salary sal�rio
FROM employees;

SELECT
    first_name "Nome",
    last_name "Sobrenome",
    salary "Sal�rio ($)",
    commission_pct "Percentual de Comiss�o"
FROM employees;

/*
    Operador de concatena��o:
        > Liga colunas ou strings de caracteres com outras colunas ou strings de caracteres
        > � representado por duas barras verticais (||);
        > Cria uma coluna resultante da liga��o que � um string de caracteres
*/
--  Utilizando Operador de Concatena��o
SELECT first_name || ' ' || last_name  || ', data de admiss�o:  ' || hire_date "Funcion�rio"
FROM employees;

/*
    Strings de caracteres:
        > Um literal � um caracter, um n�mero, ou uma que � inclu�da em um comando SELECT
        > Literais de Datas e caracteres devem ser definidos entre aspas simples (').
        > Cada literal ou string de caracteres ser� exibido uma vez para cada linha retornada.
*/
--  Utilizando Operador de Concatena��o e Strings de Caracteres
SELECT first_name || ' ' || last_name || ', sal�rio: ' || salary "Funcion�rio"
FROM employees;

/*
    Utilizando Operador alternativo para aspas
        > Especificar o pr�prio operador alternativo para aspas do desenvolvedro
        > Escolher qualquer delimitador
        > Facilita a legibilidade e usabilidade
*/
--  Operador alternativo para aspas
SELECT department_name || q'[ Department�s Manager Id: ]' || manager_id "Departamento e Gerente"
FROM departments;

/*
    Linhas duplicdas
        > Por default as consultas exibem todas as linhas retornadas, incluindo as linhas duplicadas
*/
-- Linhas duplicadas
SELECT department_id
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;