-- CRIANDO E GERENCIANDO TABELAS

-- Objetos do equema de um usuario
SELECT * FROM user_objects
ORDER BY object_type;

-- Criando tabelas
DROP TABLE projects;

CREATE TABLE projects(
    project_id       NUMBER(6) NOT NULL,
    project_cod      VARCHAR2(10) NOT NULL,
    prohect_name     VARCHAR2(100) NOT NULL,
    CREATION_DATE    DATE DEFAULT sysdate NOT NULL,
    START_DATE       DATE,
    END_DATE         DATE,
    STATUS           VARCHAR2(20) NOT NULL,
    PRIORITY         VARCHAR2(10) NOT NULL,
    BUDGET           NUMBER(11,2) NOT NULL,
    DESCRIPTION      VARCHAR2(400) NOT NULL );
SELECT * FROM projects ;
DESC projects;

CREATE TABLE teams(
    project_id NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL
);

DROP TABLE teams;
SELECT * FROM teams;
DESC teams;

-- Criando uma Tabela utilizando uma Sub-consulta
DROP TABLE employees_department60;

CREATE TABLE employees_department60
AS
SELECT employee_id, last_name,salary*12 ANNSAL, hire_date
FROM employees
WHERE department_id = 60;

DESC employees_department60

SELECT *
FROM   employees_department60;

-- TRUNCATE TABLE
TRUNCATE TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- DROP TABLE
DROP TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- Consultando a Lixeira
SELECT *
FROM user_recyclebin;

-- Alterando estrutura da tabela
-- ADICIONANDO COLUNA
SELECT * FROM projects;
ALTER TABLE projects
ADD ( department_id NUMBER(3));

--  REMOVENDO COLUNA
ALTER TABLE projects
DROP COLUMN department_id;
DESC projects;

ALTER TABLE projects
ADD ( department_id NUMBER(4) NOT NULL );
DESC projects;

-- ALTERANDO COLUNA
ALTER TABLE projects
MODIFY ( project_cod VARCHAR2(6));
DESC projects;

ALTER TABLE projects
RENAME COLUMN project_name TO name;
DESC projects

/*
-- ALTER TABLE - READ ONLY
- Não permite comandos DDL ou DML
    Sintaxe:
    ALTER TABLE nometabela READ ONLY;
*/
ALTER TABLE employees READ ONLY;
/*
-- ALTER TABLE - READ WRITE
- Permite comandos DDL ou DML
    Sintaxe:
    ALTER TABLE nometabela READ WRITE;
*/
ALTER TABLE employees READ WRITE;
