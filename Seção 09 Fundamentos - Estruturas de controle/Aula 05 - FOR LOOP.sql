--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 05 - FOR LOOP
-- Autor: Emílio Scudero
-- Identificador: 032
-- Tempo: 9m
--


-- Laço de repetição incremental

SET SERVEROUTPUT ON
ACCEPT p_limite PROMPT 'Digite o valor do limite: '
DECLARE
  v_inicio INTEGER(3) := 1;
  v_fim NUMBER(38) := &p_limite;
BEGIN
  FOR i IN v_inicio..v_fim LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(i));
  END LOOP;
END;


-- Laço de repetição decremental

SET SERVEROUTPUT ON
ACCEPT p_inicio PROMPT 'Digite o valor do inicial: '
DECLARE
  v_inicio NUMBER(38) := &p_inicio;
  v_fim NUMBER(38) := &p_inicio + 10;
BEGIN
  FOR i IN REVERSE v_inicio..v_fim LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(i));
  END LOOP;
END;