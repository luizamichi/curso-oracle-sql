--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 06 - Declaração de identificadores, variáveis e constantes
-- Aula: 04 - Variável Bind
-- Autor: Emílio Scudero
-- Identificador: 016
-- Tempo: 7m
--


-- Utilizando variável bind

SET SERVEROUTPUT ON
VARIABLE g_media NUMBER
DECLARE
  v_numero1 NUMBER(11, 2) := 2000;
  v_numero2 NUMBER(11, 2) := 5000;
BEGIN
  :g_media := (v_numero1 + v_numero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Média: ' || TO_CHAR(:g_media));
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;