--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 11 - Tipos compostos (collections)
-- Aula: 03 - Collections - Nested Table
-- Autor: Emílio Scudero
-- Identificador: 039
-- Tempo: 9m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_table_type IS TABLE OF INTEGER(2);
  Numero_table Numero_table_type := Numero_table_type();
BEGIN
  -- Armazena números de 1 a 10 em um Nested Table
  FOR i IN 1..10
  LOOP
    Numero_table.extend;
    Numero_table(i) := i;
  END LOOP;

  -- O programa vai fazer muitas coisas...
  -- Lê o Nested Table e imprime os números armazenados
  FOR I IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Nested Table: Índice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_table(i)));
  END LOOP;
END;