--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 02 - Utilizando o comando IF
-- Autor: Emílio Scudero
-- Identificador: 029
-- Tempo: 17m
--


SET SERVEROUTPUT ON
ACCEPT p_department_id PROMPT 'Digite o ID do departamento: '
DECLARE
  v_percentual NUMBER(3);
  v_department_id employees.employee_id%TYPE := &p_department_id;
BEGIN
  IF v_department_id = 80 THEN
    v_percentual := 10; -- Sales
  ELSE
    IF v_department_id = 20 THEN
      v_percentual := 15; -- Marketing
    ELSE
      IF v_department_id = 60 THEN
        v_percentual := 20; -- IT
      ELSE
        v_percentual := 5;
      END IF;
    END IF;
  END IF;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || v_department_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || v_percentual);

  UPDATE employees
     SET salary = salary * (1 + v_percentual / 100)
   WHERE department_id = v_department_id;
  COMMIT;
END;


-- Comando IF com ELSIF

SET SERVEROUTPUT ON
ACCEPT p_department_id PROMPT 'Digite o ID do departamento: '
DECLARE
  v_percentual NUMBER(3);
  v_department_id employees.employee_id%TYPE := &p_department_id;
BEGIN
  IF v_department_id = 80 THEN
    v_percentual := 10; -- Sales
  ELSIF v_department_id = 20 THEN
    v_percentual := 15; -- Marketing
  ELSIF v_department_id = 60 THEN
    v_percentual := 20; -- IT
  ELSE
    v_percentual := 5;
  END IF;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || v_department_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || v_percentual);

  UPDATE employees
     SET salary = salary * (1 + v_percentual / 100)
   WHERE department_id = v_department_id;
  COMMIT;
END;