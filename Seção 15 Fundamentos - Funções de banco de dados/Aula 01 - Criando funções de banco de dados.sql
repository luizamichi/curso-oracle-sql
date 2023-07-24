--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 15 - Funções de banco de dados
-- Aula: 01 - Criando funções de banco de dados
-- Autor: Emílio Scudero
-- Identificador: 057
-- Tempo: 11m
--


-- Criando funções de banco de dados

CREATE OR REPLACE FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO (
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
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Executando a função pelo bloco PL/SQL

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_employee_id PROMPT 'Digite o ID do empregado: '
DECLARE
  v_employee_id employees.employee_id%TYPE := &p_employee_id;
  v_salary      employees.salary%TYPE;
BEGIN
  v_salary := FNC_CONSULTA_SALARIO_EMPREGADO(v_employee_id);
  DBMS_OUTPUT.PUT_LINE('Salário: ' || v_salary);
END;


-- Criando uma nova coluna para armazenamento de um código

ALTER TABLE employees ADD employee_code VARCHAR2(10);


-- Definindo um código dinâmico para o empregado

BEGIN
  UPDATE (
    SELECT employees.employee_id, employees.employee_code
      FROM employees
  )
     SET employee_code = TRIM(TO_CHAR(employees_seq.NEXTVAL, '0000000000'));
  COMMIT;
END;


-- Consultando a nova coluna com os valores preenchidos

SELECT employee_code, employees.*
  FROM employees;