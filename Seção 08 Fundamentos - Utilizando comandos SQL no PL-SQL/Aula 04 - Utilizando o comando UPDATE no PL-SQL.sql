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
  v_employee_id employees.employee_id%TYPE := 150;
  v_percentual NUMBER(3) := 10;
BEGIN
  UPDATE employees
     SET salary = salary * (1 + v_percentual / 100)
   WHERE employee_id = v_employee_id;
  COMMIT;
END;