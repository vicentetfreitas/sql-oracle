-- 29.SQL AVANÇADO - Referenciando objetos de outro schema (usuário)

SELECT *
FROM   employees;

SELECT *
FROM   hr.employees;

-- Conectar como usuário sys (DBA)

-- Criar o usuário ALUNO
CREATE USER aluno
IDENTIFIED BY aluno
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION TO aluno;


-- Criar uma conexão no SQL Developer para o usuário ALUNO para o banco XEPDB1
-- Conectar como usuário aluno
-- Consultando a Tabela employees do schema do usuário HR
SELECT *
FROM   hr.employees;

-- Erro ORA-00942: a tabela ou view não existe
-- Conectar como usuário hr ou como usuário sys (DBA)
-- Passar o privilégo SELECT no objeto hr.employees para o usuário aluno
GRANT SELECT on hr.employees to aluno;

-- Conectar como usuário aluno

SELECT *
FROM   hr.employees;

-- Conectar como usuário sys (DBA)
-- criar um sinonimo público employees para hr.employees
DROP PUBLIC SYNONYM employees;

CREATE PUBLIC SYNONYM employees FOR hr.employees;

-- Conectar como usuário aluno
SELECT *
FROM   employees;
