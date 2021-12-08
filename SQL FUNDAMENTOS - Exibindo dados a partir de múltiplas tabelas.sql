-- Exibindo dados a partir de m�ltiplas tabelas

-- PREFIXOS COLUNA COM NOMES DE TABELA
SELECT
    e.employee_id       "C�D.EMPREGADO",
    e.first_name        "SOBRENOME",
    e.department_id     "ID.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM
    employees e JOIN departments d
    ON (e.department_id = d.department_id);
    
--  UTILIZANDO ALIAS DE TABELA PARA EVITAR AMBIQUIDADE
SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees e JOIN departments d
    ON(e.department_id = d.department_id);
    
-- NATURAL JOINS
-- OBS: N�O MUITO ULTILIZADA
SELECT
    department_id "C�D.DEPARTAMENTO",
    department_name "DEPARTAMENTO",
    location_id "ID.LOCALIZA��O",
    city "CIDADE"
FROM
    departments d NATURAL JOIN locations l ;

-- CL�USULA USING
-- OBS: N�O MUITO ULTILIZADA
SELECT
    e.employee_id "C�D.EMPREGADO",
    e.last_name "SOBRENOME",
    d.location_id "ID.LOCALIZA��O",
    department_id "C�D.DEPARTAMENTO",
    d.department_name "NOME DO DEPARTAMENTO"
FROM
    employees e JOIN departments d 
    USING (department_id) ;
    
-- JOIN COM A CL�USULA ON
-- MAIS �TILIZADO
SELECT
    e.employee_id "C�D.EMPREAGADO",
    e.last_name  "SOBRENOME",
    d.department_id "C�D.DEPARTAMENTO",
    d.location_id "ID.LOCALIZA��O"
FROM
    employees e JOIN departments d
    ON(e.department_id = d.department_id) ;
    
--  JOIN COM V�RIAS TABELAS
SELECT
    e.employee_id "C�D.EMPREAGADO",
    e.last_name "EMPREGADO",
    j.job_title "CARGO",
    d.department_name "DEPARTAMENTO",
    l.city "CIDADE",
    l.state_province "ESTADO",
    l.country_id "PA�S"
FROM employees e
    JOIN jobs        j  ON  ( e.job_id = j.job_id )
    JOIN departments d  ON  ( e.department_id = d.department_id )
    JOIN locations   l  ON  ( d.location_id = l.location_id )
ORDER BY    
    e.employee_id;
DESCRIBE employees;

SELECT 
    e.employee_id "ID.EMPREGADO",
    e.first_name "NOME",
    e.phone_number "TELEFONE",
    j.job_id "CARGO",
    d.department_name "DEPARTAMENTO",
    l.location_id "PA�S",
    l.city "CIDADE",
    l.state_province "ESTADO",
    l.street_address "ENDERE�O"
FROM employees e
    JOIN jobs j        ON ( e.job_id = j.job_id )
    JOIN departments d ON ( e.department_id = d.department_id)
    JOIN locations l   ON ( d.location_id = l.location_id ) ;
    
-- SELFIE JOIN UTILIZANDO A CL�USULA ON
-- JOIN da tabela com ela mesmo
SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
    gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente
