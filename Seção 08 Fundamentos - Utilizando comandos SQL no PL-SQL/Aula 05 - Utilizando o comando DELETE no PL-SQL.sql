--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 08 - Utilizando comandos SQL no PL/SQL
-- Aula: 05 - Utilizando o comando DELETE no PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 025
-- Tempo: 3m
--


SET SERVEROUTPUT ON
DECLARE
  vEmployee_id employees.employee_id%type := 207;
BEGIN
  DELETE FROM employees
   WHERE employee_id = vEmployee_id;
  COMMIT;
END;