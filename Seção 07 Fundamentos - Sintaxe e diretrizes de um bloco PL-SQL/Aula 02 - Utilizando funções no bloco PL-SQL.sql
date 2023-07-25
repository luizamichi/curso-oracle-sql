--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - Sintaxe e diretrizes de um bloco PL/SQL
-- Aula: 02 - Utilizando funções no bloco PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 018
-- Tempo: 6m
--


-- Cálculo do valor da média entre dois números

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  v_numero_1 NUMBER(13, 2); -- Declaração de variável para o primeiro número
  v_numero_2 NUMBER(13, 2); -- Declaração de variável para o segundo número
  v_media NUMBER(13, 2); -- Declaração de variável para a média
BEGIN
  v_numero_1 := 5000.8888;
  v_numero_2 := 3000.4444;
  v_media := ROUND((v_numero_1 + v_numero_2) / 2, 2);

  DBMS_OUTPUT.PUT_LINE('Número 1: ' || v_numero_1); -- Impressão do primeiro número
  DBMS_OUTPUT.PUT_LINE('Número 2: ' || v_numero_2); -- Impressão do segundo número
  DBMS_OUTPUT.PUT_LINE('Média: ' || TO_CHAR(v_media, '99G999G999D99')); -- Impressão da média calculada
END;