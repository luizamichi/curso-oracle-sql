--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 06 - WHILE LOOP
-- Autor: Emílio Scudero
-- Identificador: 033
-- Tempo: 6m
--


SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vNumero NUMBER(38) := 1;
  vLimite NUMBER(38) := &pLimite;
BEGIN
  -- Variáveis inicializadas na seção DECLARE
  WHILE vNumero <= vLimite LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(vNumero));
    vNumero := vNUmero + 1;
  END LOOP;
END;