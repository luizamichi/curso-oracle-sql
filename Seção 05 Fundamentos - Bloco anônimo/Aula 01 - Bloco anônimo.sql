--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 05 - Bloco anônimo
-- Aula: 01 - Bloco anônimo
-- Autor: Emílio Scudero
-- Identificador: 012
-- Tempo: 11m
--


SET SERVEROUTPUT ON
DECLARE
  -- Declaração de variáveis
  v_numero1 NUMBER(11, 2) := 2000;
  v_numero2 NUMBER(11, 2) := 5000;
  v_media NUMBER(11, 2);
BEGIN
  -- Cálculo da média
  v_media := (v_numero1 + v_numero2) / 2;

  -- Saída do resultado
  DBMS_OUTPUT.PUT_LINE('Média: ' || v_media);
EXCEPTION
  WHEN OTHERS THEN
    -- Manipulação de erros
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;