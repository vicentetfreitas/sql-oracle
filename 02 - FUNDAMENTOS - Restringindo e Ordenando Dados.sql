/*
 SEÇÃO 7 - AULA 1
Restringindo e Ordenando Dados

OBJETIVOS
    Restringir as linhas recuperadas por uma consulta
    Classificar as linhas recuperadas por uma consulta
    Utilizar Variáveis de Substituição

Restringindo as linhas que serão retornadas
    Selecione as linhas que serão retornadas utilizando a cláusula WHERE
    
Cláusula WHERE
    SELECT * |{[DISTINCT] coluna|empressão
    [alias],...}
    FROM tabela
    [WHERE condição(s)];
    
Utilizando a cláusula WHERE
    SELECT 
        employee_id, 
        last_name, 
        job_id,
        department_id
    FROM employees
    WHERE department_id=60;

String de caratere e datas

    Strings de caracteres e dastas são delimitados por aspas simples(');
    Vlaores de strings de caracteres são case sensitives;
    Valores de strings de data são sensitivos ao formato definitivo para o banco de dados ou para sessão;
    O format default para exibição de datas mais utilizado no Brasil é 'DD/MM/YYYY' ou 'DD/MM/RR'.
    
Operadores de comparação
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

Utilizando operadores de comparação na cláusula WHERE

    SELECT last_name, salary
    FROM employees
    WHERE salary >= 10000;

Selecione faixa de valores utilizando o operador BETWEEN

    SELECT last_name, salary
    FROM employees
    WHERE salary BETWEEN 10000 AND 15000;

Selecionando valores dentro de uma lista utilizando o operador IN

    SELECT employee_id, last_name, salary, manager_id, job_id
    FROM employees
    WHERE job_id IN ('IT_PROG','FI_ACCOUNT', 'SA_REP');
Selecionando valores por coincidência com padrões utilizando o operador LIKE

    Use o operador LIKE para executar pesquisas de valores que coincidem com padrões utlzando
    caracteres curingas (wildcards)
    As condições de pesquisa podem conter carcteres ou números:
        % Combina com zero ou mais caracteres
        _ Combina com um e somente um caracter
        
Comparações com valor nulo (NULL)
    Qualquer compração com valor NULL retorna o booleano NULLL
    Para podermos verificar se um valor é NULL deve ser utilizado a expressão IS NULL

Comparação com valo NULL

    SELECT last_name, manager_id
    FROM employees
    WHERE manager_id = null;
    
-- Definindo condições utilizando Operadores Lógicos

    AND - Retorna TRUE  se ambas as condições são verdadeiras;
    OR - Retorna TRUE se pelo menos uma das condições for verdadeira;
    NOT - Retorna a negação da condição:
        Retorna TRUE se a condição é falsa;
        Retorna FALSE se a condição for verdadeira
        Retorna null se a condição for NULL

-- Utilizando o operador AND

    SELECT employee_id,  last_name, job_id, salary
    FROM employees
    WHERE salary >= 5000
    AND job_id = 'IT_PROG';

-- Utilizando o operador OR

    SELECT employee_id,  last_name, job_id, salary
    FROM employees
    WHERE salary >= 5000
    OR job_id = 'IT_PROG';
    
-- Utilizando o operador not
    
    SELECT employee_id, last_name, salary, manager_id, job_id
    FROM employees
    WHERE job_id NOT IN('IT_PROG', 'FI_ACCOUNT','SA_REP');    
    
-- Regras de Precedência

    1.Operadoers aritméticos
    2.Operador de concatenação
    3.Condições de comparação
    4.IS[NOT] NULL, LIKE, [NOT] IN
    5.[NOT] BEYWEEN
    6.NOT EQUAL TO
    7.NOT condição lógica
    8.AND condição lógica
    9.OR condição lógica
    
-- Regras de precedência
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'IT_PROG' AND salary > 10000;
    
-- Sobrepondo as regras de Precedência

    Você pode utilzar parênteses para sobrepor as retgras de precedência
    
-- Utilizando parênteses para sobrepor as regras de Precedência
    SELECT last_name, job_id, salary
    FROM employees
    WHERE (job_id = 'SA_REP' OR job_id = 'IT_PROG')
    AND salary > 10000;
    
-- Utilizando a cláusula ORDER BY

    Ordene as linhas recuperadas utilizando a cláusula ORDER BY:
        -ASC: Ordem ascente, default;
        -DESC: Ordem descendente
    A cláusula ORDER BY é a última no comando SELECT.
    
-- Utilizando a cláusula ORDER BY - ORDEM ascendente

    SELECT last_name, job_id, department_id, hire_date
    FROM employes
    ORDER BY hire_date ASC;
    
    SELECT last_name, job_id, department_id, hire_date
    FROM employees
    ORDER BY hire_date;

    
    */

-- Utilizando a cláusula WHERE
SELECT 
    employee_id, 
    last_name, 
    job_id,
    department_id
FROM employees
WHERE department_id=60;

-- Utilizando Strings de caractere na cláusula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

--Utilizando operadores de comparação na cláusula WHERE
SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

--Selecione faixa de valores utilizando o operador BETWEEN
--Selecione o sobrenome e o salário de empregados onde o salário é maior ou igual 
--a 10000 e menor ou igual a 15000
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

--Selecionando valores dentro de uma lista utilizando o operador IN
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG','FI_ACCOUNT', 'SA_REP');

-- Utilizando o operador LIKE

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de vários caracteres curinga
SELECT  first_name, last_name
FROM employees
WHERE last_name LIKE'_%'; -- O segundo nome de empregados segunda letra a minusculo seguido de qualquer coisa

--Comparação com valo NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL;

-- Utilizando a expressão de compração IS NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- Utilizando o operador AND
SELECT employee_id,  last_name, job_id, salary
FROM employees
WHERE salary >= 5000
AND job_id = 'IT_PROG';

-- Utilizando o operador OR
    SELECT employee_id,  last_name, job_id, salary
    FROM employees
    WHERE salary >= 5000
    OR job_id = 'IT_PROG';
    
-- Utilizando o operador not
    SELECT employee_id, last_name, salary, manager_id, job_id
    FROM employees
    WHERE job_id NOT IN('IT_PROG', 'FI_ACCOUNT','SA_REP');  
    
-- Regras de precedência
    SELECT last_name, job_id, salary
    FROM employees
    WHERE job_id = 'SA_REP' OR job_id = 'IT_PROG' AND salary > 10000;

-- Utilizando parênteses para sobrepor as regras de Precedência
    SELECT last_name, job_id, salary
    FROM employees
    WHERE (job_id = 'SA_REP' OR job_id = 'IT_PROG')
    AND salary > 10000;
    
-- Utilizando a cláusula ORDER BY - ORDEM ascendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;
    
-- Utilizando a cláusula ORDER BY - ORDEM 
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;
    

-- Utilizando a cláusula ORDER BY – Referenciando ALIAS
SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cláusula ORDER BY – Referenciando a Posição
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Utilizando a cláusula ORDER BY – Múltiplas colunas ou expressões
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- Utilizando Variáveis de Substituição - &
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

-- Utilizando Variáveis de Substituição - &&
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

-- Variáveis de substituição com valores tipo Character e Date
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

