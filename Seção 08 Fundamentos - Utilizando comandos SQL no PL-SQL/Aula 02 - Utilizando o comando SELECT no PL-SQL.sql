--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 08 - Utilizando comandos SQL no PL/SQL
-- Aula: 02 - Utilizando o comando SELECT no PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 022
-- Tempo: 19m
--


-- Cursor implícito retornando apenas um registro

SET SERVEROUTPUT ON
DECLARE
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
  v_salary employees.salary%TYPE;
  v_employee_id employees.employee_id%TYPE := 121;
BEGIN
  SELECT first_name, last_name, salary
    INTO v_first_name, v_last_name, v_salary
    FROM employees
   WHERE employee_id = v_employee_id;

  DBMS_OUTPUT.PUT_LINE('ID: ' || v_employee_id);
  DBMS_OUTPUT.PUT_LINE('Primeiro nome: ' || v_first_name);
  DBMS_OUTPUT.PUT_LINE('Último nome: ' || v_last_name);
  DBMS_OUTPUT.PUT_LINE('Salário: ' || v_salary);
END;


-- Erro ORA-01403 - No Data Found

SET SERVEROUTPUT ON
DECLARE
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
  v_salary employees.salary%TYPE;
  v_employee_id employees.employee_id%TYPE := 50;
BEGIN
  SELECT first_name, last_name, salary
    INTO v_first_name, v_last_name, v_salary
    FROM employees
   WHERE employee_id = v_employee_id;

  DBMS_OUTPUT.PUT_LINE('ID: ' || v_employee_id);
  DBMS_OUTPUT.PUT_LINE('Primeiro nome: ' || v_first_name);
  DBMS_OUTPUT.PUT_LINE('Último nome: ' || v_last_name);
  DBMS_OUTPUT.PUT_LINE('Salário: ' || v_salary);
END;


-- Cursor implícito deve retornar apenas um registro

SET SERVEROUTPUT ON
DECLARE
  v_job_id employees.job_id%TYPE := 'IT_PROG';
  v_avg_salary employees.salary%TYPE;
  v_sum_salary employees.salary%TYPE;
BEGIN
  SELECT ROUND(AVG(salary), 2), ROUND(SUM(salary), 2)
    INTO v_avg_salary, v_sum_salary
    FROM employees
   WHERE job_id = v_job_id;

  DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_job_id);
  DBMS_OUTPUT.PUT_LINE('Média de salários: ' || v_avg_salary);
  DBMS_OUTPUT.PUT_LINE('Somatório de salários: ' || v_sum_salary);
END;


-- Erro ORA-01422 - Too Many Rows

SET SERVEROUTPUT ON
DECLARE
  v_job_id employees.job_id%TYPE;
  v_avg_salary employees.salary%TYPE;
  v_sum_salary employees.salary%TYPE;
BEGIN
  SELECT job_id, ROUND(AVG(salary), 2), ROUND(SUM(salary), 2)
    INTO v_job_id, v_avg_salary, v_sum_salary
    FROM employees
   GROUP BY job_id;

  DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_job_id);
  DBMS_OUTPUT.PUT_LINE('Média de salários: ' || v_avg_salary);
  DBMS_OUTPUT.PUT_LINE('Somatório de salários: ' || v_sum_salary);
END;