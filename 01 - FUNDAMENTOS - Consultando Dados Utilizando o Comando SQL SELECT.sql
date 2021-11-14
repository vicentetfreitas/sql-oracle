/*
Autor: Vicente T Freitas
Descrição: Curso de Oracle SQL Especialista: do Básico ao Avançado

-- SEÇÃO 06 - Aula 01: Consultando dados utilizando o comando SQL SELECT

-- OBJETIVOS:
    Comando DESCRIBE;
    Comando SELECT;
    Expressões aritméticas;
    Valor NULL;
    Alias de coluna;
    Strings de caracteres;
    Operadores de concatenação;
    Operador alternativo para áspas;
    Comando DISTINCT;
    
--  ANOTAÇÕES:
     *Projeção: selecionar colunas
     *Seleção: selecionar linhas

    Escrevendo comandos SQL:
     > Comando SQL não são case sensitives;
     > Comandos SQL podem se extender por uma ou mais linhas;
     > Palavras chave(Keywords) não podem ser abreviadas ou divididas através das linhas;
     > Clausulas são normalmente colocadas em linhas separadas;
     > Indentações são utilizadas para facilitar o entendimento do comando;
     > Comandos SQL são terminados por ponto e vírgula(;). 
*/

--  Comando DESCRIBE ou DESC para exibir a estrutura de uma tabela
DESCRIBE employees
DESC employees
DESC departments
DESC Jobs
DESC locations

/*
    SELECT identifica as colunas ou empressões a serem exibidas;
    FROM identifica as tabelas que contém as colunas;
*/
--  Comando SELECT básico
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

/*
    Alinhamento de Colunas em cabeçalhos:
     > Colunas Character e Date: alinhamento default do cabeçalho: Esquerda;
     > Colunas Number Alinhamento default do cabeçalho: Direita;
     > Exibição default do cabeçalho: Letras Maiúsculas;
*/
--  Selecionando colunas específicas
SELECT  department_id, location_id
FROM departments;

SELECT  employee_id, first_name, last_name, salary
FROM employees;

/*
    Expressões Aritméticas:
     > Criar expressões aritméticas com números e datas utilizando operadores aritméticos
     > +, -, *, /
*/

--  Operadores aritméticos
SELECT first_name, last_name, salary, 
       salary * 1.15
FROM employees;

/*
    Regra de Precedência de Operadores:
        Mesma regra de precedência da matemática.
        > 1.Identidade(Positivo ou Negativo);
        > 2.Multiplicação e Divisão(possuem a mesma precedência, resolvendo da esquerda para direita;
        > 3.Soma e Subtração (possuem a mesma precedência, resolvendo da esquerda para a direita).
*/
--  Precedência dos Operadores
SELECT first_name, last_name, salary,
       salary + 100 * 1.15
FROM employees;

--  Parentêses para alterar a precedência
SELECT first_name, last_name, salary,
        (salary + 100) * 1.15
FROM employees;

/*
    Entendo o valor nulo (NULL):
        > NULL é ausência de valor;
        > NULL não é zero;
        > NULL não é espaços em branco;
        > NULL não é zeros binários.
*/
--  Valor null
SELECT first_name, last_name, job_id, salary, commission_pct
FROM employees;

/*
    Utilizando valores nulos em empressões aritméticas:
        > Qualquer expressão aritmética utilzando NULL retorna NULL
*/
--  Valores nulos em expressões aritméticas
SELECT first_name, last_name, job_id, commission_pct, 
    200000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

/*
    Alias de Coluna:
        > Renomeia o cabeçalho da coluna;
        > Segue imediatamente o nome da coluna;
        > Opcionalmente pode ser utilizada a palavra chave AS entre a coluna e o alias;
        > Quando o alis contém espaços, caracteres especiais ou for case sensitive então deve ser colocado entre aspas duplas("").
*/
--  Alias de coluna
SELECT first_name AS nome, -- AS(opcional)
       last_name sobrenome, salary salário
FROM employees;

SELECT
    first_name "Nome",
    last_name "Sobrenome",
    salary "Salário ($)",
    commission_pct "Percentual de Comissão"
FROM employees;

/*
    Operador de concatenação:
        > Liga colunas ou strings de caracteres com outras colunas ou strings de caracteres
        > É representado por duas barras verticais (||);
        > Cria uma coluna resultante da ligação que é um string de caracteres
*/
--  Utilizando Operador de Concatenação
SELECT first_name || ' ' || last_name  || ', data de admissão:  ' || hire_date "Funcionário"
FROM employees;

/*
    Strings de caracteres:
        > Um literal é um caracter, um número, ou uma que é incluída em um comando SELECT
        > Literais de Datas e caracteres devem ser definidos entre aspas simples (').
        > Cada literal ou string de caracteres será exibido uma vez para cada linha retornada.
*/
--  Utilizando Operador de Concatenação e Strings de Caracteres
SELECT first_name || ' ' || last_name || ', salário: ' || salary "Funcionário"
FROM employees;

/*
    Utilizando Operador alternativo para aspas
        > Especificar o próprio operador alternativo para aspas do desenvolvedro
        > Escolher qualquer delimitador
        > Facilita a legibilidade e usabilidade
*/
--  Operador alternativo para aspas
SELECT department_name || q'[ Department´s Manager Id: ]' || manager_id "Departamento e Gerente"
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