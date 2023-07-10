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
  pEmployee_id IN NUMBER
) RETURN NUMBER IS
  vSalary employees.salary%TYPE;
BEGIN
  SELECT salary
    INTO vSalary
    FROM employees
   WHERE employee_id = pEmployee_id;

  RETURN (vSalary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Executando a função pelo bloco PL/SQL

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT PEMPLOYEE_ID PROMPT 'Digite o ID do empregado: '
DECLARE
  vEmployee_id employees.employee_id%TYPE := &pEmployee_id;
  vSalary      employees.salary%TYPE;
BEGIN
  vSalary := FNC_CONSULTA_SALARIO_EMPREGADO(vEmployee_id);
  DBMS_OUTPUT.PUT_LINE('Salário: ' || vSalary);
END;