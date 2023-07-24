--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 20 - Database DML Triggers
-- Aula: 04 - Regras de Mutating Tables
-- Autor: Emílio Scudero
-- Identificador: 076
-- Tempo: 24m
--


-- Violação da regra 1 de Mutating Table

/*
  Regra 1 de Mutating Tables: não altere dados em colunas de chaves primárias,
  chaves estrangeiras ou chaves únicas de tabelas relacionadas àquela na qual
  a trigger disparada está associada
*/

CREATE OR REPLACE TRIGGER A_I_EMPLOYEES_R_TRG
  AFTER INSERT
  ON employees
  FOR EACH ROW
BEGIN
  UPDATE employees
     SET email = UPPER(SUBSTR(:new.first_name, 1, 1) || :new.last_name)
   WHERE employee_id = :new.employee_id;
END;


-- Testando a violação da regra 1

SET VERIFY OFF
BEGIN
  PRC_INSERE_EMPREGADO('Eric', 'Clapton', 'ECLAPTON', '515.188.4861', SYSDATE, 'IT_PROG', 15000, NULL, 103, 60);
  COMMIT;
END;


-- Corrigindo a trigger para que não viole a regra 1

CREATE OR REPLACE TRIGGER A_I_EMPLOYEES_R_TRG
  BEFORE INSERT
  ON employees
  FOR EACH ROW
BEGIN
  :new.email := UPPER(SUBSTR(:new.first_name, 1, 1) || (:new.last_name));
END;


-- Testando a correção da violação da regra 1

SET VERIFY OFF
BEGIN
  PRC_INSERE_EMPREGADO('Eric', 'Clapton', 'ECLAPTON', '515.188.4861', SYSDATE, 'IT_PROG', 15000, NULL, 103, 60);
  COMMIT;
END;


-- Violação da regra 2 de mutating table

/*
  Regra 2 de Mutating Tables: Não leia informações de tabelas que estejam sendo modificadas
*/

CREATE OR REPLACE TRIGGER B_U_VALIDATE_SALARY_EMPLOYEES_R_TRG
  BEFORE UPDATE OF salary
  ON employees
  FOR EACH ROW
DECLARE
  v_max_salary employees.salary%TYPE;
BEGIN
  SELECT MAX(salary)
    INTO v_max_salary
    FROM employees;

  IF :new.salary > v_max_salary * 1.2 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salario não pode ser superior ao maior salario + 20%');
  END IF;
END;


-- Testando a violação da regra 2

SET VERIFY OFF
UPDATE employees
   SET salary = 70000
 WHERE employee_id = 100;

COMMIT;

DROP TRIGGER A_I_EMPLOYEES_R_TRG;

DROP TRIGGER B_U_VALIDATE_SALARY_EMPLOYEES_R_TRG;


-- Resolvendo o problema de Mutating Tables

CREATE OR REPLACE PACKAGE PKG_EMPLOYEES_DADOS
AS
  TYPE max_salary_table_type IS TABLE OF NUMBER(10, 2)
  INDEX BY BINARY_INTEGER;

  g_max_salary max_salary_table_type;
END PKG_EMPLOYEES_DADOS;

CREATE OR REPLACE TRIGGER B_IU_VALIDATE_SALARY_EMPLOYEES_S_TRG
  BEFORE INSERT OR UPDATE OF salary
  ON employees
DECLARE
  v_max_salary employees.salary%TYPE;
BEGIN
  SELECT MAX(salary)
    INTO PKG_EMPLOYEES_DADOS.g_max_salary(1)
    FROM employees;
END;

CREATE OR REPLACE TRIGGER B_IU_VALIDATE_SALARY_EMPLOYEES_R_TRG
  BEFORE INSERT OR UPDATE OF salary
  ON employees
  FOR EACH ROW
DECLARE
  v_max_salary employees.salary%TYPE;
BEGIN
  IF :new.salary > PKG_EMPLOYEES_DADOS.g_max_salary(1) * 1.2 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Novo salario não pode ser superior ao maior salario + 20%');
  END IF;
END;


-- Testando a violação da regra 2

SET VERIFY OFF
UPDATE employees
   SET salary = 30000
 WHERE employee_id = 100;

COMMIT;