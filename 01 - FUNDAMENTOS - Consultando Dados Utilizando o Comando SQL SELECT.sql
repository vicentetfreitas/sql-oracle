/*
SEÇÃO 6 - AULA 1
Consultando dados utilizando o comando SQL SELECT

OBJETIVOS
    Conhecer o comando DESCRIBE;
    Entender as capacidades do comando SELECT;
    Executar um comando SELECT básico;
    Utilizar empressões aritméticas;
    Entender o valor NULL;
    Definir alias de coluna;
    Utilizar strings de caracteres;
    Utilizar operador de concatenação;
    Utilizar o Operador alternativo para áspas;
    Entender o uso do DISTINCT;

EXIBINDO A ESTRUTURA DA TABELA DESC[] tabela
    Utilize o comando DESCRIBE para exibir a estrutura da tabela

Utilizando o comando DESCRIBE

    DESCRIBE employees
    DESC departments
    DESC jobs

Comando SELECT básico

    SELECT * |{[DISTINCT] coluna|empressão [alias],...} FROM tabela;
    
        SELECT identifica as colunas ou empressões a serem exibidas;
        FROM identifica as tabelas que contém as colunas

Selecionando colunas específicas

    SELECT department_id, location_id
    FROM departments;
    
Escrevendo comandos SQL

    Comando SQL não são case sensitives;
    Comandos SQL podem se extender por uma ou mais linhas;
    Palavras chave(Keywords) não podem ser abreviadas ou divididas através das linhas;
    Clausulas são normalmente colocadas em linhas separadas;
    Indentações são utilizadas para facilitar o entendimento do comando;
    Comandos SQL são terminados por ponto e vírgula.
    
Alinhamento de Colunas em cabeçalhos

    Colunas Character e Date: alinhamento default do cabeçalho: Esquerda;
    Colunas Number Alinhamento default do cabeçalho: Direita;
    Exibição default do cabeçalho: Letas Maiúsculas;
    
Expressões Aritméticas

    Você pode criar expressões aritméticas com número e datas utilizando operadores aritméticos
    +, -, *, /
Utilizando operadores aritméticos
    SELECT first_name, last_name, salary, 
        salary * 1.15
    FROM employees;
    
Regra de Precedência de Operadores

    Mesma regra de precedência da matemática
        1. Identidade(Positivo ou Negativo);
        2. Multiplicação e Divisão(possuem a mesma precedênci, resolvendo da esquerda para direita).
        3. Soma e Subtração (possuem a mesma precedência, resolvendo da esquerda para a direita).
        
    SELECT first_name, last_name, salary,
        salary + 100 * 1.15
    FROM employees;
    
Entendo o valor nulo (NULL)

    NULL é ausência de valor;
    NULL não é zero;
    NULL não é espaços em branco;
    NULL não zeros binários.
    
    SELECT first_name, last_name, job_id,
    salary, commission_pct
    FROM employees;

Utilizando valores nulos em empressões aritméticas

    Qualquer expressão aritmética utilzando NULL retorna NULL
    
Alias de Coluna

    Renomeia o cabeçalho da coluna;
    
        Segue imediatamente o nome da coluna;
        Opcionalmente pode ser utilizada a palavra chave AS entre a coluna e o alias;
        Quando o alis contém espaços, caracteres especiais ou for case sensitive então deve ser colocado entre aspas duplas("").
    
Operador de concatenação

    Liga colunas ou strings de caracteres com outras colunas ou strings de caracteres
    É representado por duas barras verticais (||);
    Cria uma coluna resultante da ligação que é um string de caracteres
    
Utilizando Operador alternativo para aspas

    SELECT department_name ||q'[Department´s Manager Id:]'
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

--Selecionando colunas específicas
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
    
--Utilizando operadores aritméticos
    SELECT first_name, last_name, salary, 
        salary * 1.15
    FROM employees;

--Regra de Precedência dos Operadores
SELECT first_name, last_name, salary,
    salary + 100 * 1.15
FROM employees;

--Utilizando parentêses para alterar a precedência
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

--Utilizando valores nulos em expressões aritméticas
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
    salary salário
FROM employees;

SELECT
    first_name "Nome",
    last_name "Sobrenome",
    salary "Salário ($)",
    commission_pct "Percentual de Comissão"
FROM employees;

--Utilizando Operador de Concatenação
SELECT
    first_name || ' ' ||
    last_name  || ', data de admissão:  ' || 
    hire_date "Funcionários"
FROM employees;    

--Utilizando Operaro de Concatenação e Strings de Caracteres
SELECT 
    first_name || ' ' ||
    last_name || ' ' || ', data de admissão: ' ||
    hire_date "Funcionário"
FROM employees;

--Utilizando Operador alternativo para aspas

SELECT department_name ||q'[ Department´s Manager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;

--Linhas duplicadas

SELECT department_id
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;
    





















































