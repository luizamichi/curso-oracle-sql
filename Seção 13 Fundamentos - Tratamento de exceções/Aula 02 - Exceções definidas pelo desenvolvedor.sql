--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 13 - Tratamento de exceções
-- Aula: 02 - Exceções definidas pelo desenvolvedor
-- Autor: Emílio Scudero
-- Identificador: 049
-- Tempo: 10m
--


-- Exceções personalizadas (intervalo [-20000, -20999])

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_employee_id PROMPT 'Digite o ID do empregado: '
DECLARE
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
  v_job_id employees.job_id%TYPE;
  v_employee_id employees.employee_id%TYPE := &p_employee_id;
  e_president EXCEPTION;
BEGIN
  SELECT first_name, last_name, job_id
    INTO v_first_name, v_last_name, v_job_id
    FROM employees
   WHERE employee_id = v_employee_id;

  IF v_job_id = 'AD_PRES' THEN
    RAISE e_president;
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, ID = ' || TO_CHAR(v_employee_id));
  WHEN e_president THEN
    UPDATE employees
       SET salary = salary * 1.5
     WHERE employee_id = v_employee_id;
    COMMIT;
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;