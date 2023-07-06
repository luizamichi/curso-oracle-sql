--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 08 - Utilizando comandos SQL no PL/SQL
-- Aula: 04 - Utilizando o comando UPDATE no PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 024
-- Tempo: 5m
--


SET SERVEROUTPUT ON
DECLARE
  vEmployee_id employees.employee_id%type := 150;
  vPercentual NUMBER(3) := 10;
BEGIN
  UPDATE employees
     SET salary = salary * (1 + vPercentual / 100)
   WHERE employee_id = vEmployee_id;
  COMMIT;
END;