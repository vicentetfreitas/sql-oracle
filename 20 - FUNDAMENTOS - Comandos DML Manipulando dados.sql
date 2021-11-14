/*
 SE��O 14- AULA 1
28. Comandos DML Manipulando dados

-- OBJETIVOS
    
    Conhecer os comandos DML (Data Manipulation Language)
    Inserir linhas em uma tabela
    Atualizar linhas de uma tabela
    Deletar linhas de uma tabela
    Controlar transa��es

--  DML (Data Manipulation Language)
    
    Um comando DML � executado quando voc�:
    _Adiciona linhas a uma tabela
    _Modifica linhas existentes em uma tabela
    _Remove linhas existentes de uma tabela
    
        
--  Transa��o

    Uma transa��o consiste de um conjunto de comandos DML que formam uma unidade 
    L�gica de trabalho.

--  INSERT - Inserindo linhas em uma tabela

    Sintaxe:
        INSERT INTO tabela[(coluna[,coluna...])]
        VALUES(valor[,valor...]);
        
--  Inserindo novas linhas

    Insira uma nova linha incluindo valores para cada coluna
    A ordem DEFAULT para lista de valores � a ordem da lista de colunas na tabela
    Opcionalmente, liste as colunas na cl�usula INSERT
    Valores de strings de caracteres ou strings de datas deve ser colocados entre aspas simples
   */


--  Utilizando comando INSERT

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(280,'Project Management',103,1400);

-- Inserindo linhas com valores NULOS
--  M�todo Ecplicito: expecifique a palavra chave NULL na cl�usula VALUES
INSERT INTO departments VALUES(290, 'Data Science', NULL, NULL);

DESC employees;

-- Inserindo linhas com valores NULOS - M�todo Implicito
-- Omita a coluna na lista de colunas
INSERT INTO departments(department_id, department_name)
VALUES(300,'Business Intelligence');

COMMIT;

-- Inserindo valores especiais retornados de Fun��es

    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
    VALUES(207,'Rock','Balboa','DROCK', '525.342.237',SYSDATE, 'IT_PROG', 7000, NULL, 103, 60);

--  INSERT utilizando data e horas especiais
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
    VALUES(209, 'Vito', 'Corleone', 'VCORL', '525.342.237', TO_DATE('11/02/2020','DD/MM/YYYY'), 'IT_PROG', 2000, NULL, 103, 60);

SELECT * FROM employees ORDER BY employee_id DESC;

COMMIT;
    
--  Utilizando vari�veis de substitui��o

    --  Utilise o s�mbolo de substitui��o & em um comando SQL para entrar com valores
    --  & define uma vari�vel de substitui��o
    
SELECT * FROM departments ORDER BY department_id DESC;

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);   

COMMIT;

-- Inserindo linhas a partir de uma sub-consulta
/*
    Escreva o comando INSERT com uma Sub-Consulta
    N�o utilize a cl�usula VALUES
    O n�mero de colunas na cl�usula INSERT deve ser o mesmo da Sub-Consulta
    Ser�o inseridas todas as linhas retornadas pela Sub-Consulta
*/

DROP TABLE sales_reps;
CREATE TABLE sales_reps
(id NUMBER(6,0),
name VARCHAR2(20),
salary NUMBER(8,2),
commission_pct NUMBER(2,2));

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';
    
COMMIT;

SELECT * FROM sales_reps;
    
--  UPDATE - Modificando linhas existentes na tabela
--  Sintaxe:
--      UPDATE tabela
--      SET coluna = valor[, coluna = valor, ...]
--      [WHERE condi��o];
    
    -- Utilizando o comando UPDATE
    UPDATE employees
    SET salary = salary * 1.2;
    
    ROLLBACK;
    
    UPDATE employees
    SET salary = salary * 1.2
    WHERE = 'King';
    
    SELECT * FROM employees ORDER BY desc salary;
-- Utilizando o comando UPDATE para sub-consultas

UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
              salary = (SELECT salary
                        FROM employees
                        WHERE employee_id = 141 )
WHERE employee_id = 139;
    
COMMIT;
    
