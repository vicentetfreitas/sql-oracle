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

CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando Sin�nimos

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sin�nimos

DROP SYNONYM departamentos;

DROP SYNONYM dept;

-- Criando Sin�nimos P�blicos para Tabelas em outro Schema

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

-- Removendo Sin�nimos P�blicos

-- Conecte-se como SYS

DROP PUBLIC SYNONYM departamentos;

DROP PUBLIC SYNONYM dept;
