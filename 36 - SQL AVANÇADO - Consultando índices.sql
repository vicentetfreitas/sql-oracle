-- 36 - SQL AVANÇADO - Consultando índices
/*
-- Consultando índices pelo Dicionário de Dados
   > Utilizando a visão USER_INDEXES, ALL_INDEXES, DBA_INDEXES
   > Utilizando a visão USER_IND_COLUMNS, ALL_IND_COLUMNS, DBA_IND_COLUMNS
*/

-- Consultando índices pelo Dicionário de Dados
SELECT
 ix.index_name,
 ic.column_name,
 ic.column_position,
 ix.index_type,
 ix.uniqueness,
 ix.status,
 ix.tablespace_name
FROM user_indexes ix
 JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) 
 AND  (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position ;
