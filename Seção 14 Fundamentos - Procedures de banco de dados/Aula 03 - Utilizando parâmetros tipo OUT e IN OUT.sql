--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 14 - Procedures de banco de dados
-- Aula: 03 - Utilizando parâmetros tipo OUT e IN OUT
-- Autor: Emílio Scudero
-- Identificador: 053
-- Tempo: 11m
--


-- Utilizando parâmetros tipo OUT

CREATE OR REPLACE PROCEDURE prc_consulta_empregado (
  p_employee_id    IN NUMBER,
  p_first_name     OUT VARCHAR2,
  p_last_name      OUT VARCHAR2,
  p_email          OUT VARCHAR2,
  p_phone_number   OUT VARCHAR2,
  p_hire_date      OUT DATE,
  p_job_id         OUT VARCHAR2,
  p_salary         OUT NUMBER,
  p_commission_pct OUT NUMBER,
  p_manager_id     OUT NUMBER,
  p_department_id  OUT NUMBER
) IS
-- Nenhuma variável declarada
BEGIN
  SELECT first_name, last_name, email, phone_number, hire_date,
         job_id, salary, commission_pct, manager_id, department_id
    INTO p_first_name, p_last_name, p_email, p_phone_number, p_hire_date,
         p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id
    FROM employees
   WHERE employee_id = p_employee_id;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado não existe: ' || p_employee_id);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;


-- Executando procedure com parâmetro tipo OUT

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  employees_record employees%ROWTYPE;
BEGIN
  prc_consulta_empregado(100, employees_record.first_name, employees_record.last_name, employees_record.email,
                         employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
                         employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);

  DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' ||
                       employees_record.last_name || ' - ' ||
                       employees_record.department_id || ' - ' ||
                       employees_record.job_id || ' - ' ||
                       employees_record.phone_number || ' - ' ||
                       LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;


-- Utilizando parâmetros tipo OUT com opção NOCOPY

CREATE OR REPLACE PROCEDURE prc_consulta_empregado (
  p_employee_id    IN NUMBER,
  p_first_name     OUT NOCOPY VARCHAR2,
  p_last_name      OUT NOCOPY VARCHAR2,
  p_email          OUT NOCOPY VARCHAR2,
  p_phone_number   OUT NOCOPY VARCHAR2,
  p_hire_date      OUT NOCOPY DATE,
  p_job_id         OUT NOCOPY VARCHAR2,
  p_salary         OUT NOCOPY NUMBER,
  p_commission_pct OUT NOCOPY NUMBER,
  p_manager_id     OUT NOCOPY NUMBER,
  p_department_id  OUT NOCOPY NUMBER
) IS
BEGIN
  SELECT first_name, last_name, email, phone_number, hire_date,
         job_id, salary, commission_pct, manager_id, department_id
    INTO p_first_name, p_last_name, p_email, p_phone_number, p_hire_date,
         p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id
    FROM employees
   WHERE employee_id = p_employee_id;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado não existe: ' || p_employee_id);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;


-- Executando procedure com parâmetro tipo OUT

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  employees_record employees%ROWTYPE;
BEGIN
  prc_consulta_empregado(100, employees_record.first_name, employees_record.last_name, employees_record.email,
                         employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
                         employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);

  DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' ||
                       employees_record.last_name || ' - ' ||
                       employees_record.department_id || ' - ' ||
                       employees_record.job_id || ' - ' ||
                       employees_record.phone_number || ' - ' ||
                       LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;