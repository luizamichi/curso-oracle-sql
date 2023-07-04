--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: PL/SQL Fundamentos - Declaração de identificadores, variáveis e constantes
-- Aula: 03 - Tipos de dados no PL-SQL (datatypes)
-- Autor: Emílio Scudero
-- Identificador: 015
--


-- Declarando variáveis utilizando os principais tipos de dados

SET SERVEROUTPUT ON
DECLARE
  vNumero NUMBER(11, 2) := 1200.50;
  vCaracterTamFixo CHAR(100) := 'Texto de tamanho fixo de até 32767 bytes';
  vCaracterTamVariavel VARCHAR2(100) := 'Texto de tamanho variável de até 32767 bytes';
  vBooleano BOOLEAN := TRUE;
  vData DATE := sysdate;
  vLong LONG := 'Texto de tamanho variável de até 32760 bytes';
  vLongRaw LONG RAW := HEXTORAW('43' || '41' || '52');
  vRowId ROWID;
  vTimestamp TIMESTAMP := systimestamp;
  vTimestampTz TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal NCHAR(100) := 'Texto de tamanho fixo universal de até 32767 bytes';
  vCaracterTamVariavelUniversal NVARCHAR2(100) := 'Texto de tamanho variável universal de até 32767 bytes';
  vNumeroInteiro BINARY_INTEGER := 1200;
  vNumeroFloat BINARY_FLOAT := 15000000;
  vNumeroDouble BINARY_DOUBLE := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Número = ' || vNumero);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho fixo = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String - Caracteres de tamanho variável = ' || vCaracterTamVariavel);

  IF  vBooleano = TRUE
  THEN
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;

  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong);
  DBMS_OUTPUT.PUT_LINE('Long raw = ' || vLongRaw);

  SELECT rowid INTO vRowId
    FROM employees
   WHERE first_name = 'Steven'
     AND last_name = 'King';

  DBMS_OUTPUT.PUT_LINE('RowId = ' || vRowId);
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp com time zone = ' || vTimestampTz);
  DBMS_OUTPUT.PUT_LINE('String com caracteres de tamanho fixo = ' || vCaracterTamFixoUniversal);
  DBMS_OUTPUT.PUT_LINE('String com caracteres de tamanho variável = ' || vCaracterTamVariavelUniversal);
  DBMS_OUTPUT.PUT_LINE('Número inteiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Número float = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Número double = ' || vNumeroDouble);
END;