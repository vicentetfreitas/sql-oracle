-- CRIANDO E GERENCIANDO TABELAS

-- Objetos do equema de um usuario
SELECT * FROM user_objects
ORDER BY object_type;

-- Criando tabelas
DROP TABLE projects;
SELECT * FROM projects;

CREATE TABLE projects(
    project_id NUMBER(6) NOT NULL,
    project_cod VARCHAR2(10) NOT NULL,
    prohect_name VARCHAR2(100) NOT NULL,
    CREATION_DATE DATE DEFAULT sysdate NOT NULL,
    
)