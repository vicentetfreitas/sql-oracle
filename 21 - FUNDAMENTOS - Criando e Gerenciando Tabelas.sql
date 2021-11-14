/*
 SEÇÃO 15- AULA 1
29. Criando e Gerenciando Tabelas

    OBJETIVOS
    
    - Conhecer os príncipais tipos de objetos do banco de dados
    - Listar e enteder a estrutura de uma tabela
    - Conhecer os tipos de dado Oracle para colunas
    - Criar uma tabela
    - Entender schemas de objetos
    
    Principais objetos do banco de dados oracle
    
            OBJETO                          DESCRIÇÃO
        Tabela(Table)               Unidade básica de armazenamento, composta de linhas
        Visão(View)                 Representação lógica de um sub-conjunto de dados de uma ou mais tabelas
        Sequência(Sequence)         Objeto utilizado para gerar números sequenciais
        índex(Index)                Objeto que pode otimizar a performance de algumas consultas (queries)
        Sinônimo(Synonym)           Nome alternativo para um objeto.
        
    Regras de nomenclatura
    Nomes de tabelas e colunas:
        - Devem começar com uma letra;
        - Devem ter de 1 a 30 caracteres e tamanho
        - Devem conter somente A-Z, a-z, 0-9, _, $ e #
        - Não pode ser um nome duplicado de outro objeto de propriedade do mesmo usuário (mesmo schema)
        - Não pode ser uma palavra reservada do Oracle server
*/

SELECT *
FROM user_objects
ORDER BY object_type;

/*
    O comando CREATE TABLE
    
    Para criar uma Tabela
    - Você deve ter:
        O privilégio CREATE table
        Espaço (storage área)
    - Você especifica:
        Nome da tabela
        Para cada coluna da Tabela: Nome da Coluna, tipo de dados da coluna, e tamanho máximo da coluna
        
    CREATE TABLE - Sintaxe
    
    CREATE TABÇE [schema.]tabela
    (coluna tipodedado [DEFAULT expr][,...]);
    
    Referenciando tabelas de outros usuários
    
        - Tabelas pertencentes a outro usuário(schema) não estão no schema do seu usuário
        - Você deve prefixar o nome da tabela com o nome do usuário dono(owner) da tabela
        - Você precisa ter os privilégios do objeto necessários para poder acessar uma Tabela de outro usuário(schema)
        
    CREATE TABLE - Opção DEFAULT
    
        - Especifique um valor default para uma coluna durante o INSERT
        - Valores de strings literais, expressões, ou funções SQL são valores legais
        - Outro nome de coluna ou de uma pseudocoluna são valores ilegais
        - O tipo de dado do valor dafalt deve combinar com o tipo de dado da coluna

*/

-- Criando Tabelas
DROP TABLE projects;
CREATE TABLE projects
    (project_id     NUMBER(6)               NOT NULL,
     project_code   VARCHAR(10)             NOT NULL,
     project_name   VARCHAR(100)            NOT NULL,
     CREATION_DATE  DATE DEFAULT SYSDATE    NOT NULL,
     START_DATE     DATE,
     END_DATE       DATE,
     STATUS         VARCHAR(20)             NOT NULL,
     PRIORITY       VARCHAR(2)              NOT NULL,
     BUDGET         NUMBER(11,2)            NOT NULL,
     DESCRIPTION    VARCHAR(400)            NOT NULL
     );

DESC projects;
SELECT * FROM projects;

DROP TABLE teams;

CREATE TABLE teams
    (project_id     NUMBER(6)   NOT NULL,
     employee_id    NUMBER(6)   NOT NULL
    );

-- Consultando estrutura da tabela

DESC projects
DESC teams;

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from   employees
WHERE rowid = 'AAAR6YAAEAAALBbAAE';

-- Consultando as Tabelas existentes pelo Dicionário de Dados

DESC user_tables

SELECT table_name
FROM   user_tables;

-- Consultando os Objetos do tipo TABLE do usuário

DESC user_objects

SELECT object_name, object_type
FROM   user_objects
WHERE  object_type = 'TABLE';

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












































