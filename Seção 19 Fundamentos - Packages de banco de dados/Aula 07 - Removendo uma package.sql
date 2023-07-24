--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 19 - Packages de banco de dados
-- Aula: 07 - Removendo uma package
-- Autor: Emílio Scudero
-- Identificador: 071
-- Tempo: 2m
--


-- Removendo package body do banco de dados

DROP PACKAGE BODY pkg_empregados;


-- Removendo package body e o package specification

DROP PACKAGE pkg_empregados;


-- Recriando o package specification

CREATE OR REPLACE PACKAGE pkg_empregados IS
  g_min_salary employees.salary%TYPE;

  PROCEDURE prc_insere_empregado (
    p_first_name    IN VARCHAR2,
    p_last_name     IN VARCHAR2,
    p_email         IN VARCHAR2,
    p_phone_number  IN VARCHAR2,
    p_hire_date     IN DATE DEFAULT SYSDATE,
    p_job_id        IN VARCHAR2,
    p_salary        IN NUMBER,
    p_commicion_pct IN NUMBER,
    p_manager_id    IN NUMBER,
    p_department_id IN NUMBER
  );

  PROCEDURE prc_aumenta_salario_empregado (
    p_employee_id   IN NUMBER,
    p_percentual    IN NUMBER
  );

  FUNCTION fnc_consulta_salario_empregado (p_employee_id IN NUMBER) RETURN NUMBER;
END pkg_empregados;
/


-- Recriando o package body

CREATE OR REPLACE PACKAGE BODY pkg_empregados IS
  PROCEDURE prc_insere_empregado (
    p_first_name    IN VARCHAR2,
    p_last_name     IN VARCHAR2,
    p_email         IN VARCHAR2,
    p_phone_number  IN VARCHAR2,
    p_hire_date     IN DATE DEFAULT SYSDATE,
    p_job_id        IN VARCHAR2,
    p_salary        IN NUMBER,
    p_commicion_pct IN NUMBER,
    p_manager_id    IN NUMBER,
    p_department_id IN NUMBER
  ) IS
  BEGIN
    IF p_salary < pkg_empregados.g_min_salary THEN
      RAISE_APPLICATION_ERROR(-20002, 'Salario não pode ser inferior ao menor salario dos empregados!');
    END IF;

    INSERT INTO employees (
      employee_id,
      first_name,
      last_name,
      email,
      phone_number,
      hire_date,
      job_id,
      salary,
      commission_pct,
      manager_id,
      department_id
    ) VALUES (
      employees_seq.NEXTVAL,
      p_first_name,
      p_last_name,
      p_email,
      p_phone_number,
      p_hire_date,
      p_job_id,
      p_salary,
      p_commicion_pct,
      p_manager_id,
      p_department_id
    );
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
  END;


  PROCEDURE prc_aumenta_salario_empregado (
    p_employee_id IN NUMBER,
    p_percentual  IN NUMBER
  )
  IS
  -- Nenhuma váriável declarada
  BEGIN
    UPDATE employees
       SET salary = salary * (1 + p_percentual / 100)
     WHERE employee_id = p_employee_id;

  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
  END;


  FUNCTION fnc_consulta_salario_empregado (p_employee_id IN NUMBER) RETURN NUMBER IS
    v_salary employees.salary%TYPE;
  BEGIN
    SELECT salary
      INTO v_salary
      FROM employees
     WHERE employee_id = p_employee_id;

    RETURN (v_salary);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
  END;

BEGIN
  SELECT MIN(salary)
    INTO pkg_empregados.g_min_salary
    FROM employees;
END pkg_empregados;
/