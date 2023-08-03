--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 31 - Flashback
-- Aula: 02 - Flashback Query
-- Autor: Emílio Scudero
-- Identificador: 108
-- Tempo: 16m
--


-- Utilizando Flashback Query
-- Causando um problema

SELECT employee_id, first_name, last_name, job_id, salary
  FROM employees
 WHERE job_id = 'FI_ACCOUNT';

UPDATE employees
   SET salary = salary * 2
 WHERE job_id = 'FI_ACCOUNT';

SELECT employee_id, first_name, last_name, job_id, salary
  FROM employees
 WHERE job_id = 'FI_ACCOUNT';

COMMIT;


-- Revertendo o problema

DECLARE
  CURSOR c_employees IS
    SELECT *
      FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '15' MINUTE);

  r_employees c_employees%ROWTYPE;

BEGIN
  OPEN c_employees;

  LOOP
    FETCH c_employees INTO r_employees;
    EXIT WHEN c_employees%NOTFOUND;

    UPDATE employees
       SET salary = r_employees.salary
     WHERE employee_id = r_employees.employee_id;
  END LOOP;

  CLOSE c_employees;

  COMMIT;
END;


-- Consultando após a correção do problema

SELECT employee_id, first_name, last_name, job_id, salary
  FROM employees
 WHERE job_id = 'FI_ACCOUNT';