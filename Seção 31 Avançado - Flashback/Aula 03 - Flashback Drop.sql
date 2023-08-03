--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 31 - Flashback
-- Aula: 03 - Flashback Drop
-- Autor: Emílio Scudero
-- Identificador: 109
-- Tempo: 21m
--


-- Conecte-se como HR

CREATE TABLE employees_copia AS
  SELECT *
    FROM employees;

SELECT *
  FROM user_objects
 WHERE object_name = 'EMPLOYEES_COPIA';

SELECT *
  FROM employees_copia;


-- Removendo um objeto

DROP TABLE employees_copia;

SELECT *
  FROM user_objects
 WHERE object_name = 'EMPLOYEES_COPIA';

SELECT *
  FROM employees_copia;


-- Consultando a lixeira

SELECT *
  FROM user_recyclebin
 WHERE original_name = 'EMPLOYEES_COPIA';


-- Confirmando que o objeto foi removido

SELECT *
  FROM user_objects
 WHERE object_name = 'EMPLOYEES_COPIA';


-- Restaurando o objeto a partir da lixeira

FLASHBACK TABLE EMPLOYEES_COPIA TO BEFORE DROP;


-- Confirmando que o objeto foi restaurado

SELECT *
  FROM user_objects
 WHERE object_name = 'EMPLOYEES_COPIA';

SELECT *
  FROM employees_copia;

SELECT *
  FROM user_recyclebin
 WHERE original_name = 'EMPLOYEES_COPIA';


-- Removendo todos os objetos do schema do seu usuário da lixeira (definitivamente)

PURGE user_recyclebin;