/*
 SEÇÃO 16 - AULA 1
31. Criando Constraints na criação da Tabela

--  Tipos de CONSTRAINTS
    - NOT NULL
    - UNIQUE
    - PRIMARY KEY
    - FOREING KEY
    - CHECK

--  CONSTRAINTS - Diretrizes
    - Você pode definir o nome da constraint, ou o Oracle pode gerar um nome no formato DEFAULT SYS_Cn
    - Crie uma CONSTRAINT de uma das seguintes maneiras:
        No momento da criação da tabela
        Depois da criação da tabela
    - Você pode definir a CONSTRAINT a nível de coluna ou a nível de tabela
    - Você pode consultar as constraints pelo dicionário de dados
    
--  Definindo CONSTRAINTS a nível de coluna
    - SINTAXE:
    CREATE TABLE [schema.]tabela
    (coluna tipoDeDado [DEFAULT expr],
     coluna tipoDeDado [DEFAULT expr]
     [CONSTRAINT nome_constraint]
     tipo_constraint, 
     ...
     coluna tipoDeDado [DEFAULT expr])

-- Definindo CONSTRAINTS a nível de tabela
   - SINTAXE:
   CREATE TABLEE [schema.]tabela
   (coluna tipoDeDado [DEFAULT expr],
    coluna tipoDeDado [DEFAULT expr],
    ...
    [constraint_tabela][,...]);
    
--  CONSTRAINT NOT NULL

    - A CONSTRAINT NOT NULL não permitirá valores nulos para a coluna
    - A CONSTRAINT de Primary Key impõe a CONSTRAINT NO NULL
   
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
    - Conceito Lógico:
        Melhor identificador da Tabela
    - Garante a integridade
        A CONSTRAINT de PRIMARY KEY impõe a CONSTRAINT NOT NULL para todas as colunas que compóe a CONSTRAINT PRIMARY KEY
        Garante que a combinação dos valores das colunas que compõe a Constraint PRIMARY KEY são unicos.
    - Índie Único:
        Por DEFAULT um índice único será automaticamente criado composto das colunas que compõe a CONSTRAINT de PRIMARY KEY
    */
-- Definindo CONSTRAINT PRIMARY KEY a nível de coluna
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

-- Definindo CONSTRAINT PRIMARY KEY a nível de tabela
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
    
    - Conceito Lógico:
        Identificador da Tabela
    - Garante que a combinação dos valores das colunas que compões a CONSTRAINT UNIQUE são unicos.
    - Índice Único:
        Por DEFAULT um índice Único será automaticamente criado composto das colunas que compõe a Constraint de UNIQUE
*/

-- Definindo CONSTRAINT UNIQUE a nível de tabela
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





















