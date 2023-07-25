--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - Sintaxe e diretrizes de um bloco PL/SQL
-- Aula: 01 - Sintaxe e diretrizes de um bloco PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 017
-- Tempo: 9m
--


-- Comentando o código
-- Função para calcular o valor da média entre dois números

SET SERVEROUTPUT ON
DECLARE
  v_numero_1 NUMBER(13, 2); -- Declaração de variável para o primeiro número
  v_numero_2 NUMBER(13, 2); -- Declaração de variável para o segundo número
  v_media NUMBER(13, 2); -- Declaração de variável para receber a média calculada
BEGIN
  v_numero_1 := 8000;
  v_numero_2 := 4000;
  v_media := (v_numero_1 + v_numero_2) / 2; -- Cálculo da média entre os dois números

  DBMS_OUTPUT.PUT_LINE('Número 1: ' || TO_CHAR(v_numero_1)); -- Impressão do primeiro número
  DBMS_OUTPUT.PUT_LINE('Número 2: ' || TO_CHAR(v_numero_2)); -- Impressão do segundo número
  DBMS_OUTPUT.PUT_LINE('Média: ' || TO_CHAR(v_media)); -- Impressão da média calculada
END;