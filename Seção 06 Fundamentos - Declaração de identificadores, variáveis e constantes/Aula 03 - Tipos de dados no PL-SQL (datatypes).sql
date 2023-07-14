--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 06 - PL/SQL Fundamentos - Declaração de identificadores, variáveis e constantes
-- Aula: 03 - Tipos de dados no PL-SQL (datatypes)
-- Autor: Emílio Scudero
-- Identificador: 015
-- Tempo: 37m
--


-- Declarando variáveis utilizando os principais tipos de dados

SET SERVEROUTPUT ON
DECLARE
  v_numero NUMBER(11, 2) := 1200.50;
  v_caracter_tam_fixo CHAR(100) := 'Texto de tamanho fixo de até 32767 bytes';
  v_caracter_tam_variavel VARCHAR2(32760) := 'Texto de tamanho variável de até 32767 bytes';
  v_booleano BOOLEAN := TRUE;
  v_data DATE := SYSDATE;
  v_long LONG := 'Texto de tamanho variável de até 32760 bytes';
  v_long_raw LONG RAW := HEXTORAW('43' || '41' || '52');
  v_rowid ROWID;
  v_timestamp TIMESTAMP := SYSTIMESTAMP;
  v_timestamp_tz TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;
  v_caracter_tam_fixo_universal NCHAR(100) := N'Texto de tamanho fixo universal de até 32767 bytes';
  v_caracter_tam_variavel_universal NVARCHAR2(100) := N'Texto de tamanho variável universal de até 32767 bytes';
  v_numero_inteiro BINARY_INTEGER := 1200;
  v_numero_float BINARY_FLOAT := 15000000;
  v_numero_double BINARY_DOUBLE := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Número: ' || v_numero);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho fixo: ' || v_caracter_tam_fixo);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho variável: ' || v_caracter_tam_variavel);

  IF v_booleano THEN
    DBMS_OUTPUT.PUT_LINE('Booleano: TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano: FALSE OR NULL');
  END IF;

  DBMS_OUTPUT.PUT_LINE('Data: ' || v_data);
  DBMS_OUTPUT.PUT_LINE('Long: ' || v_long);
  DBMS_OUTPUT.PUT_LINE('Long raw: ' || v_long_raw);

  SELECT rowid
    INTO v_rowid
    FROM employees
   WHERE first_name = 'Steven'
     AND last_name = 'King';

  DBMS_OUTPUT.PUT_LINE('RowId: ' || v_rowid);
  DBMS_OUTPUT.PUT_LINE('Timestamp: ' || v_timestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp com time zone: ' || v_timestamp_tz);
  DBMS_OUTPUT.PUT_LINE('String com caracteres de tamanho fixo: ' || v_caracter_tam_fixo_universal);
  DBMS_OUTPUT.PUT_LINE('String com caracteres de tamanho variável: ' || v_caracter_tam_variavel_universal);
  DBMS_OUTPUT.PUT_LINE('Número inteiro: ' || v_numero_inteiro);
  DBMS_OUTPUT.PUT_LINE('Número float: ' || v_numero_float);
  DBMS_OUTPUT.PUT_LINE('Número double: ' || v_numero_double);
END;