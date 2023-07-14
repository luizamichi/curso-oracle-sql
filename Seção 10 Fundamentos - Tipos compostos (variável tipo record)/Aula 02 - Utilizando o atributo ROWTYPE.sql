--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 10 - Tipos compostos (variável tipo PL/SQL record)
-- Aula: 02 - Utilizando atributo %ROWTYPE
-- Autor: Emílio Scudero
-- Identificador: 036
-- Tempo: 9m
--


-- Criando um PL/SQL Record utilizando atributo %ROWTYPE

CLEAR SCREEN
SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_employee_id PROMPT 'Digite o ID do empregado: '
DECLARE
  employee_record employees%ROWTYPE;
  v_employee_id employees.employee_id%TYPE := &p_employee_id;
BEGIN
  SELECT *
    INTO employee_record
    FROM employees
   WHERE employee_id = v_employee_id;

  DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' ||
                       employee_record.first_name || ' - ' ||
                       employee_record.last_name || ' - ' ||
                       employee_record.phone_number || ' - ' ||
                       employee_record.job_id);
END;