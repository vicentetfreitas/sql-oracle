/*
-- Criando e gerenciando sequ�ncias

    > Entender o que � uma sequ�ncia
    > Criar uma sequ�ncia
    > Utilizar uma sequ�ncia
    > Alterar a defini��o da sequ�ncia
    > Como evitar buracos na numera��o gerada por uma sequ�ncia
    > Remover uma sequ�ncia
    
-- O que � uma sequencia
    > Uma sequencia(Sequencia) � um tipo de objeto utilizado para gera��o autom�tica
    de n�meros sequenciais
    > Um dos principais usos de uma sequencia(Sequence) � gerar valores num�ricos
    sequenciais �nicos que poder�o ser utilizados como valores para chaves prim�rias
    de tabelas.
    > Utilizando uma Sequ�ncia n�o ser� necess�rio desenvolver c�digo de aplica��o,
    visto que a Sequ�ncia ir� gerar os valores automaticamente
    > Voc� pode otimizar a performance de acesso aos valores ferados pela Sequ�ncia
    utilizando CACHE de mem�ria
    
*/

SELECT MAX(employee_id)
FROM employees;

-- Deletando SEQUENCE
DROP SEQUENCE employees_seq;

-- Criando uma SEQUENCE
CREATE SEQUENCE employees_seq
START WITH 213 -- N�mero que inicia a sequ�ncia
INCREMENT BY 1 -- N�mero a ser incrementado
NOMAXVALUE     -- Indica que a sequ�ncia n�o ter� valor m�ximo
NOCACHE        -- Armazena o n�mero em cache
NOCYCLE;       -- A sequ�ncia informarar um erro quando estiver no valor m�ximo

-- Consultando SEQUENCE do esquema de usu�rio, Dicion�rio de Dados
SELECT * FROM user_sequences;

/*
-- Pseudocolunas NEXTVAL e CURRVAL
    > NEXTVAL: Retorna o pr�ximo valor da sequencia, retorna um valor �nico cada
    vez que � referenciado, mesmo quando referenciado por usu�rios diferentes
    > CURRVAL: Retorna o valor corrente da sequencia
    OBS: Na sess�o � necess�rio ser realizado uma referencia a pseudocoluna NEXTVAL
    antes de referenciar a pseudocoluna CURRVAL
*/
-- Referenciando o pr�ximo valor da sequ�ncia, NEXTVAL
SELECT employees_seq.NEXTVAL
FROM DUAL;

-- Recuperando o valor corrente da sequ�ncia, CURVAL
SELECT employees_seq.CURRVAL
FROM dual;

-- Recriando uma sequ�ncia
-- Deletar a sequencia e recriar novamente

-- Utilizando uma sequ�ncia
INSERT INTO employees
( employee_id, first_name, last_name, email, phone_number,
  hire_date, job_id, salary, commission_pct, manager_id,
  department_id )
VALUES ( employees_seq.NEXTVAL, 'Paul', 'Simon', 'PSIMO', '525.342.237', 
         TO_DATE('12/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 1500, NULL, 103,
         60 );
SELECT *
FROM employees
ORDER BY employee_id DESC;

-- Modificando uma sequ�ncia
ALTER SEQUENCE employees_seq
MAXVALUE 999999
CACHE 20;

-- Buracos na numera��o gerada pela sequencia
/*
    > Buracos na numera��o gerada pela sequencia podem ocorrer quando:
    > Ocorre um ROLLBACK
    > A sequencia foi definida com cache de mem�ria e ocorre um crash no sistema
    (banco de dados)
    > A sequencia � utilizada em outra tabela
-- Diretrizer para mudar uma sequ�ncia
    > Voc� deve ser o dono (owner) ou ter previl�gio ALTER para a sequencia
    > Somente valores futuros gerados pela sequencia ser�o afetados
    > A modifica��o da sequencia sofrer� valida��o
*/