ON (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id ;
    
-- NONEQUIJOINS
-- S�o condi��es em que o relacionamento entre as tabelas N�O s�o de IGUALDADE

-- FORMA 1
SELECT
    e.employee_id   "ID.EMPREGADO",
    e.salary        "SAL�RIO",
    j.grade_level   "NIVEL",
    j.lowest_sal    "MENOR SAL�RIO",
    j.highest_sal   "MAIOR SAL�RIO"
FROM employees      e
    JOIN job_grades j
        ON NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal -- Condi��o de relacionamento
ORDER BY e.salary, j.grade_level;

-- FORMA 2
SELECT e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM employees e
    JOIN job_grades j 
      ON NVL( e.salary,0 ) >= j.lowest_sal AND
         NVL( e.salary,0 ) <= j.highest_sal
ORDER BY e.salary;

--  INNER JOIN/NATURAL INNER JOIN/JOIN S�O EQUIVALENTES
SELECT 
    e.employee_id        "ID.EMPREGADO",
    j.job_title          "CARGO",
    d.department_name    "DEPARTAMENTO",
    l.city               "CIDADE",
    l.state_province     "ESTADO",
    l.country_id         "PA�S"
FROM employees e
    JOIN jobs j         ON ( e.job_id = j.job_id )
    JOIN departments d  ON ( e.department_id = d.department_id )
    JOIN locations l    ON ( d.location_id = l.location_id )
ORDER BY e.employee_id;

--OUTER JOIN : CONIDI��O NA TABELA A OU NA TABELA B MAS N�O EM AMBAS

--LEFT OUTER JOIN
/*TODOS OS EMPREGADOS QUE N�O POSSUEM DEPARTARMENTO */
SELECT 
    e.first_name        "NOME",
    e.last_name         "SOBRENOME",
    d.department_id     "C�D.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM 
    employees e LEFT OUTER JOIN departments d -- (ESQUERDA) employees (DIREITA) DEPARTMENTS 
    ON ( e.department_id = d.department_id )
ORDER BY d.department_id;

-- RIGHT OUTER JOIN
/*TODOS OS DEPARTAMENTOS QUE N�O POSSUEM DEPARTARMENTO */
SELECT 
    e.first_name        "NOME",
    e.last_name         "SOBRENOME",
    d.department_id     "C�D.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM 
    employees e RIGHT JOIN departments d -- (ESQUERDA) employees (DIREITA) DEPARTMENTS 
    ON ( e.department_id = d.department_id )
ORDER BY d.department_id;

-- FULL OUTER JOIN
/*TODOS OS DEPARTAMENTOS QUE N�O POSSUEM DEPARTARMENTO  E
  TODOS OS EMPREGADOS QUE N�O POSSUEM DEPARTARMENTO */
SELECT 
    e.first_name        "NOME",
    e.last_name         "SOBRENOME",
    d.department_id     "C�D.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM 
    employees e FULL JOIN departments d -- (ESQUERDA) employees (DIREITA) DEPARTMENTS 
    ON ( e.department_id = d.department_id )
ORDER BY d.department_id;

SELECT 
    e.first_name        "NOME",
    e.last_name         "SOBRENOME",
    d.department_id     "C�D.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM 
    employees e JOIN departments d -- (ESQUERDA) employees (DIREITA) DEPARTMENTS 
    ON ( e.department_id = d.department_id )
ORDER BY d.department_id;

-- PRODUTO CARTESIANOE
SELECT last_name, department_name
FROM employees
CROSS JOIN departments ;
    
-- EQUIJOIN UTILIZANDO SINTAXE ORACLE
SELECT
    e.employee_id       "ID.EMPREGADO",
    e.last_name         "SOBRENOME",
    e.department_id     "ID.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM employees      e,
     departments    d
WHERE ( e.department_id = d.department_id )
ORDER BY e.department_id ;

SELECT 
    e.employee_id     "ID.EMPREGADO",
    j.job_title       "CARGO",
    d.department_name "DEPARTAMENTO",
    l.city            "CIDADE",
    l.state_province  "ESTADO",
    l.country_id      "PA�S"
FROM employees     e,
    jobs           j,
    departments    d,
    locations      l
WHERE   ( e.job_id = j.job_id )
    AND ( e.department_id = d.department_id )
    AND ( d.location_id = l.location_id )
ORDER BY e.employee_id ;

-- NONEQUIJOIN UTILIZANDO SINTAXE ORACLE
SELECT
    e.employee_id   "ID.EMPREGADO",
    e.salary        "SAL�RIO",
    j.grade_level   "NIVEL",
    j.lowest_sal    "M�NIMO",
    j.highest_sal   "M�XIMO"
FROM employees  e,
     job_grades j    
WHERE NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary   ;

--  OUTER JOIN UTILIZANDO A SINTAXE ORACLE
SELECT 
    e.first_name        "NOME",
    e.last_name         "SOBRENOME",
    d.department_id     "ID.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id(+)
ORDER BY e.department_id ;

SELECT 
    e.first_name        "NOME",
    e.last_name         "SOBRENOME",
    d.department_id     "ID.DEPARTAMENTO",
    d.department_name   "DEPARTAMENTO"
FROM
    employees   e,
    departments d
WHERE
    e.department_id(+) = d.department_id
ORDER BY e.department_id ;

-- SELFIE JOINS SINTAXE ORACLE
-- TODOS OS EMPREGADOS E SEUS RESPECTIVOS GERENTES
SELECT
    empregado.employee_id   "Id empregado",
    empregado.last_name     "Sobrenome empregado",
    gerente.employee_id     "Id gerente",
    gerente.last_name       "Sobrenome gerente"
FROM employees empregado,
     employees gerente
WHERE ( empregado.manager_id = gerente.employee_id )
ORDER BY gerente.employee_id ;

-- Outer JOIN e e Selfie JOIN utilizando Sintaxe Oracle
SELECT
    empregado.employee_id   "Id empregado",
    empregado.last_name     "Sobrenome empregado",
    gerente.employee_id     "Id gerente",
    gerente.last_name       "Sobrenome gerente"
FROM employees empregado,
     employees gerente
WHERE ( empregado.manager_id = gerente.employee_id(+) )
ORDER BY gerente.employee_id ;

--  Produto cartesiano
SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j ;

-- Corrigindo erro produto cartesiano
SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id ;