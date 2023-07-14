--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 06 - WHILE LOOP
-- Autor: Emílio Scudero
-- Identificador: 033
-- Tempo: 6m
--


SET SERVEROUTPUT ON
ACCEPT p_limite PROMPT 'Digite o valor do limite: '
DECLARE
  v_numero NUMBER(38) := 1;
  v_limite NUMBER(38) := &p_limite;
BEGIN
  -- Variáveis inicializadas na seção DECLARE
  WHILE v_numero <= v_limite LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(v_numero));
    v_numero := v_nUmero + 1;
  END LOOP;
END;