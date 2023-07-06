--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 04 - LOOP básico
-- Autor: Emílio Scudero
-- Identificador: 031
-- Tempo: 6m
--


SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vNumero NUMBER(38) := 1;
  vLimite NUMBER(38) := &pLimite;
BEGIN
  -- Imprimindo números de 1 até o limite
  LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(vNumero));
    EXIT WHEN vNumero = vLimite;
    vNumero := vNumero + 1;
  END LOOP;
END;