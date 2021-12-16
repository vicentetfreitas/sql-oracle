-- Criando e gerenciando Indices
/*
--  Objetivos
    > Entender o que é um índice
    > Criar um índice
    > Utilizar um índice
    > Reconstruir e reorganizar um índice
    > Remover um índice
    
-- O que é um indice
    > É um objeto do schema
    > Pode ser utilizado pelo Oracle para aumentar a performance da recuperação
    de linhas
    > Pode reduzer o (I/O) utilizanfo uma forma rápida de localizar o dado
    > O índice é um objeto independete da tabela que ele indexa
    > É utilizado e mantido automaticamente pelo oracle
    
-- Com os índices são criados
    > Automaticamente
     * Um índice único é criado automaticamente quando você defime uma CONSTRAINT
     de PRIMARY KEY ou UNIQUE na definição da tabela
    > Manualmente:
     * Usuários pode criar índices simples (uma coluna) ou (mais de uma coluna)
     para melhorar a performance do acesso as linhas
*/

-- Analizando o custo do comando no plano de execução

CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando Sinônimos

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sinônimos

DROP SYNONYM departamentos;

DROP SYNONYM dept;

-- Criando Sinônimos Públicos para Tabelas em outro Schema

-- Conecte-se como SYS

CREATE PUBLIC SYNONYM departamentos
FOR hr.departments;

CREATE PUBLIC SYNONYM dept
FOR hr.departments;

-- Conecte-se como SYS

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Conecte-se como HR

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sinônimos Públicos

-- Conecte-se como SYS

DROP PUBLIC SYNONYM departamentos;

DROP PUBLIC SYNONYM dept;
