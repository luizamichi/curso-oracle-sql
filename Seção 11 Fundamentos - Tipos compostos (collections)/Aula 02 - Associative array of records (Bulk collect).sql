--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 11 - Tipos compostos (collections)
-- Aula: 02 - Associative Array of Records - Bulk Collect
-- Autor: Emílio Scudero
-- Identificador: 038
-- Tempo: 10m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE employees_table_type IS TABLE OF employees%ROWTYPE INDEX BY BINARY_INTEGER; -- Type Associative Array
  employees_table employees_table_type;
BEGIN
  SELECT *
    BULK COLLECT INTO employees_table
    FROM employees;

  FOR i IN employees_table.first..employees_table.last
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary, '99G999G999D99'));
  END LOOP;
END;


-- Utilizando o comando FORALL, exemplo aumentando o salário dos 10 funcionários de menor salário

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE employees_table_type IS TABLE OF employees%ROWTYPE INDEX BY BINARY_INTEGER;
  employees_table employees_table_type;
BEGIN
  SELECT *
    BULK COLLECT INTO employees_table
    FROM employees
   ORDER BY salary ASC;

  -- Imprime os valores originais
  DBMS_OUTPUT.PUT_LINE('Antes' || CHR(13) || CHR(10));
  FOR i IN 1..employees_table.COUNT
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         TO_CHAR(employees_table(i).salary, '99G999G999D99'));

    -- Aumenta o salário em 10% do valor
    employees_table(i).salary := employees_table(i).salary * 1.1;
  END LOOP;

  IF employees_table.COUNT >= 10 THEN
    -- Altera o salário dos 10 primeiros funcionários
    FORALL i IN 1..10
    UPDATE employees
       SET ROW = employees_table(i)
     WHERE employee_id = employees_table(i).employee_id;
  END IF;

  -- Busca novamente os funcionários (já com os novos salários)
  SELECT *
    BULK COLLECT INTO employees_table
    FROM employees
   ORDER BY salary ASC;

  -- Imprime os novos valores
  DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(10) || 'Depois' || CHR(13) || CHR(10));
  FOR i IN 1..employees_table.COUNT
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         TO_CHAR(employees_table(i).salary, '99G999G999D99'));
  END LOOP;

  ROLLBACK;
END;