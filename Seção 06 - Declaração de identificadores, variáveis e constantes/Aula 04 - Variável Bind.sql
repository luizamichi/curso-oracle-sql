--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: PL/SQL Fundamentos - Declaração de identificadores, variáveis e constantes
-- Aula: 04 - Variável Bind
-- Autor: Emílio Scudero
-- Identificador: 016
--


-- Utilizando variável bind

SET SERVEROUTPUT ON
VARIABLE gMedia NUMBER
DECLARE
  vNumero1 NUMBER(11, 2) := 2000;
  vNumero2 NUMBER(11, 2) := 5000;
BEGIN
  :gMedia := (vNumero1 + vNumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Média = ' || TO_CHAR(:gMedia));
EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;