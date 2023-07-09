--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 11 - Tipos compostos (collections)
-- Aula: 01 - Collections - Associative Array
-- Autor: Emílio Scudero
-- Identificador: 037
-- Tempo: 12m
--


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
  INDEX BY BINARY_INTEGER;
  Numero_table Numero_Table_Type;
BEGIN
  -- Armazena números de 1 a 10 em um vetor associativo
  FOR i IN 1..10
  LOOP
    Numero_Table(i) := i;
  END LOOP;

  -- Programa faz uma série de coisas...
  -- Lê o vetor associativo e imprime os números armazenados
  FOR i IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Associative Array: Índice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
  END LOOP;
END;