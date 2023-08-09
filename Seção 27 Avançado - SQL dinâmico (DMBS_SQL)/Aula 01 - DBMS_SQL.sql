--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 27 - SQL dinâmico (DBMS_SQL)
-- Aula: 01 - DBMS_SQL
-- Autor: Emílio Scudero
-- Identificador: 100
-- Tempo: 22m
--


-- Comando DML

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_update_salary_employee (
  p_employee_id IN employees.employee_id%TYPE,
  p_percentual  IN NUMBER)
IS
  v_cursor_id      INTEGER;
  v_rows_processed INTEGER;
BEGIN
  -- Abrindo o cursor
  v_cursor_id := DBMS_SQL.OPEN_CURSOR;

  -- Parsing comando SQL
  DBMS_SQL.PARSE(v_cursor_id, 'UPDATE employees
                                  SET salary = salary * (1 + (:g_percentual / 100))
                                WHERE employee_id = :g_employee_id', DBMS_SQL.NATIVE);

  -- Binding variáveis
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, ':g_percentual', p_percentual);
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, ':g_employee_id', p_employee_id);

  -- Executando o cursor
  v_rows_processed := DBMS_SQL.EXECUTE(v_cursor_id);

  -- Fechando o cursor
  DBMS_SQL.CLOSE_CURSOR(v_cursor_id);

  -- COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Executando a procedure

SELECT *
  FROM employees;

EXEC prc_update_salary_employee(p_employee_id => 109, p_percentual => 10);

SELECT *
  FROM employees;

ROLLBACK;


-- Comando SELECT

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  v_cursor_id  INTEGER;
  v_rowcount   NUMBER;
  v_first_name VARCHAR2(30);
  v_last_name  VARCHAR2(30);
BEGIN
  v_cursor_id := DBMS_SQL.OPEN_CURSOR;

  DBMS_SQL.PARSE(v_cursor_id, 'SELECT first_name, last_name FROM employees', DBMS_SQL.NATIVE);

  DBMS_SQL.DEFINE_COLUMN(v_cursor_id, 1, v_first_name, 30);

  DBMS_SQL.DEFINE_COLUMN(v_cursor_id, 2, v_last_name, 30);

  v_rowcount := DBMS_SQL.EXECUTE_AND_FETCH(v_cursor_id);

  LOOP
    EXIT WHEN DBMS_SQL.FETCH_ROWS(v_cursor_id) = 0;

    DBMS_SQL.COLUMN_VALUE(v_cursor_id, 1, v_first_name);

    DBMS_SQL.COLUMN_VALUE(v_cursor_id, 2, v_last_name);

    DBMS_OUTPUT.PUT_LINE(v_last_name || ', ' || v_first_name);
  END LOOP;

  DBMS_SQL.CLOSE_CURSOR(v_cursor_id);
END;


-- Exemplo de paginação utilizando o comando WITH

CREATE OR REPLACE TYPE employee_info AS OBJECT (
  employee_id NUMBER(6),
  first_name VARCHAR2(20),
  last_name VARCHAR2(25),
  email VARCHAR2(25),
  hire_date DATE,
  job_id VARCHAR2(10),
  salary NUMBER(8, 2),
  commission_pct NUMBER(2, 2),
  manager_id NUMBER(6),
  department_id NUMBER(4),
  department_name VARCHAR2(30),
  department_manager_id NUMBER(6),
  location_id NUMBER(4),
  job_title VARCHAR2(35),
  min_salary NUMBER(6),
  max_salary NUMBER(6)
);

CREATE OR REPLACE TYPE employee_info_table AS TABLE OF employee_info;

CREATE OR REPLACE FUNCTION fn_paginated_employees (
  p_page         IN NUMBER DEFAULT 1, -- Número da página desejada
  p_row_per_page IN NUMBER DEFAULT 10 -- Quantidade de registros por página
) RETURN employee_info_table PIPELINED
IS
  v_page NUMBER;
  v_row_per_page NUMBER;
BEGIN
  v_page := ABS(GREATEST(1, p_page));
  v_row_per_page := ABS(GREATEST(1, p_row_per_page));

  FOR emp_rec IN (
    WITH employees_data AS (
      SELECT employee_id, first_name, last_name, email, hire_date, job_id,
             salary, commission_pct, manager_id, department_id,
             ROW_NUMBER() OVER (ORDER BY employee_id) row_num
        FROM employees
    ),
    departments_data AS (
      SELECT department_id, department_name, manager_id, location_id
        FROM departments
    ),
    jobs_data AS (
      SELECT job_id, job_title, min_salary, max_salary
        FROM jobs
    )
    SELECT emp.employee_id, emp.first_name, emp.last_name, emp.email,
           emp.hire_date, emp.job_id, emp.salary, emp.commission_pct,
           emp.manager_id, emp.department_id, dep.department_name,
           dep.manager_id department_manager_id, dep.location_id,
           job.job_title, job.min_salary, job.max_salary
      FROM employees_data emp
     INNER JOIN departments_data dep ON emp.department_id = dep.department_id
     INNER JOIN jobs_data job ON emp.job_id = job.job_id
     WHERE emp.row_num BETWEEN ((v_page - 1) * v_row_per_page) + 1 AND v_page * v_row_per_page
  ) LOOP
    PIPE ROW (employee_info(emp_rec.employee_id, emp_rec.first_name, emp_rec.last_name, emp_rec.email,
                            emp_rec.hire_date, emp_rec.job_id, emp_rec.salary, emp_rec.commission_pct,
                            emp_rec.manager_id, emp_rec.department_id, emp_rec.department_name,
                            emp_rec.department_manager_id, emp_rec.location_id,
                            emp_rec.job_title, emp_rec.min_salary, emp_rec.max_salary));
  END LOOP;

  RETURN;
END;


-- Executando a consulta
SELECT *
  FROM fn_paginated_employees(/*1, 10*/);

SELECT *
  FROM fn_paginated_employees(2, 15);