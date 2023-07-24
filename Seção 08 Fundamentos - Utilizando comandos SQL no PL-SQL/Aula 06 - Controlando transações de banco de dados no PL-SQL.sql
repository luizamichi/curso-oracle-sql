--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 08 - Utilizando comandos SQL no PL/SQL
-- Aula: 06 - Controlando transações de banco de dados no PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 026
-- Tempo: 26m
--


SET SERVEROUTPUT ON
DECLARE
  v_employee_id employees.employee_id%TYPE := 150;
BEGIN
  UPDATE employees
     SET salary = 15000
   WHERE employee_id = v_employee_id;
  COMMIT;
END;


SET SERVEROUTPUT ON
DECLARE
  v_employee_id employees.employee_id%TYPE := 150;
BEGIN
  UPDATE employees
     SET salary = 20000
   WHERE employee_id = v_employee_id;
  ROLLBACK;
END;


BEGIN
  INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date,
     job_id, salary, commission_pct, manager_id, department_id)
  VALUES
    (employees_seq.NEXTVAL, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
     'IT_PROG', 15000, 0.4, 103, 60);

  SAVEPOINT INSERT_OK;

  UPDATE employees
     SET salary = 30000
   WHERE job_id = 'IT_PROG';

  ROLLBACK TO INSERT_OK;
  COMMIT;
END;