-- Utilizando o comando DELETE
--  CUIDADO todas as linhas da tabela ser�o removidas se voc� omitir a cl�usula WHERE
DELETE FROM countries
WHERE country_name = 'Nigeria';
ROLLBACK;
    
    
-- Transa��es de Banco de dados
/*
    Uma transa��o de banco de dados consiste em:
        - Um conjunto de comandos DML
        - Um comando DDL
        - Um comando DCL
    
    Transa��o de banco de dados: In�cio e Fim
        Uma transa��o come�a:
        - Quando o primeiro comando DML SQL � executado
        Uma transa��o termina com um dos seguintes enventos:
            - Um comando COMMIT ou ROLLBACK
            - Um comando DDL ou DCL (executa um COMMIT autom�tico)
            - O usu�rio encerra sess�o (disconecta) no SQL Developer, SQL*Plus, etc
            - Crash do sistema (sistema operacional, rede, banco de dados, etc)
    
    Vantagens do comandos COMMIT e ROLLBACK
        Com os comandos COMMIT e ROLLBACK, voc� pode:
            - Garantir a consist�ncia dos dados
            - Pr�-visualisar as mudan�as de dados antes que se tornem permanetes
            - Agrupar opera��es relacionadas logicamente
    
    SAVEPOINT - Desfazendo mudan�as at� um marcador
        Crie um marcador na transa��o corrente utilizando o comando SAVEPOINT
        Desfa�a as mudan�as a partir do SAVEPOINT utilizando o comando ROLLBACK to SAVEPOINT
        
    Utilizando o comando SAVEPOINT
    UPDATE...
    SAVEPOINT updatedone;
    INSERT
    ROLLBACK TO updatedone;
*/

DELETE FROM employees
WHERE employee_id IN(207,208);

COMMIT;

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary, commision_pct,
            manager_id, department_id)
        VALUES (207, 'Rock', 'Balboa', 'DROCK', '525.342.237', SYSDATE, 'IT_PROG',
        7000, NULL, 103, 60);

SAVEPOINT A;

INSERT INTO employees
            (employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary, commision_pct,
            manager_id, department_id)
        VALUES (208, 'Vito', 'Corleone', 'VCORL', '525.342.237', TO_DATE('11/08/2021','DD/MM/YYYY'),
        'IT_PROG', 2000, NULL, 103, 60);

ROLLBACK TO SAVEPOINT A;

COMMIT;

SELECT * FROM employees ORDER BY employee_id DESC;

/*
    Estado dos dados antes do COMMIT ou ROLLBACK
    
        - O estado dos dados pode ser restaurado
        - O usu�rio corrente pode ver os resultados dos comandos DML utilizando o comando SELECT 
        - Outros usu�rios n�o podem ver os resultados dos comandos DML emitidos pelo usu�rio corrente da transa��o
        - As linhas afetadas ficar�o com status bloqueado (locked), outras transa��es n�o poder�o alterar ou deletar os dados destas linhas
    
    Estado dos dados depois do ROLLBACK
        
        - As mudan�as nos dados s�o desfeitas e n�o s�o salvas no banco de dados
        - O estado anterior dos dados � recuperado
        - Locks nas linhas afetadas s�o liberados, as linhas se tornam dispon�veis para serem manipuladas por outras transa��es
        - Todos os savepoints s�o eliminados
        
    Utilizando o comando ROLLBACK
    
    DELETE FROM employees
    WHERE employee_id = 206;
    ROLLBACK
    
    Utilizando o comando COMMIT
    
    DELETE FROM employees
    WHERE employee_id = 206;
    
    INSERT INTO departments
    VALUES(280, 'Corporate Tax', NULL, 1700);
    
    COMMIT;
    
    Estado dos dados depois do COMMIT
    
    - As mundan�as se tornam permanentes
    - O estado anterior dos dados n�o pode mais ser restaurado
    - Locks nas linhas afetadas s�o liberados
    - Todas as ses�es e usu�rios podem ver os resultados das munda�as de dados
    - Locks nas linhas afetadas s�o liberados, as linhas se tornam dispon�veis para serem manipuladas por outras transa��es
    - Todos os savepoints s�o eliminados
    
    ROLLBACK a n�vel de comando
    
    - Se um comando DML falha durante a execu��o de uma transa��o, somente este comando � desfeito.
    - O Oracle implementa um savepoint impl�cito
    - Todas outras munda�as s�o mantidas
    - O usu�rio deer� terminar a transa��o explicitamente executando um comando COMMIT ou ROLLBACK.
    
    Leitura Consistente
    
    - A leitura consistente garante a consist�ncia da vis�o dos dados no tempo
    - Altera��es feitas por outras sess�es n�o causam conflito
    - A leitura concistente garante que para o mesmo dado
        => Leituras n�o esperam por escritas
        => Escritas n�o esperam por leituras
        => Escritas esperam por escritas
        
    Cl�usula FOR UPDATE no comando SELECT
    
        - Utilize FOR UPDATE OF nome_coluna para qualificar a coluna e a tabela que voc� pretende alterar,
        ent�o somente as linhas da tabela espec�fica s�o bloqueadas (locked).
*/
--      Cl�usula FOR UPDATE no comando SELECT
SELECT employee_id, salary, commission_pct, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;

COMMIT;

SELECT
    e.employee_id, e.salary, e.commission_pct
FROM
    employees e JOIN departments d
USING(department_id)
WHERE
    job_id = 'ST_CLERK'
    AND job_id = 1500
FOR UPDATE OF  e.salary
ORDER BY e.employee_id;

COMMIT;






























    
    
    
    
    
    
    

            
            