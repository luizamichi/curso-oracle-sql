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
  vNumero NUMBER(11, 2) := 1200.50;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Número (NUMBER) = ' || vNumero);
END;

-- Declarando variáveis do tipo CHAR e VARCHAR2

SET SERVEROUTPUT ON
DECLARE
  vCaracterTamFixo CHAR(2) := 'RS';
  vCaracterTamVariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho fixo (CHAR) = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho variável (VARCHAR) = ' || vCaracterTamVariavel);
END;

-- Declarando variáveis do tipo DATE

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY HH24:MI:SS';
DECLARE
  vData1 DATE := '29/04/20';
  vData2 DATE := '29/04/2020';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Data 1 (DATE) = ' || vData1);
  DBMS_OUTPUT.PUT_LINE('Data 2 (DATE) = ' || vData2);
END;