--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 31 - Flashback
-- Aula: 04 - Flashback Table
-- Autor: Emílio Scudero
-- Identificador: 110
-- Tempo: 15m
--


-- Utilizando Flashback Table

CREATE TABLE employees_copia2 AS
  SELECT *
    FROM employees;


-- Conectado como SYS

GRANT FLASHBACK ON hr.employees_copia2 TO hr;


-- Conectado como SYS ou HR

ALTER TABLE hr.employees_copia2 ENABLE ROW MOVEMENT;


-- Conectado como HR

SELECT *
  FROM hr.employees_copia2;

DELETE FROM hr.employees_copia2;

COMMIT;


-- Consultando a tabela

SELECT *
  FROM hr.employees_copia2;


-- Resaurando a tabela para posição de 5 minutos atras

FLASHBACK TABLE hr.employees_copia2 TO TIMESTAMP SYSTIMESTAMP - INTERVAL '5' MINUTE;


-- Consultando a tabela

SELECT *
  FROM hr.employees_copia2;