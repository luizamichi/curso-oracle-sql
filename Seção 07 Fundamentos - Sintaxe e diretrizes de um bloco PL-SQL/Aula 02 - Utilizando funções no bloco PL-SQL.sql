--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - PL/SQL Fundamentos - Sintaxe e diretrizes de um bloco PL/SQL
-- Aula: 02 - Utilizando funções no bloco PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 018
-- Tempo: 6m
--


-- Cálculo do valor da média entre dois números

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  vNumero1 NUMBER(13, 2); -- Declaração de variável para o primeiro número
  vNumero2 NUMBER(13, 2); -- Declaração de variável para o segundo número
  vMedia NUMBER(13, 2); -- Declaração de variável para a média
BEGIN
  vNumero1 := 5000.8888;
  vNumero2 := 3000.4444;
  vMedia := ROUND((vNumero1 + vNumero2) / 2, 2);

  DBMS_OUTPUT.PUT_LINE('Número 1 = ' || vNumero1); -- Impressão do primeiro número
  DBMS_OUTPUT.PUT_LINE('Número 2 = ' || vNumero2); -- Impressão do segundo número
  DBMS_OUTPUT.PUT_LINE('Média = ' || TO_CHAR(vMedia, '99G999G999D99')); -- Impressão da média calculada
END;