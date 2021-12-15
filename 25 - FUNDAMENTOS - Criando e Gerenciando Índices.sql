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
DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;

SELECT * 
FROM employees
WHERE last_name = 'Himuro';

-- Criando index
CREATE INDEX employees_last_name_idx
ON employees(last_name);

-- Criando index composto
CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

SELECT
*
FROM employees
WHERE last_name = 'Himuro' AND first_name = 'Guy';

-- Reconstruindo é reorganizando o índice
ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- Consultando índices
SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM user_indexes ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name)
 AND (ix.table_name = ic.table_name)
WHERE ix.index_name = 'EMPLOYEES'
ORDER BY  ix.index_name, ic.column_position;

SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- Removendo um Índice

DROP INDEX employees_last_name_idx;

DROP INDEX employees_last_name_first_name_idx;





