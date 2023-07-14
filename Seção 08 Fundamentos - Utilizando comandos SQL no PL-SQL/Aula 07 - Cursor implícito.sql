--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 08 - Utilizando comandos SQL no PL/SQL
-- Aula: 07 - Cursor implícito
-- Autor: Emílio Scudero
-- Identificador: 027
-- Tempo: 26m
--


SET SERVEROUTPUT ON
DECLARE
  v_department_id employees.department_id%TYPE := 60;
  v_percentual NUMBER(3) := 10;
BEGIN
  UPDATE employees
     SET salary = salary * (1 + v_percentual / 100)
   WHERE department_id = v_department_id;

  DBMS_OUTPUT.PUT_LINE('Número de empregados atualizados: ' || SQL%ROWCOUNT);
  -- COMMIT;
END;

ROLLBACK;