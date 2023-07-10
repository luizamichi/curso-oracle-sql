--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 13 - Tratamento de exceções
-- Aula: 01 - Tratamento de exceções
-- Autor: Emílio Scudero
-- Identificador: 048
-- Tempo: 28m
--


-- Tratamento de exceções pré-definidas do Oracle

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o ID do empregado: '
DECLARE
  vFirst_name employees.first_name%TYPE;
  vLast_name employees.last_name%TYPE;
  vEmployee_id employees.employee_id%TYPE := &pEmployee_id;
BEGIN
  SELECT first_name, last_name
    INTO vfirst_name, vlast_name
    FROM employees
   WHERE employee_id = vEmployee_id;

  DBMS_OUTPUT.PUT_LINE('Empregado: ' || vfirst_name || ' ' || vlast_name);

EXCEPTION
  WHEN NO_DATA_FOUND
  THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, ID = ' || TO_CHAR(vEmployee_id));
  WHEN OTHERS
  THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || SQLERRM);
END;