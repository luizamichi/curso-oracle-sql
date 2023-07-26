--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 26 - SQL dinâmico (Execute immediate e variáveis bind)
-- Aula: 01 - Execute Immediate
-- Autor: Emílio Scudero
-- Identificador: 098
-- Tempo: 19m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_fetch_employees_dynamic (
  p_manager_id    IN employees.manager_id%TYPE DEFAULT NULL,
  p_department_id IN employees.department_id%TYPE DEFAULT NULL
) IS

  v_sql VARCHAR2(600) := 'SELECT *
                            FROM employees
                           WHERE 1 = 1';

  TYPE employees_table_type IS
    TABLE OF employees%ROWTYPE -- Associative Array
    INDEX BY PLS_INTEGER;

  employees_table employees_table_type;
BEGIN

  IF p_manager_id IS NOT NULL THEN
    v_sql := v_sql || '   AND manager_id = ' || p_manager_id;
  END IF;

  IF p_department_id IS NOT NULL THEN
    v_sql := v_sql || '   AND department_id = ' || p_department_id;
  END IF;

  DBMS_OUTPUT.PUT_LINE(v_sql);

  EXECUTE IMMEDIATE v_sql
  BULK COLLECT INTO employees_table;

  FOR i IN 1..employees_table.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).email || ' - ' ||
                         employees_table(i).manager_id || ' - ' ||
                         employees_table(i).department_id);
  END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Executando a procedure

EXEC prc_fetch_employees_dynamic(p_manager_id => 103, p_department_id => 60);

EXEC prc_fetch_employees_dynamic(p_manager_id => 103);

EXEC prc_fetch_employees_dynamic(p_department_id => 60);

EXEC prc_fetch_employees_dynamic;