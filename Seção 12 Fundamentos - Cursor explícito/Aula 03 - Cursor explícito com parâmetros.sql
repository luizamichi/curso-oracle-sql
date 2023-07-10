--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 12 - Cursor explícito
-- Aula: 03 - Cursor explícito com parâmetros
-- Autor: Emílio Scudero
-- Identificador: 046
-- Tempo: 5m
--

-- Cursor FOR LOOP com parâmetros

SET SERVEROUTPUT ON
SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  CURSOR employees_cursor(pdepartment_id NUMBER,
                          pjob_id VARCHAR2) IS
    SELECT *
      FROM employees
     WHERE department_id = pdepartment_id
       AND job_id = pjob_id;
BEGIN
  FOR employees_record IN employees_cursor (60, 'IT_PROG')
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' ||
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
  END LOOP;
END;