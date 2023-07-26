--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 28 - Cursor explícito com SQL dinâmico
-- Aula: 01 - Cursor explícito com SQL dinâmico
-- Autor: Emílio Scudero
-- Identificador: 101
-- Tempo: 16m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_fetch_employees_cursor_dynamic (
  p_manager_id    IN employees.manager_id%TYPE DEFAULT NULL,
  p_department_id IN employees.department_id%TYPE DEFAULT NULL
)
AS
  TYPE employees_cursor_type IS REF CURSOR;
  employees_cursor   employees_cursor_type;
  v_employees_record employees%ROWTYPE;
  v_sql              VARCHAR2(600) := 'SELECT * FROM employees WHERE 1 = 1';
BEGIN
  IF p_manager_id IS NOT NULL THEN
    v_sql := v_sql || ' AND manager_id = :manager_id';
  END IF;
  IF p_department_id IS NOT NULL THEN
    v_sql := v_sql || ' AND department_id = :department_id';
  END IF;

  DBMS_OUTPUT.PUT_LINE(v_sql);

  CASE
    WHEN p_manager_id IS NOT NULL AND p_department_id IS NOT NULL THEN
      OPEN employees_cursor FOR v_sql USING p_manager_id, p_department_id;
    WHEN p_manager_id IS NOT NULL AND p_department_id is NULL THEN
      OPEN employees_cursor FOR v_sql USING p_manager_id;
    WHEN p_manager_id IS NULL AND p_department_id IS NOT NULL THEN
      OPEN employees_cursor FOR v_sql USING p_department_id;
    ELSE
      OPEN employees_cursor FOR v_sql;
  END CASE;

  LOOP
    FETCH employees_cursor
    INTO v_employees_record;

    EXIT WHEN employees_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(v_employees_record.employee_id || ' - ' ||
                         v_employees_record.first_name || ' - ' ||
                         v_employees_record.last_name || ' - ' ||
                         v_employees_record.email || ' - ' ||
                         v_employees_record.manager_id || ' - ' ||
                         v_employees_record.department_id);
  END LOOP;

  CLOSE employees_cursor;

EXCEPTION
   WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Executando a procedure

EXEC prc_fetch_employees_cursor_dynamic(p_manager_id => 103, p_department_id => 60)

EXEC prc_fetch_employees_cursor_dynamic(p_manager_id => 103)

EXEC prc_fetch_employees_cursor_dynamic(p_department_id => 60)

EXEC prc_fetch_employees_cursor_dynamic;