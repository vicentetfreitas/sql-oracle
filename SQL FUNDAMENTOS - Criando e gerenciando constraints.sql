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
  DESCRIPTION   VARCHAR2(400)NOT NULL ) ;
  
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
  CONSTRAINT projects_project_code_pk UNIQUE (project_code)  );

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
  REFERENCES departments(department_id)) ;
  
-- FOREIGN KEY - Regras de deleção - DEFAULT NO ACTION
DROP TABLE TEAMS;
CREATE TABLE TEAMS
( project_id NUMBER(6) NOT NULL,
 employee_id NUMBER(6) NOT NULL,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (project_id)
DESC projects;