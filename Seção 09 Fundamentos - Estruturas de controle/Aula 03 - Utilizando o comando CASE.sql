--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 03 - Utilizando o comando CASE
-- Autor: Emílio Scudero
-- Identificador: 030
-- Tempo: 10m
--


-- Utilizando o comando CASE

SET SERVEROUTPUT ON
ACCEPT p_department_id PROMPT 'Digite o ID do departamento: '
DECLARE
  v_percentual NUMBER(3);
  v_department_id employees.employee_id%TYPE := &p_department_id;
BEGIN
  CASE v_department_id
  WHEN 80 THEN
    v_percentual := 10; -- Sales
  WHEN 20 THEN
    v_percentual := 15; -- Marketing
  WHEN 60 THEN
    v_percentual := 20; -- IT
  ELSE
    v_percentual := 5;
  END CASE;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || v_department_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || v_percentual);

  UPDATE employees
     SET salary = salary * (1 + v_percentual / 100)
   WHERE department_id = v_department_id;
  COMMIT;
END;


-- Utilizando o comando CASE

SET SERVEROUTPUT ON
ACCEPT p_department_id PROMPT 'Digite o ID do departamento: '
DECLARE
  v_percentual NUMBER(3);
  v_department_id employees.employee_id%TYPE := &p_department_id;
BEGIN
  CASE
  WHEN v_department_id = 80 THEN
    v_percentual := 10; -- Sales
  WHEN v_department_id = 20 THEN
    v_percentual := 15; -- Marketing
  WHEN v_department_id = 60 THEN
    v_percentual := 20; -- IT
  ELSE
    v_percentual := 5;
  END CASE;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || v_department_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || v_percentual);

  UPDATE employees
     SET salary = salary * (1 + v_percentual / 100)
   WHERE department_id = v_department_id;
  -- COMMIT;
END;