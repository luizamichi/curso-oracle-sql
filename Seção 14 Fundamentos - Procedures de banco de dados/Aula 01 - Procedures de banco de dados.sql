--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 14 - Procedures de banco de dados
-- Aula: 01 - Criando procedures de banco de dados
-- Autor: Emílio Scudero
-- Identificador: 051
-- Tempo: 20m
--


-- Criando uma procedure de banco de dados

CREATE OR REPLACE PROCEDURE prc_insere_empregado (
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
-- Nenhuma váriável declarada
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
    department_id)
  VALUES (
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
    p_department_id);
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;


-- Executando a procedure pelo bloco PL/SQL

BEGIN
  prc_insere_empregado('David', 'Bowie', 'DBOWIE', '515.127.4861', SYSDATE, 'IT_PROG', 15000, NULL, 103, 60);
  COMMIT;
END;


-- Consultando o empregado inserido

SELECT *
  FROM employees
 WHERE first_name = 'David'
   AND last_name = 'Bowie';


-- Executando a procedure com o comando EXECUTE do SQL*PLUS

EXEC prc_insere_empregado('Greg', 'Lake', 'GLAKE', '515.127.4961', SYSDATE, 'IT_PROG', 15000, NULL, 103, 60)
COMMIT;


-- Consultando o empregado inserido
SELECT *
  FROM employees
 WHERE first_name = 'Greg'
   AND last_name = 'Lake';