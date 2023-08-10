--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 33 - Table Functions
-- Aula: 03 - Pipeline Table Functions
-- Autor: Emílio Scudero
-- Identificador: 117
-- Tempo: 9m
--


-- Pipeline Functions

CREATE OR REPLACE FUNCTION fnc_fetch_employees_table_pipeline (
  p_department_id IN NUMBER
) RETURN employees_table PIPELINED IS
  v_employees_table  employees_table := employees_table();
BEGIN
  FOR e IN (
    SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
           salary, commission_pct, manager_id, department_id
      FROM employees
     WHERE department_id = p_department_id
  ) LOOP
    PIPE ROW(employees_row(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                           e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id,
                           e.department_id));
  END LOOP;
END;


-- Utilizando a Pipelined Function

SELECT *
  FROM TABLE(fnc_fetch_employees_table_pipeline(60))
 UNION
SELECT *
  FROM fnc_fetch_employees_table_pipeline(80);