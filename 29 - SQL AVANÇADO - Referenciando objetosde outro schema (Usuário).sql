-- 29.SQL AVAN�ADO - Referenciando objetos de outro schema (usu�rio)

SELECT *
FROM   employees;

SELECT *
FROM   hr.employees;

-- Conectar como usu�rio sys (DBA)

-- Criar o usu�rio ALUNO
CREATE USER aluno
IDENTIFIED BY aluno
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION TO aluno;


-- Criar uma conex�o no SQL Developer para o usu�rio ALUNO para o banco XEPDB1
-- Conectar como usu�rio aluno
-- Consultando a Tabela employees do schema do usu�rio HR
SELECT *
FROM   hr.employees;

-- Erro ORA-00942: a tabela ou view n�o existe
-- Conectar como usu�rio hr ou como usu�rio sys (DBA)
-- Passar o privil�go SELECT no objeto hr.employees para o usu�rio aluno
GRANT SELECT on hr.employees to aluno;

-- Conectar como usu�rio aluno

SELECT *
FROM   hr.employees;

-- Conectar como usu�rio sys (DBA)
-- criar um sinonimo p�blico employees para hr.employees
DROP PUBLIC SYNONYM employees;

CREATE PUBLIC SYNONYM employees FOR hr.employees;

-- Conectar como usu�rio aluno
SELECT *
FROM   employees;
