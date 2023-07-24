--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 19 - Packages de banco de dados
-- Aula: 03 - Criando o package body
-- Autor: Emílio Scudero
-- Identificador: 067
-- Tempo: 6m
--


CREATE OR REPLACE PACKAGE BODY PKG_EMPREGADOS IS
  PROCEDURE PRC_INSERE_EMPREGADO (
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_email IN VARCHAR2,
    p_phone_number IN VARCHAR2,
    p_hire_date IN DATE DEFAULT SYSDATE,
    p_job_id IN VARCHAR2,
    p_salary IN NUMBER,
    p_commicion_pct IN NUMBER,
    p_manager_id IN NUMBER,
    p_department_id IN NUMBER
  ) IS
  BEGIN
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


  PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO (
    p_employee_id IN NUMBER,
    p_percentual IN NUMBER
  ) IS
 -- Nenhuma váriável declarada
  BEGIN
    UPDATE employees
       SET salary = salary * (1 + p_percentual / 100)
     WHERE employee_id = p_employee_id;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
  END;


  FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO (
    p_employee_id IN NUMBER
  ) RETURN NUMBER IS
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
END PKG_EMPREGADOS;