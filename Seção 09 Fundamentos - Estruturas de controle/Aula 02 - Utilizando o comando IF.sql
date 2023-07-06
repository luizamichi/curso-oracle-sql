--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 02 - Utilizando o comando IF
-- Autor: Emílio Scudero
-- Identificador: 029
-- Tempo: 17m
--


SET SERVEROUTPUT ON
ACCEPT pDepartment_id PROMPT 'Digite o ID do departamento: '
DECLARE
  vPercentual NUMBER(3);
  vDepartment_id employees.employee_id%type := &pDepartment_id;
BEGIN
  IF vDepartment_id = 80
  THEN
    vPercentual := 10; -- Sales
  ELSE
    IF vDepartment_id = 20
    THEN
      vPercentual := 15; -- Marketing
    ELSE
      IF vDepartment_id = 60
      THEN
        vPercentual := 20; -- IT
      ELSE
        vPercentual := 5;
      END IF;
    END IF;
  END IF;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || vDepartment_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);

  UPDATE employees
     SET salary = salary * (1 + vPercentual / 100)
   WHERE department_id = vDepartment_id;
  COMMIT;
END;

-- Comando IF com ELSIF

SET SERVEROUTPUT ON
ACCEPT pDepartment_id PROMPT 'Digite o ID do departamento: '
DECLARE
  vPercentual NUMBER(3);
  vDepartment_id employees.employee_id%type := &pDepartment_id;
BEGIN
  IF vDepartment_id = 80
  THEN
    vPercentual := 10; -- Sales
  ELSIF vDepartment_id = 20
  THEN
    vPercentual := 15; -- Marketing
  ELSIF vDepartment_id = 60
  THEN
    vPercentual := 20; -- IT
  ELSE
    vPercentual := 5;
  END IF;

  DBMS_OUTPUT.PUT_LINE('ID do departamento: ' || vDepartment_id);
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);

  UPDATE employees
     SET salary = salary * (1 + vPercentual / 100)
   WHERE department_id = vDepartment_id;
  COMMIT;
END;