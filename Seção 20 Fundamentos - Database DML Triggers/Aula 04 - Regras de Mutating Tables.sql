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

CREATE OR REPLACE TRIGGER a_i_employees_r_trg
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

CREATE OR REPLACE TRIGGER a_i_employees_r_trg
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

CREATE OR REPLACE TRIGGER b_u_validate_salary_employees_r_trg
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

DROP TRIGGER a_i_employees_r_trg;

DROP TRIGGER b_u_validate_salary_employees_r_trg;


-- Resolvendo o problema de Mutating Tables

CREATE OR REPLACE PACKAGE pkg_employees_dados
IS
  TYPE max_salary_table_type IS TABLE OF NUMBER(10, 2)
  INDEX BY BINARY_INTEGER;

  g_max_salary max_salary_table_type;
END pkg_employees_dados;

CREATE OR REPLACE TRIGGER b_iu_validate_salary_employees_s_trg
  BEFORE INSERT OR UPDATE OF salary
  ON employees
DECLARE
  v_max_salary employees.salary%TYPE;
BEGIN
  SELECT MAX(salary)
    INTO pkg_employees_dados.g_max_salary(1)
    FROM employees;
END;

CREATE OR REPLACE TRIGGER b_iu_validate_salary_employees_r_trg
  BEFORE INSERT OR UPDATE OF salary
  ON employees
  FOR EACH ROW
DECLARE
  v_max_salary employees.salary%TYPE;
BEGIN
  IF :new.salary > pkg_employees_dados.g_max_salary(1) * 1.2 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Novo salario não pode ser superior ao maior salario + 20%');
  END IF;
END;


-- Testando a violação da regra 2

SET VERIFY OFF
UPDATE employees
   SET salary = 30000
 WHERE employee_id = 100;

COMMIT;