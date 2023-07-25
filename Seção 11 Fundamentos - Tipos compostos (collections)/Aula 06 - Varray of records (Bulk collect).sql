--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 11 - Tipos compostos (collections)
-- Aula: 06 - Varray of Records - Bulk Collect
-- Autor: Emílio Scudero
-- Identificador: 042
-- Tempo: 5m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE employees_table_type IS VARRAY(200) OF employees%ROWTYPE;
  employees_table employees_table_type := employees_table_type();
BEGIN
  SELECT *
    BULK COLLECT INTO employees_table
    FROM employees;

  FOR i IN employees_table.first..employees_table.last
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary, '99G999G999D99'));
  END LOOP;
END;