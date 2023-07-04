--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 06 - PL/SQL Fundamentos - Declaração de identificadores, variáveis e constantes
-- Aula: 02 - Declaração de identificadores (constantes)
-- Autor: Emílio Scudero
-- Identificador: 014
-- Tempo: 8m
--


-- Declarando uma constante do tipo NUMBER

SET SERVEROUTPUT ON
DECLARE
  vPi CONSTANT NUMBER(38, 15) := 3.141592653589793;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Pi = ' || vPi);
END;

-- Declarando constantes do tipo CHAR e VARCHAR2

SET SERVEROUTPUT ON
DECLARE
  vCaracterTamFixo CONSTANT CHAR(2) := 'RS';
  vCaracterTamVariavel CONSTANT VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho fixo = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho variável = ' || vCaracterTamVariavel);
END;

-- Declarando constantes do tipo DATE

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY HH24:MI:SS';
DECLARE
  vData1 CONSTANT DATE := '29/04/20';
  vData2 CONSTANT DATE := '29/04/2020';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Data 1 = ' || vData1);
  DBMS_OUTPUT.PUT_LINE('Data 2 = ' || vData2);
END;