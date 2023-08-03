--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 31 - Flashback
-- Aula: 01 - Package DBMS_FLASHBACK
-- Autor: Emílio Scudero
-- Identificador: 107
-- Tempo: 22m
--


-- Conectar como SYS

GRANT EXECUTE ON DBMS_FLASHBACK TO hr;


-- Conectar como HR
-- Causando um problema

SELECT employee_id, first_name, last_name, job_id, salary
  FROM employees
 WHERE job_id = 'IT_PROG';

UPDATE employees
   SET salary = salary * 2
 WHERE job_id = 'IT_PROG';

SELECT employee_id, first_name, last_name, job_id, salary
  FROM employees
 WHERE job_id = 'IT_PROG';

COMMIT;


-- Utilizando a package DBMS_FLASHBACK

DECLARE
  CURSOR c_employees IS
    SELECT *
      FROM employees
     WHERE job_id = 'IT_PROG';

  r_employees c_employees%ROWTYPE;
BEGIN
  DBMS_FLASHBACK.ENABLE_AT_TIME(SYSDATE - 30 / 1440); -- Posicionando 10 minutos no passado

  OPEN c_employees;

  DBMS_FLASHBACK.DISABLE; -- Posicionando de volta ao presente

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
 WHERE job_id = 'IT_PROG';