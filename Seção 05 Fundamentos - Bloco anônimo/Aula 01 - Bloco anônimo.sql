--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 05 - PL/SQL Fundamentos - Bloco anônimo
-- Aula: 01 - Bloco anônimo
-- Autor: Emílio Scudero
-- Identificador: 012
-- Tempo: 11m
--


SET SERVEROUTPUT ON
DECLARE
  vNumero1 NUMBER(11, 2) := 2000;
  vNumero2 NUMBER(11, 2) := 5000;
  vMedia NUMBER(11, 2);
BEGIN
  vMedia := (vNumero1 + vNumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Média: ' || vMedia);
EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;