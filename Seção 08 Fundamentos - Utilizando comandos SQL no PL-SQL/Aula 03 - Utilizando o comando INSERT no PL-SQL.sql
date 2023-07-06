--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 08 - Utilizando comandos SQL no PL/SQL
-- Aula: 03 - Utilizando o comando INSERT no PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 023
-- Tempo: 6m
--


SET SERVEROUTPUT ON
BEGIN
  INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date,
     job_id, salary, commission_pct, manager_id, department_id)
  VALUES
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
     'IT_PROG', 15000, 0.4, 103, 60);
  COMMIT;
END;