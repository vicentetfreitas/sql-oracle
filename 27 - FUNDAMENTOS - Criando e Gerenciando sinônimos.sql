/*
-- Criando sin�nimos 

--  Objetivos
    > Entender o que � um sin�nimo
    > Criar um nin�nimo privado
    > Utilizar um sin�nimo
    > Remover um sin�nimo
    
--  O que � um sin�nimo
    > Simplifica o acesso a objetos criando um sin�nimo, outro nome para um objeto

-- Uso de sin�nimos
   > Criar uma forma f�cil de referenciar uma tabela que � de propriedade de outros
   usu�rios
   > Criar um nome reduzido para um objeto
   > Criar outro nome l�gico para um objeto
*/

-- Criando sinomios privados
CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando sin�nimos
SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo sin�nimos
DROP SYNONYM departamentos;
DROP SYNONYM dept;

-- Criando sin�nimos p�blicos para tabelas em outros Schema
-- Conecte-se como SYS
 
 CREATE PUBLIC SYNONYM departamentos
 FOR hr.departamentos;
 
 CREATE PUBLIC SYNONYM dept
 FOR hr.dept;