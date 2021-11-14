/*
 SE��O 15- AULA 1
29. Criando e Gerenciando Tabelas

    OBJETIVOS
    
    - Conhecer os pr�ncipais tipos de objetos do banco de dados
    - Listar e enteder a estrutura de uma tabela
    - Conhecer os tipos de dado Oracle para colunas
    - Criar uma tabela
    - Entender schemas de objetos
    
    Principais objetos do banco de dados oracle
    
            OBJETO                          DESCRI��O
        Tabela(Table)               Unidade b�sica de armazenamento, composta de linhas
        Vis�o(View)                 Representa��o l�gica de um sub-conjunto de dados de uma ou mais tabelas
        Sequ�ncia(Sequence)         Objeto utilizado para gerar n�meros sequenciais
        �ndex(Index)                Objeto que pode otimizar a performance de algumas consultas (queries)
        Sin�nimo(Synonym)           Nome alternativo para um objeto.
        
    Regras de nomenclatura
    Nomes de tabelas e colunas:
        - Devem come�ar com uma letra;
        - Devem ter de 1 a 30 caracteres e tamanho
        - Devem conter somente A-Z, a-z, 0-9, _, $ e #
        - N�o pode ser um nome duplicado de outro objeto de propriedade do mesmo usu�rio (mesmo schema)
        - N�o pode ser uma palavra reservada do Oracle server
*/

SELECT *
FROM user_objects
ORDER BY object_type;

/*
    O comando CREATE TABLE
    
    Para criar uma Tabela
    - Voc� deve ter:
        O privil�gio CREATE table
        Espa�o (storage �rea)
    - Voc� especifica:
        Nome da tabela
        Para cada coluna da Tabela: Nome da Coluna, tipo de dados da coluna, e tamanho m�ximo da coluna
        
    CREATE TABLE - Sintaxe
    
    CREATE TAB�E [schema.]tabela
    (coluna tipodedado [DEFAULT expr][,...]);
    
    Referenciando tabelas de outros usu�rios
    
        - Tabelas pertencentes a outro usu�rio(schema) n�o est�o no schema do seu usu�rio
        - Voc� deve prefixar o nome da tabela com o nome do usu�rio dono(owner) da tabela
        - Voc� precisa ter os privil�gios do objeto necess�rios para poder acessar uma Tabela de outro usu�rio(schema)
        
    CREATE TABLE - Op��o DEFAULT
    
        - Especifique um valor default para uma coluna durante o INSERT
        - Valores de strings literais, express�es, ou fun��es SQL s�o valores legais
        - Outro nome de coluna ou de uma pseudocoluna s�o valores ilegais
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

-- Consultando as Tabelas existentes pelo Dicion�rio de Dados

DESC user_tables

SELECT table_name
FROM   user_tables;

-- Consultando os Objetos do tipo TABLE do usu�rio

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












































