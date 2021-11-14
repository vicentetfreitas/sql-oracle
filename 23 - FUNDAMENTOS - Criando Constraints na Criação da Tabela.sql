/*
 SE��O 16 - AULA 1
31. Criando Constraints na cria��o da Tabela

--  Tipos de CONSTRAINTS
    - NOT NULL
    - UNIQUE
    - PRIMARY KEY
    - FOREING KEY
    - CHECK

--  CONSTRAINTS - Diretrizes
    - Voc� pode definir o nome da constraint, ou o Oracle pode gerar um nome no formato DEFAULT SYS_Cn
    - Crie uma CONSTRAINT de uma das seguintes maneiras:
        No momento da cria��o da tabela
        Depois da cria��o da tabela
    - Voc� pode definir a CONSTRAINT a n�vel de coluna ou a n�vel de tabela
    - Voc� pode consultar as constraints pelo dicion�rio de dados
    
--  Definindo CONSTRAINTS a n�vel de coluna
    - SINTAXE:
    CREATE TABLE [schema.]tabela
    (coluna tipoDeDado [DEFAULT expr],
     coluna tipoDeDado [DEFAULT expr]
     [CONSTRAINT nome_constraint]
     tipo_constraint, 
     ...
     coluna tipoDeDado [DEFAULT expr])

-- Definindo CONSTRAINTS a n�vel de tabela
   - SINTAXE:
   CREATE TABLEE [schema.]tabela
   (coluna tipoDeDado [DEFAULT expr],
    coluna tipoDeDado [DEFAULT expr],
    ...
    [constraint_tabela][,...]);
    
--  CONSTRAINT NOT NULL

    - A CONSTRAINT NOT NULL n�o permitir� valores nulos para a coluna
    - A CONSTRAINT de Primary Key imp�e a CONSTRAINT NO NULL
   
*/

-- Definindo CONSTRAINT NOT NULL
DROP TABLE projects;
CREATE TABLE projects
(
    project_id      NUMBER(6)       NOT NULL,
    project_code    VARCHAR2(10)    NOT NULL,
    project_name    VARCHAR2(100)   NOT NULL,
    department_id   NUMBER(4)       NOT NULL,
    CREATION_DATE   DATE DEFAULT    SYSDATE NOT NULL,
    START_DATE      DATE,
    END_DATE        DATE,
    STATUS          VARCHAR2(20)    NOT NULL,
    PRIORITY        VARCHAR2(10)    NOT NULL,
    BUDGET          NUMBER(11,2)    NOT NULL,
    DESCRIPTION     VARCHAR2(400)   NOT NULL
);

/*
--  CONSTRAINT PRIMARY KEY
    - Conceito L�gico:
        Melhor identificador da Tabela
    - Garante a integridade
        A CONSTRAINT de PRIMARY KEY imp�e a CONSTRAINT NOT NULL para todas as colunas que comp�e a CONSTRAINT PRIMARY KEY
        Garante que a combina��o dos valores das colunas que comp�e a Constraint PRIMARY KEY s�o unicos.
    - �ndie �nico:
        Por DEFAULT um �ndice �nico ser� automaticamente criado composto das colunas que comp�e a CONSTRAINT de PRIMARY KEY
    */
-- Definindo CONSTRAINT PRIMARY KEY a n�vel de coluna
DROP TABLE projects;
CREATE TABLE projects
(
    project_id      NUMBER(6)       NOT NULL
    CONSTRAINT      projects_project_id_pk PRIMARY KEY,
    project_code    VARCHAR2(10)    NOT NULL,
    project_name    VARCHAR2(100)   NOT NULL,
    department_id   NUMBER(4)       NOT NULL,
    CREATION_DATE   DATE DEFAULT    SYSDATE NOT NULL,
    START_DATE      DATE,
    END_DATE        DATE,
    STATUS          VARCHAR2(20)    NOT NULL,
    PRIORITY        VARCHAR2(10)    NOT NULL,
    BUDGET          NUMBER(11,2)    NOT NULL,
    DESCRIPTION     VARCHAR2(400)   NOT NULL
);

-- Definindo CONSTRAINT PRIMARY KEY a n�vel de tabela
DROP TABLE projects;
CREATE TABLE projects
(
    project_id      NUMBER(6)       NOT NULL,
    project_code    VARCHAR2(10)    NOT NULL,
    project_name    VARCHAR2(100)   NOT NULL,
    department_id   NUMBER(4)       NOT NULL,
    CREATION_DATE   DATE DEFAULT    SYSDATE NOT NULL,
    START_DATE      DATE,
    END_DATE        DATE,
    STATUS          VARCHAR2(20)    NOT NULL,
    PRIORITY        VARCHAR2(10)    NOT NULL,
    BUDGET          NUMBER(11,2)    NOT NULL,
    DESCRIPTION     VARCHAR2(400)   NOT NULL,
    CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id)
);

/*
--  CONSTRAINT UNIQUE
    
    - Conceito L�gico:
        Identificador da Tabela
    - Garante que a combina��o dos valores das colunas que comp�es a CONSTRAINT UNIQUE s�o unicos.
    - �ndice �nico:
        Por DEFAULT um �ndice �nico ser� automaticamente criado composto das colunas que comp�e a Constraint de UNIQUE
*/

-- Definindo CONSTRAINT UNIQUE a n�vel de tabela
DROP TABLE projects;
CREATE TABLE projects
(
    project_id      NUMBER(6)       NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code    VARCHAR2(10)    NOT NULL
        CONSTRAINT projects_project_code_uk UNIQUE,
    project_name    VARCHAR2(100)   NOT NULL,
    department_id   NUMBER(4)       NOT NULL,
    CREATION_DATE   DATE DEFAULT    SYSDATE NOT NULL,
    START_DATE      DATE,
    END_DATE        DATE,
    STATUS          VARCHAR2(20)    NOT NULL,
    PRIORITY        VARCHAR2(10)    NOT NULL,
    BUDGET          NUMBER(11,2)    NOT NULL,
    DESCRIPTION     VARCHAR2(400)   NOT NULL
);





















