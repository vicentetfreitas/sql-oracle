-- 35 - SQL AVAN�ADO - Reconstruindo e Reorganizando �ndices

-- Reconstruindo e Reorganizando um �ndice
ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- Reconstruindo e Reorganizando um �ndice com online
ALTER INDEX employees_last_name_first_name_idx REBUILD ONLINE;


