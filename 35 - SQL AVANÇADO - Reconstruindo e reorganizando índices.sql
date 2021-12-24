-- 34 - SQL AVANÇADO - Reconstruindo e Reorganizando Índices

-- Reconstruindo e Reorganizando um Índice
ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- Reconstruindo e Reorganizando um índice com online
ALTER INDEX employees_last_name_first_name_idx REBUILD ONLINE;


