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
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vInicio INTEGER(3) := 1;
  vFim NUMBER(38) := &pLimite;
BEGIN
  FOR i IN vInicio..vFim LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(i));
  END LOOP;
END;

-- Laço de repetição decremental

SET SERVEROUTPUT ON
ACCEPT pInicio PROMPT 'Digite o valor do inicial: '
DECLARE
  vInicio NUMBER(38) := &pInicio;
  vFim NUMBER(38) := &pInicio + 10;
BEGIN
  FOR i IN REVERSE vInicio..vFim LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || TO_CHAR(i));
  END LOOP;
END;