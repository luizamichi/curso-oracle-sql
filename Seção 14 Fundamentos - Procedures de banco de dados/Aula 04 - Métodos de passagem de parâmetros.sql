--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 14 - Procedures de banco de dados
-- Aula: 04 - Métodos de passagem de parâmetros
-- Autor: Emílio Scudero
-- Identificador: 054
-- Tempo: 6m
--


-- Método posicional

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  employees_record employees%ROWTYPE;
BEGIN
  PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
                         employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
                         employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);

  DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' ||
                       employees_record.last_name || ' - ' ||
                       employees_record.department_id || ' - ' ||
                       employees_record.job_id || ' - ' ||
                       employees_record.phone_number || ' - ' ||
                       LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;


-- Método nomeado

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  v_employee_id    NUMBER := 100;
  v_first_name     VARCHAR2(200);
  v_last_name      VARCHAR2(200);
  v_email          VARCHAR2(200);
  v_phone_number   VARCHAR2(200);
  v_hire_date      DATE;
  v_job_id         VARCHAR2(200);
  v_salary         NUMBER;
  v_commission_pct NUMBER;
  v_manager_id     NUMBER;
  v_department_id  NUMBER;
BEGIN
  PRC_CONSULTA_EMPREGADO(
    p_employee_id => v_employee_id,
    p_first_name => v_first_name,
    p_last_name => v_last_name,
    p_email => v_email,
    p_phone_number => v_phone_number,
    p_hire_date => v_hire_date,
    p_job_id => v_job_id,
    p_salary => v_salary,
    p_commission_pct => v_commission_pct,
    p_manager_id => v_manager_id,
    p_department_id => v_department_id
  );

  DBMS_OUTPUT.PUT_LINE('P_FIRST_NAME: ' || v_first_name);
  DBMS_OUTPUT.PUT_LINE('P_LAST_NAME: ' || v_last_name);
  DBMS_OUTPUT.PUT_LINE('P_EMAIL: ' || v_email);
  DBMS_OUTPUT.PUT_LINE('P_PHONE_NUMBER: ' || v_phone_number);
  DBMS_OUTPUT.PUT_LINE('P_HIRE_DATE: ' || v_hire_date);
  DBMS_OUTPUT.PUT_LINE('P_JOB_ID: ' || v_job_id);
  DBMS_OUTPUT.PUT_LINE('P_SALARY: ' || v_salary);
  DBMS_OUTPUT.PUT_LINE('P_COMMISSION_PCT: ' || v_commission_pct);
  DBMS_OUTPUT.PUT_LINE('P_MANAGER_ID: ' || v_manager_id);
  DBMS_OUTPUT.PUT_LINE('P_DEPARTMENT_ID: ' || v_department_id);
END;