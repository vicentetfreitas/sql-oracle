-- Criando e gerenciando Indices
/*
--  Objetivos
    > Entender o que � um �ndice
    > Criar um �ndice
    > Utilizar um �ndice
    > Reconstruir e reorganizar um �ndice
    > Remover um �ndice
    
-- O que � um indice
    > � um objeto do schema
    > Pode ser utilizado pelo Oracle para aumentar a performance da recupera��o
    de linhas
    > Pode reduzer o (I/O) utilizanfo uma forma r�pida de localizar o dado
    > O �ndice � um objeto independete da tabela que ele indexa
    > � utilizado e mantido automaticamente pelo oracle
    
-- Com os �ndices s�o criados
    > Automaticamente
     * Um �ndice �nico � criado automaticamente quando voc� defime uma CONSTRAINT
     de PRIMARY KEY ou UNIQUE na defini��o da tabela
    > Manualmente:
     * Usu�rios pode criar �ndices simples (uma coluna) ou (mais de uma coluna)
     para melhorar a performance do acesso as linhas
*/

-- Analizando o custo do comando no plano de execu��o
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

-- Reconstruindo � reorganizando o �ndice
ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- Consultando �ndices
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

-- Removendo um �ndice

DROP INDEX employees_last_name_idx;

DROP INDEX employees_last_name_first_name_idx;





