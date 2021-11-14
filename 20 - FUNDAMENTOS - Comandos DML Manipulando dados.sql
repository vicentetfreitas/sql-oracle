/*
 SEÇÃO 14- AULA 1
28. Comandos DML Manipulando dados

-- OBJETIVOS
    
    Conhecer os comandos DML (Data Manipulation Language)
    Inserir linhas em uma tabela
    Atualizar linhas de uma tabela
    Deletar linhas de uma tabela
    Controlar transações

--  DML (Data Manipulation Language)
    
    Um comando DML é executado quando você:
    _Adiciona linhas a uma tabela
    _Modifica linhas existentes em uma tabela
    _Remove linhas existentes de uma tabela
    
        
--  Transação

    Uma transação consiste de um conjunto de comandos DML que formam uma unidade 
    Lógica de trabalho.

--  INSERT - Inserindo linhas em uma tabela

    Sintaxe:
        INSERT INTO tabela[(coluna[,coluna...])]
        VALUES(valor[,valor...]);
        
--  Inserindo novas linhas

    Insira uma nova linha incluindo valores para cada coluna
    A ordem DEFAULT para lista de valores é a ordem da lista de colunas na tabela
    Opcionalmente, liste as colunas na cláusula INSERT
    Valores de strings de caracteres ou strings de datas deve ser colocados entre aspas simples
   */


--  Utilizando comando INSERT

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(280,'Project Management',103,1400);

-- Inserindo linhas com valores NULOS
--  Método Ecplicito: expecifique a palavra chave NULL na cláusula VALUES
INSERT INTO departments VALUES(290, 'Data Science', NULL, NULL);

DESC employees;

-- Inserindo linhas com valores NULOS - Método Implicito
-- Omita a coluna na lista de colunas
INSERT INTO departments(department_id, department_name)
VALUES(300,'Business Intelligence');

COMMIT;

-- Inserindo valores especiais retornados de Funções

    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
    VALUES(207,'Rock','Balboa','DROCK', '525.342.237',SYSDATE, 'IT_PROG', 7000, NULL, 103, 60);

--  INSERT utilizando data e horas especiais
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
    VALUES(209, 'Vito', 'Corleone', 'VCORL', '525.342.237', TO_DATE('11/02/2020','DD/MM/YYYY'), 'IT_PROG', 2000, NULL, 103, 60);

SELECT * FROM employees ORDER BY employee_id DESC;

COMMIT;
    
--  Utilizando variáveis de substituição

    --  Utilise o símbolo de substituição & em um comando SQL para entrar com valores
    --  & define uma variável de substituição
    
SELECT * FROM departments ORDER BY department_id DESC;

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);   

COMMIT;

-- Inserindo linhas a partir de uma sub-consulta
/*
    Escreva o comando INSERT com uma Sub-Consulta
    Não utilize a cláusula VALUES
    O número de colunas na cláusula INSERT deve ser o mesmo da Sub-Consulta
    Serão inseridas todas as linhas retornadas pela Sub-Consulta
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
--      [WHERE condição];
    
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
--  CUIDADO todas as linhas da tabela serão removidas se você omitir a cláusula WHERE
DELETE FROM countries
WHERE country_name = 'Nigeria';
ROLLBACK;
    
    
-- Transações de Banco de dados
/*
    Uma transação de banco de dados consiste em:
        - Um conjunto de comandos DML
        - Um comando DDL
        - Um comando DCL
    
    Transação de banco de dados: Início e Fim
        Uma transação começa:
        - Quando o primeiro comando DML SQL é executado
        Uma transação termina com um dos seguintes enventos:
            - Um comando COMMIT ou ROLLBACK
            - Um comando DDL ou DCL (executa um COMMIT automático)
            - O usuário encerra sessão (disconecta) no SQL Developer, SQL*Plus, etc
            - Crash do sistema (sistema operacional, rede, banco de dados, etc)
    
    Vantagens do comandos COMMIT e ROLLBACK
        Com os comandos COMMIT e ROLLBACK, você pode:
            - Garantir a consistência dos dados
            - Pré-visualisar as mudanças de dados antes que se tornem permanetes
            - Agrupar operações relacionadas logicamente
    
    SAVEPOINT - Desfazendo mudanças até um marcador
        Crie um marcador na transação corrente utilizando o comando SAVEPOINT
        Desfaça as mudanças a partir do SAVEPOINT utilizando o comando ROLLBACK to SAVEPOINT
        
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
        - O usuário corrente pode ver os resultados dos comandos DML utilizando o comando SELECT 
        - Outros usuários não podem ver os resultados dos comandos DML emitidos pelo usuário corrente da transação
        - As linhas afetadas ficarão com status bloqueado (locked), outras transações não poderão alterar ou deletar os dados destas linhas
    
    Estado dos dados depois do ROLLBACK
        
        - As mudanças nos dados são desfeitas e não são salvas no banco de dados
        - O estado anterior dos dados é recuperado
        - Locks nas linhas afetadas são liberados, as linhas se tornam disponíveis para serem manipuladas por outras transações
        - Todos os savepoints são eliminados
        
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
    
    - As mundanças se tornam permanentes
    - O estado anterior dos dados não pode mais ser restaurado
    - Locks nas linhas afetadas são liberados
    - Todas as sesões e usuários podem ver os resultados das mundaças de dados
    - Locks nas linhas afetadas são liberados, as linhas se tornam disponíveis para serem manipuladas por outras transações
    - Todos os savepoints são eliminados
    
    ROLLBACK a nível de comando
    
    - Se um comando DML falha durante a execução de uma transação, somente este comando é desfeito.
    - O Oracle implementa um savepoint implícito
    - Todas outras mundaças são mantidas
    - O usuário deerá terminar a transação explicitamente executando um comando COMMIT ou ROLLBACK.
    
    Leitura Consistente
    
    - A leitura consistente garante a consistência da visão dos dados no tempo
    - Alterações feitas por outras sessões não causam conflito
    - A leitura concistente garante que para o mesmo dado
        => Leituras não esperam por escritas
        => Escritas não esperam por leituras
        => Escritas esperam por escritas
        
    Cláusula FOR UPDATE no comando SELECT
    
        - Utilize FOR UPDATE OF nome_coluna para qualificar a coluna e a tabela que você pretende alterar,
        então somente as linhas da tabela específica são bloqueadas (locked).
*/
--      Cláusula FOR UPDATE no comando SELECT
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






























    
    
    
    
    
    
    

            
            