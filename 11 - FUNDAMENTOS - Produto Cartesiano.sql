/*
 SE��O 13 - AULA 5
19. Produto Cartesiano

  A Cl�usula CROSS JOIN produz um produto Cartesiano entre duas tabelas

   */
  
SELECT last_name, department_name
FROM employees
CROSS JOIN departments;