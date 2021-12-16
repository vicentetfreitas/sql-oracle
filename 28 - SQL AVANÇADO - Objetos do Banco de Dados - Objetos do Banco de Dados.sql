-- 28.SQL AVANÇADO - Objetos do Banco de Dados
/*
-- Objetos do Banco de Dados
    > Categorias de Objetos do Banco de Dados ORACLE
      => Schema Objects
      => Nonschema Objects
      
-- Schema Objects
    > é uma coleção de estrutura lógica de objetos
    > Um usuário do Banco de Dados Oracle possui um e somente um schema com o mesmo
    nome do seu username
    > Tabela: unidade básica do banco de dados para armazenar dados, composta por
    linhas e colunas
    > Sinônimo: nome alternativa para um obejto no banco de dados
    > View: uma consulta SQL armazenada o dicionário de dados referenciando tabelas
    ou outras views.
    > Materialized View: possui uma tabela real preenchida com o resultado de uma
    consulta SQL com nas views normais. Existe uma tabela real que é esvaziada 
    (truncad) e repreenchida com uma frequência especificada
    > Constraind: são regras de restrição para validação de entrada de dados em
    tabelas.
    > Database Links: conexão entre dois bancos de dados físicos
    > Índices: são utilizados para melhorar a performance da recuperação de dados
    de uma tabela.
    > Procedure e Função: são unidades de program codificadas em PL/SQL compiladas
    e salvas no banco de dados Oracle. Pode realizar chamadas de procedures e funções
    de qualquer ambiente que se conect ao ORACLE.Funções retornam um valor, procedures
    não retornam valor.
    > Package: são schema objects codificadas em PL/SQL compiladas e salvas no banco
    de dados ORACLE. Uma package(pacote) pode conter: procedures, funções, cursores,
    exceções, variáveis e constantes.
    > Triggers: são unidades de programa compiladas e armazenadas no banco de dados
    e executadas automaticamente para um evento específico do banco de dados
    > Sequence: são objetos do banco de dados utilizados para geração de números
    sequenciais únicos. Sequence são geralmente utilizadas para geração de números
    para valores de Primary Key

-- Nonschemas Objects
    > Outros tipos de objetos do banco de dados são chamados de Nonschemas Objects
    > Não pertencem a um schema são objetos de administração de banco de dados
    > Ex: directories, roles, tablespaces, users e etc.
*/
-- Objetos do schema do usuário conectado
DESC user_objects;

SELECT 
 object_name,
 object_type,
 status
FROM 
 user_objects
ORDER BY object_type;

-- Conectar como usuário SYS (DBA)
DESC DBA_OBJECTS

SELECT   owner, object_name, object_type, status
FROM     dba_objects
WHERE    owner = 'HR'
ORDER BY object_type;
-- Exemplos de consultas a Nonschema Objects pelo Dicionário de Dados Oracle
SELECT *
FROM dba_tablespaces;

SELECT *
FROM   dba_users;