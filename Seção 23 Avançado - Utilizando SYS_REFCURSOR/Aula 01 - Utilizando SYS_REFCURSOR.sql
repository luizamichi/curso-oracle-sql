--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 23 - Utilizando SYS_REFCURSOR
-- Aula: 01 - Utilizando SYS_REFCURSOR
-- Autor: Emílio Scudero
-- Identificador: 090
-- Tempo: 17m
--


CREATE OR REPLACE PROCEDURE prc_cursor_employees (p_employees_cursor OUT SYS_REFCURSOR) IS
BEGIN
  OPEN p_employees_cursor FOR
    SELECT first_name, last_name
      FROM employees;
END prc_cursor_employees;


-- Procedimento referenciando o parâmetro OUT SYS_REFCURSOR

CREATE OR REPLACE PROCEDURE prc_display_empoyees IS
  employees_cursor SYS_REFCURSOR;
  v_first_name     employees.first_name%TYPE;
  v_last_name      employees.last_name%TYPE;
BEGIN
  prc_cursor_employees(employees_cursor);

  LOOP
    FETCH employees_cursor INTO v_first_name, v_last_name;
    EXIT WHEN employees_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(v_first_name || ' ' || v_last_name);
  END LOOP;

  CLOSE employees_cursor;
END prc_display_empoyees;


-- Executando o procedimento PRC_DISPLAY_EMPOYEES

SET SERVEROUTPUT ON
SET VERIFY OFF
EXECUTE prc_display_empoyees


-- Variável cursor e retorno referencindo um cursor

CREATE OR REPLACE FUNCTION fnc_get_empoyees (pemployee_id IN NUMBER) RETURN SYS_REFCURSOR IS
  employees_cursor SYS_REFCURSOR;
BEGIN
  OPEN employees_cursor FOR
    SELECT first_name, last_name
      FROM employees
     WHERE employee_id = pemployee_id;

  RETURN employees_cursor;
END fnc_get_empoyees;


-- Referenciando a função

CREATE OR REPLACE PROCEDURE prc_display_empoyees2 (pemployee_id IN NUMBER) IS
  employees_cursor SYS_REFCURSOR;
  v_first_name     employees.first_name%TYPE;
  v_last_name      employees.last_name%TYPE;
BEGIN
  employees_cursor := fnc_get_empoyees(pemployee_id);

  LOOP
    FETCH employees_cursor INTO v_first_name, v_last_name;
    EXIT WHEN employees_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(v_first_name || ' ' || v_last_name);
  END LOOP;

  CLOSE employees_cursor;
END prc_display_empoyees2;


-- Executando o procedimento

SET SERVEROUTPUT ON
SET VERIFY OFF
EXECUTE prc_display_empoyees2(100)