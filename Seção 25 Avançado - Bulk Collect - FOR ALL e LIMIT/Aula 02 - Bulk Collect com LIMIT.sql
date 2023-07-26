--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 25 - Bulk Collect - FOR ALL e LIMIT
-- Aula: 01 - Bulk Collect com LIMIT
-- Autor: Emílio Scudero
-- Identificador: 097
-- Tempo: 19m
--


-- Bulk Collect - FOR ALL

SELECT COUNT(*)
  FROM employees;

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_update_salary2
  (p_percentual IN NUMBER)
IS
  v_limit CONSTANT INTEGER(2) := 30;
  TYPE employee_id_table_type IS
    TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER; -- Type Associative Array

  employee_id_table employee_id_table_type;

  CURSOR employees_cursor IS
    SELECT employee_id
      FROM employees;
BEGIN
  OPEN employees_cursor;

  LOOP
    FETCH employees_cursor
    BULK COLLECT INTO employee_id_table LIMIT v_limit;

    EXIT WHEN employee_id_table.COUNT = 0;

    DBMS_OUTPUT.PUT_LINE('Linhas recuperadas: ' || employee_id_table.COUNT);

    FORALL indice IN 1..employee_id_table.COUNT
      UPDATE employees e
         SET e.salary = e.salary * (1 + p_percentual / 100)
       WHERE e.employee_id = employee_id_table(indice);
  END LOOP;

  CLOSE employees_cursor;
  -- COMMIT;
END;

SELECT *
  FROM employees;


--- Executando PRC_UPDATE_SALARY2

EXEC prc_update_salary2(10)


-- Consultando

SELECT *
  FROM employees;

ROLLBACK;