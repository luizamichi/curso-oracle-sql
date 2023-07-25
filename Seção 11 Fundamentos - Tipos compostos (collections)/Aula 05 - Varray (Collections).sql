--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 11 - Tipos compostos (collections)
-- Aula: 05 - Varray - Collections
-- Autor: Emílio Scudero
-- Identificador: 041
-- Tempo: 7m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE numero_table_type IS VARRAY(10) OF INTEGER(2);
  numero_table numero_table_type := numero_table_type();
BEGIN
  -- Armazena números de 1 a 10 em um Varray
  FOR i IN 1..10
  LOOP
    numero_table.extend;
    numero_table(i) := i;
  END LOOP;

  -- O programa vai fazer muitas coisas...
  -- Lê o Varray e imprime os números armazenados
  FOR i IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Varray: Índice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(numero_table(i)));
  END LOOP;
END;