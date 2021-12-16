/*
-- Criando e gerenciando sequências

    > Entender o que é uma sequência
    > Criar uma sequência
    > Utilizar uma sequência
    > Alterar a definição da sequência
    > Como evitar buracos na numeração gerada por uma sequência
    > Remover uma sequência
    
-- O que é uma sequencia
    > Uma sequencia(Sequencia) é um tipo de objeto utilizado para geração automática
    de números sequenciais
    > Um dos principais usos de uma sequencia(Sequence) é gerar valores numéricos
    sequenciais únicos que poderão ser utilizados como valores para chaves primárias
    de tabelas.
    > Utilizando uma Sequência não será necessário desenvolver código de aplicação,
    visto que a Sequência irá gerar os valores automaticamente
    > Você pode otimizar a performance de acesso aos valores ferados pela Sequência
    utilizando CACHE de memória
    
*/

SELECT MAX(employee_id)
FROM employees;

-- Deletando SEQUENCE
DROP SEQUENCE employees_seq;

-- Criando uma SEQUENCE
CREATE SEQUENCE employees_seq
START WITH 213 -- Número que inicia a sequência
INCREMENT BY 1 -- Número a ser incrementado
NOMAXVALUE     -- Indica que a sequência não terá valor máximo
NOCACHE        -- Armazena o número em cache
NOCYCLE;       -- A sequência informarar um erro quando estiver no valor máximo

-- Consultando SEQUENCE do esquema de usuário, Dicionário de Dados
SELECT * FROM user_sequences;

/*
-- Pseudocolunas NEXTVAL e CURRVAL
    > NEXTVAL: Retorna o próximo valor da sequencia, retorna um valor único cada
    vez que é referenciado, mesmo quando referenciado por usuários diferentes
    > CURRVAL: Retorna o valor corrente da sequencia
    OBS: Na sessão é necessário ser realizado uma referencia a pseudocoluna NEXTVAL
    antes de referenciar a pseudocoluna CURRVAL
*/
-- Referenciando o próximo valor da sequência, NEXTVAL
SELECT employees_seq.NEXTVAL
FROM DUAL;

-- Recuperando o valor corrente da sequência, CURVAL
SELECT employees_seq.CURRVAL
FROM dual;

-- Recriando uma sequência
-- Deletar a sequencia e recriar novamente

-- Utilizando uma sequência
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

-- Modificando uma sequência
ALTER SEQUENCE employees_seq
MAXVALUE 999999
CACHE 20;

-- Buracos na numeração gerada pela sequencia
/*
    > Buracos na numeração gerada pela sequencia podem ocorrer quando:
    > Ocorre um ROLLBACK
    > A sequencia foi definida com cache de memória e ocorre um crash no sistema
    (banco de dados)
    > A sequencia é utilizada em outra tabela
-- Diretrizer para mudar uma sequência
    > Você deve ser o dono (owner) ou ter previlégio ALTER para a sequencia
    > Somente valores futuros gerados pela sequencia serão afetados
    > A modificação da sequencia sofrerá validação
*/