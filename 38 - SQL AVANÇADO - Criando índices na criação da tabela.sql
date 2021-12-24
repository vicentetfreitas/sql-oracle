-- 38 - SQL AVAN�ADO - Criando �ndices na cria��o da tabela
/*
-- Criando �ndices para PRIMARY KEY  na cria��o da tabela
   > Se desejar utilizar o nome da CONSTRAINT para o nome do �ndice 
   (nome default)
   > Se desejar dar um nome espec�fico para um �ndice criado com a CONSTRAINT de 
   PRIMARY KEY 
   > Voc� n�o pode remover um �ndice utilizado por uma CONSTRAINT de PRIMARY KEY
   ou UNIQUE;
   > Se desejar definir propriedades espec�ficas para um �ndice criado com a 
   CONSTRAINT de PRIMARY KEY
*/

-- Criando �ndices para PRIMARY KEY  na cria��o da tabela com nome default
DROP TABLE projects;

CREATE TABLE projects
( project_id    NUMBER (6)    NOT NULL
  CONSTRAINT project_id_pk PRIMARY KEY,
  project_code  VARCHAR2(10)  NOT NULL,
  project_name  VARCHAR2(100) NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20)  NOT NULL,
  PRIORITY      VARCHAR2(10)  NOT NULL,
  BUDGET        NUMBER(11,2) NOT NULL,
  DESCRIPTION   VARCHAR(400)  NOT NULL );

-- Consultando o Indice

SELECT 
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name
FROM  user_indexes     ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name)
 AND (ix.table_name = ic.table_name)
WHERE ix.table_name = 'PROJECTS'
ORDER BY 
 ix.index_name, 
 ic.column_position ; 

-- Criando �ndice para Primary Key na cria��o da Tabela com um nome espec�fico
DROP TABLE projects;

CREATE TABLE projects
( project_id    NUMBER(6)     NOT NULL 
  CONSTRAINT project_id_pk PRIMARY KEY 
  USING INDEX ( CREATE INDEX project_id_idx ON projects (project_id) ),
  project_code  VARCHAR2(10)  NOT NULL,
  project_name  VARCHAR2(100) NOT NULL,
  CREATION_DATE DATE DEFAULT sysdate NOT NULL,
  START_DATE    DATE,
  END_DATE      DATE,
  STATUS        VARCHAR2(20)  NOT NULL,
  PRIORITY      VARCHAR2(10)  NOT NULL,
  BUDGET        NUMBER(11,2)  NOT NULL,
  DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 -- Consultando o Indice
SELECT 
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name
FROM  user_indexes     ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) 
 AND (ix.table_name = ic.table_name)
WHERE ix.table_name = 'PROJECTS'
ORDER BY ix.index_name, ic.column_position; 

-- Criando �ndice para Primary Key na cria��o da Tabela com propriedades espec�ficas
DROP TABLE projects;

CREATE TABLE projects
(project_id    NUMBER(6)     NOT NULL 
   CONSTRAINT project_id_pk  PRIMARY KEY 
   USING INDEX (CREATE INDEX project_id_idx ON projects (project_id)
                TABLESPACE USERS),
 project_code  VARCHAR2(10)  NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20)  NOT NULL,
 PRIORITY      VARCHAR2(10)  NOT NULL,
 BUDGET        NUMBER(11,2)  NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL) ;
 
-- Consultando o Indice
SELECT 
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name
FROM user_indexes      ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name)
  AND (ix.table_name = ic.table_name)
WHERE ix.table_name = 'PROJECTS'
ORDER BY ix.index_name, ic.column_position ; 
