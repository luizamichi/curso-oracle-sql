--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 12 - Cursor explícito
-- Aula: 02 - Controlando um cursor explícito utilizando CURSOR FOR LOOP
-- Autor: Emílio Scudero
-- Identificador: 045
-- Tempo: 10m
--


-- Cursor FOR LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  CURSOR employees_cursor IS
    SELECT *
      FROM employees;
BEGIN
  FOR employees_record IN employees_cursor LOOP
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' ||
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'C99G999G999D99')));

  END LOOP;
END;


-- Cursor FOR LOOP utilizando sub-consulta

SET SERVEROUTPUT ON
SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
BEGIN
  FOR employees_record IN (SELECT *
                             FROM employees)
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' ||
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'C99G999G999D99')));
  END LOOP;
END;