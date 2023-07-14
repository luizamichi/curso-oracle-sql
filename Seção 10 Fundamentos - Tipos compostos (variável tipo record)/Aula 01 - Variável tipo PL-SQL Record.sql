--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 10 - Tipos compostos (variável tipo PL/SQL record)
-- Aula: 01 - Variável tipo PL/SQL record
-- Autor: Emílio Scudero
-- Identificador: 035
-- Tempo: 13m
--


-- Criando um PL/SQL Record

CLEAR SCREEN
SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_employee_id PROMPT 'Digite o ID do empregado: '
DECLARE
  TYPE employee_record_type IS
    RECORD (
      employee_id employees.employee_id%TYPE,
      first_name employees.first_name%TYPE,
      last_name employees.last_name%TYPE,
      email employees.email%TYPE,
      phone_number employees.phone_number%TYPE
    );

  employee_record employee_record_type;
BEGIN
  SELECT employee_id, first_name, last_name, email, phone_number
    INTO employee_record
    FROM employees
   WHERE employee_id = &p_employee_id;

  DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' ||
                       employee_record.first_name || ' - ' ||
                       employee_record.last_name || ' - ' ||
                       employee_record.phone_number);
END;