--  CONSTRAINTS: regra de integridade

--  CONSTRAINT NOT NULL
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL,
  project_code  VARCHAR2(10) NOT NULL,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL );

-- CONSTRAINT PRIMARY KEY a nivel de coluna
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL
  CONSTRAINT projects_project_id_pk PRIMARY KEY,
  project_code  VARCHAR2(10) NOT NULL,
  project_name VARCHAR2(100) NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL );
  
-- CONTRAINT PRIMARY KEY a nível de tabela
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL,
  project_code  VARCHAR2(10) NOT NULL,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL,
  CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id) );

-- CONSTRAINT UNIQUE a nível de coluna
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL
  CONSTRAINT projects_project_id_pk PRIMARY KEY,
  project_code  VARCHAR2(10) NOT NULL
  CONSTRAINT projects_project_code_uk UNIQUE,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL );

-- CONSTRAINT UNIQUE a nível de tabela
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL,
  project_code  VARCHAR2(10) NOT NULL,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL,
  CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
  CONSTRAINT projects_project_code_pk UNIQUE (project_code) );

-- CONSTRAINT FOREING KEY a nível de coluna
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL
  CONSTRAINT projects_project_id_pk PRIMARY KEY,
  project_code  VARCHAR2(10) NOT NULL
  CONSTRAINT projects_project_code_uk UNIQUE,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL
  CONSTRAINT projects_department_id_fk REFERENCES departments (department_id), 
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL );

-- CONSTRAINT FOREING KEY a nível de tabela
DROP TABLE projects;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL,
  project_code  VARCHAR2(10) NOT NULL,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR2(400)NOT NULL,
  CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
  CONSTRAINT projects_project_code_uk UNIQUE(project_code), 
  CONSTRAINT department_id_fk FOREIGN KEY (department_id)
  REFERENCES departments(department_id) );
  
-- FOREIGN KEY - Regras de deleção - DEFAULT NO ACTION
DROP TABLE TEAMS;
CREATE TABLE TEAMS
( project_id NUMBER(6)  NOT NULL,
  employee_id NUMBER(6) NOT NULL,
  CONSTRAINT teams_project_id_fk  FOREIGN KEY(project_id)
  REFERENCES projects(project_id),
  CONSTRAINT teams_employee_id_fk FOREIGN KEY(employee_id)
  REFERENCES employees(employee_id) );
  
-- FOREIGN KEY - Regras de deleção - ON DELETE CASCADE
DROP TABLE TEAMS;
CREATE TABLE TEAMS
( project_id NUMBER(6)  NOT NULL,
  employee_id NUMBER(6) NOT NULL,
  CONSTRAINT teams_project_id_fk  FOREIGN KEY(project_id)
  REFERENCES projects(project_id) ON DELETE CASCADE,
  CONSTRAINT teams_employee_id_fk FOREIGN KEY(employee_id)
  REFERENCES employees(employee_id) );

-- FOREIGN KEY - Regras de deleção - ON DELETE SET NULL
DROP TABLE TEAMS;
CREATE TABLE TEAMS
( project_id NUMBER(6)  NOT NULL,
  employee_id NUMBER(6) NOT NULL,
  CONSTRAINT teams_project_id_fk  FOREIGN KEY(project_id)
  REFERENCES projects(project_id) ON DELETE SET NULL,
  CONSTRAINT teams_employee_id_fk FOREIGN KEY(employee_id)
  REFERENCES employees(employee_id) );
  
-- CONSTRAINT CHECK a nível de coluna
-- Oracle Functions (não podem ser referenciaas na constraint CHECK)

SELECT uid, userenv('language'), user, sysdate
FROM dual;

-- CONSTRAINT CHECK a nível de coluna
DROP TABLE projects CASCADE CONSTRAINTS;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL
  CONSTRAINT projects_project_id_pk PRIMARY KEY,
  project_code  VARCHAR2(10) NOT NULL
  CONSTRAINT projects_project_code_uk UNIQUE,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL
  CONSTRAINT projects_department_id_fk REFERENCES departments,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL 
  CONSTRAINT projects_budget_ck CHECK (budget > 0),
  DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- CONSTRAINT CHECK a nível de tabela
DROP TABLE projects CASCADE CONSTRAINTS;
CREATE TABLE projects
( project_id    NUMBER(6)    NOT NULL,
  project_code  VARCHAR2(10) NOT NULL,
  project_name  VARCHAR2(100)NOT NULL,
  department_id NUMBER(4)    NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20) NOT NULL,
  PRIORITY      VARCHAR2(10) NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL, 
  DESCRIPTION   VARCHAR2(400)NOT NULL,
  CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
  CONSTRAINT projects_project_code_uk UNIQUE(project_code),
  CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
  REFERENCES departments(department_id),
    CONSTRAINT projects_budget_ck CHECK (budget > 0) );
DESC projects;


 -- Violando Constraints - Erro
 INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 77,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');
    
-- Violando Constraints - Corrigindo 
INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 60,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');

COMMIT;

-- Consultando Constraints pelo Dicionário de Dados
DESC user_constraints

DESC user_cons_columns

SELECT co.constraint_name,
       co.constraint_type,
       co.search_condition,
       co.r_constraint_name,
       co.delete_rule,
       cc.column_name,
       cc.position,
       co.status
 FROM   user_constraints co
   JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND 
                                (co.table_name = cc.table_name)
 WHERE  co.table_name = 'PROJECTS'
 ORDER BY co.constraint_name,
          cc.position;