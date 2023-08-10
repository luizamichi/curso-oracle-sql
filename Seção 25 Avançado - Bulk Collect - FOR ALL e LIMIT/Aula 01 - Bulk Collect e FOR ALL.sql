--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 25 - Bulk Collect - FOR ALL e LIMIT
-- Aula: 01 - Bulk Collect e FOR ALL
-- Autor: Emílio Scudero
-- Identificador: 096
-- Tempo: 20m
--


-- Bulk Collect

SELECT COUNT(*)
  FROM employees;

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_update_salary (p_percentual IN NUMBER) IS
  TYPE employee_id_table_type IS
    TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER; -- Type Associative Array

  employee_id_table employee_id_table_type;
BEGIN
  SELECT DISTINCT employee_id
    BULK COLLECT INTO employee_id_table
    FROM employees;

  DBMS_OUTPUT.PUT_LINE('Linhas recuperadas: ' || employee_id_table.COUNT);

  FOR indice IN 1..employee_id_table.COUNT LOOP
    UPDATE employees e
       SET e.salary = e.salary * (1 + p_percentual / 100)
     WHERE e.employee_id = employee_id_table(indice); -- Para cada UPDATE dentro do FOR LOOP ocorrerá troca de contexto (Context Switch)

    --
    -- Outro comandos
    --
  END LOOP;
END;


-- Consultando antes

SELECT *
  FROM employees;


--- Executando PRC_UPDATE_SALARY

EXEC prc_update_salary(10);


-- Consultando depois

SELECT *
  FROM employees;

ROLLBACK;


-- Bulk Collect - FOR ALL

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_update_salary (p_percentual IN NUMBER) IS
  TYPE employee_id_table_type IS
    TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER; -- Type Associative Array

  employee_id_table employee_id_table_type;
BEGIN

  SELECT DISTINCT employee_id
    BULK COLLECT INTO employee_id_table
  FROM employees;

  DBMS_OUTPUT.PUT_LINE('Linhas recuperadas: ' || employee_id_table.COUNT);

  FORALL indice IN 1..employee_id_table.COUNT -- FOR ALL empacota todos os UPDATES e envia o pacote em uma única troca de contexto (Context Switch)
    UPDATE employees e
       SET e.salary = e.salary * (1 + p_percentual / 100)
     WHERE e.employee_id = employee_id_table(indice);
END;


-- Consultando

SELECT *
  FROM employees;


--- Executando PRC_UPDATE_TAX

EXEC prc_update_salary(10);


-- Consultando

SELECT *
FROM employees;

ROLLBACK;