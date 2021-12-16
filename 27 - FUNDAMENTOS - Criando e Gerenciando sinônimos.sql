/*
-- Criando sinônimos 

--  Objetivos
    > Entender o que é um sinônimo
    > Criar um ninônimo privado
    > Utilizar um sinônimo
    > Remover um sinônimo
    
--  O que é um sinônimo
    > Simplifica o acesso a objetos criando um sinônimo, outro nome para um objeto

-- Uso de sinônimos
   > Criar uma forma fácil de referenciar uma tabela que é de propriedade de outros
   usuários
   > Criar um nome reduzido para um objeto
   > Criar outro nome lógico para um objeto
*/

-- Criando sinomios privados
CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando sinônimos
SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo sinônimos
DROP SYNONYM departamentos;
DROP SYNONYM dept;

-- Criando sinônimos públicos para tabelas em outros Schema
-- Conecte-se como SYS
 
 CREATE PUBLIC SYNONYM departamentos
 FOR hr.departamentos;
 
 CREATE PUBLIC SYNONYM dept
 FOR hr.dept;