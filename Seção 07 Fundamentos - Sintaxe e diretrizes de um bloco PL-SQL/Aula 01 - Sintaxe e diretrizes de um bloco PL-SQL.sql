--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - PL/SQL Fundamentos - Sintaxe e diretrizes de um bloco PL/SQL
-- Aula: 01 - Sintaxe e diretrizes de um bloco PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 017
-- Tempo: 9m
--


-- Comentando o código
-- Função para calcular o valor da média entre dois números

SET SERVEROUTPUT ON
DECLARE
  vNumero1 NUMBER(13, 2); -- Declaração de variável para o primeiro número
  vNumero2 NUMBER(13, 2); -- Declaração de variável para o segundo número
  vMedia NUMBER(13, 2); -- Declaração de variável para receber a média calculada
BEGIN
  vNumero1 :=  8000;
  vNumero2 :=  4000;
  vMedia := (vNumero1 + vNumero2) / 2; -- Cálculo da média entre os dois números

  DBMS_OUTPUT.PUT_LINE('Número 1 = ' || vNumero1); -- Impressão do primeiro número
  DBMS_OUTPUT.PUT_LINE('Número 2 = ' || vNumero2); -- Impressão do segundo número
  DBMS_OUTPUT.PUT_LINE('Média = ' || vMedia); -- Impressão da média calculada
END;