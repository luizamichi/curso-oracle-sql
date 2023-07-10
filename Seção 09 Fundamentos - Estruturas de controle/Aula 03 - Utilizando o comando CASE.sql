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
ACCEPT pDepartment_id PROMPT 'Digite o ID do departamento: '
DECLARE
  vPercentual NUMBER(3);
  vDepartment_id employees.employee_id%type := &pDepartment_id;
BEGIN
  CASE vDepartment_id
  WHEN 80
  THEN
    vPercentual := 10; -- Sales
  WHEN 20
  THEN
    vPercentual := 15; -- Marketing
  WHEN 60
  THEN
    vPercentual := 20; -- IT
  ELSE
    vPercentual := 5;
  END CASE;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || vDepartment_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);

  UPDATE employees
     SET salary = salary * (1 + vPercentual / 100)
   WHERE department_id = &pDepartment_id;
  COMMIT;
END;


-- Utilizando o comando CASE

SET SERVEROUTPUT ON
ACCEPT pDepartment_id PROMPT 'Digite o ID do departamento: '
DECLARE
  vPercentual NUMBER(3);
  vDepartment_id employees.employee_id%type := &pDepartment_id;
BEGIN
  CASE
  WHEN vDepartment_id = 80
  THEN
    vPercentual := 10; -- Sales
  WHEN vDepartment_id = 20
  THEN
    vPercentual := 15; -- Marketing
  WHEN vDepartment_id = 60
  THEN
    vPercentual := 20; -- IT
  ELSE
    vPercentual := 5;
  END CASE;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || vDepartment_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);

  UPDATE employees
     SET salary = salary * (1 + vPercentual / 100)
   WHERE department_id = &pDepartment_id;
   -- COMMIT;
END;