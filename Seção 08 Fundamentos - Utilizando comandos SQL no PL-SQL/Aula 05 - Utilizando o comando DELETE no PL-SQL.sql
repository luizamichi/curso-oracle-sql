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
  v_employee_id employees.employee_id%TYPE := 207;
BEGIN
  DELETE FROM employees               -- DELETE employees -- Palavra FROM é opcional
   WHERE employee_id = v_employee_id; --  WHERE employee_id = v_employee_id;
  COMMIT;
END;