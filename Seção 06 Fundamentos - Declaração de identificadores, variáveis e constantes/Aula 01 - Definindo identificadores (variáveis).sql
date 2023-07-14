--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 06 - PL/SQL Fundamentos - Declaração de identificadores, variáveis e constantes
-- Aula: 01 - Declaração de identificadores (variáveis)
-- Autor: Emílio Scudero
-- Identificador: 013
-- Tempo: 20m
--


-- Declarando uma variável do tipo NUMBER

SET SERVEROUTPUT ON
DECLARE
  -- Declaração de variável
  v_numero NUMBER(11, 2) := 1200.50;
BEGIN
  -- Saída do número
  DBMS_OUTPUT.PUT_LINE('Número (NUMBER): ' || v_numero);
END;


-- Declarando variáveis do tipo CHAR e VARCHAR2

SET SERVEROUTPUT ON
DECLARE
  -- Declaração de variáveis
  v_caracter_tam_fixo CHAR(2) := 'RS';
  v_caracter_tam_variavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
  -- Saída das strings
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho fixo (CHAR): ' || v_caracter_tam_fixo);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho variável (VARCHAR): ' || v_caracter_tam_variavel);
END;


-- Declarando variáveis do tipo DATE

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY HH24:MI:SS';
DECLARE
  -- Declaração de variáveis
  v_data1 DATE := '29/04/20';
  v_data2 DATE := '29/04/2020';
  v_data3 DATE := TO_DATE('29/04/20', 'DD/MM/YY');
  v_data4 DATE := TO_DATE('29/04/2020', 'DD/MM/YYYY');
BEGIN
  -- Saída das datas
  DBMS_OUTPUT.PUT_LINE('Data 1 (DATE): ' || TO_CHAR(v_data1, 'DD/MM/YY HH24:MI:SS'));
  DBMS_OUTPUT.PUT_LINE('Data 2 (DATE): ' || TO_CHAR(v_data2, 'DD/MM/YY HH24:MI:SS'));
  DBMS_OUTPUT.PUT_LINE('Data 3 (DATE): ' || TO_CHAR(v_data3, 'DD/MM/YY HH24:MI:SS'));
  DBMS_OUTPUT.PUT_LINE('Data 4 (DATE): ' || TO_CHAR(v_data4, 'DD/MM/YY HH24:MI:SS'));
END;