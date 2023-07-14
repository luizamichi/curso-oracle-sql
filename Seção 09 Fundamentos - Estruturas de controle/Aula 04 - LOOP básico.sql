--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 04 - LOOP básico
-- Autor: Emílio Scudero
-- Identificador: 031
-- Tempo: 6m
--


SET SERVEROUTPUT ON
ACCEPT p_limite PROMPT 'Digite o valor do limite: '
DECLARE
  v_numero NUMBER(38) := 1;
  v_limite NUMBER(38) := &p_limite;
BEGIN
  -- Imprimindo números de 1 até o limite
  LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(v_numero));
    EXIT WHEN v_numero = v_limite;
    v_numero := v_numero + 1;
  END LOOP;
END;