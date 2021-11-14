/*
 SEÇÃO 15- AULA 2
30. Alterando a Estrutura da Tabela

    Comando ALTER TABLE
    
        Utilize o comando ALTER TABLE para:
        - Adicionar uma nova coluna
        - Modificar uma nova coluna
        - Definir um valor default para uma nova coluna
        - Remover uma coluna
        - Renomear uma coluna
        - Alterar o estado (status) da tabela para read-only ou para read-writer
    
    ALTER TABLE - Adicionando colunas
    
        ALTER TABLE nome_tabela
        ADD(nome_coluna tipo_de_dado DEFAULT expr
        [, nome_coluna tipo_de_dado DEFAULT expr]...);
        
    ALTER TABLE - Removendo uma coluna
    
        ALTER TABLE nome_tabela
        DROP COLUMN nome_coluna;
   
*/

--  ALTER TABLE - Adicionando coluna
ALTER TABLE projects
ADD (department_id NUMBER(4) NOT NULL);

DESC projects;

-- ALTER TABLE - Removendo uma coluna
ALTER TABLE projects
DROP COLUMN department_id;

-- ALTER TABLE - Modificando colunas

/*  ALTER TABLE nome_tabela
    MODIFY(nome_coluna tipo_de_dado DEFAULT expr
        [, nome_coluna tipo_de_dado DEFAULT
        expr]...);    
*/
ALTER TABLE projects
MODIFY (project_code VARCHAR(6));

/*
    ALTER TABLE - Renomeando uma coluna
    ALTER TABLE nome_tabela
    RENAME COLUMN nome_coluna_anterior TO
                  nome_coluna_novo;
*/

ALTER TABLE projects
RENAME COLUMN project_name TO name;

DESC projects

/*
-- ALTER TABLE - READ ONLY
- Não permite comandos DDL ou DML
    Sintaxe:
    ALTER TABLE nometabela READ ONLY;
*/

ALTER TABLE employees READ ONLY;

/*
-- ALTER TABLE - READ WRITE
- Permite comandos DDL ou DML
    Sintaxe:
    ALTER TABLE nometabela READ WRITE;
*/
ALTER TABLE employees READ WRITE;










































