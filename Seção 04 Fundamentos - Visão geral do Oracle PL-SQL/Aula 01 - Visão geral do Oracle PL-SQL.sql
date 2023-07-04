--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: PL/SQL Fundamentos - Visão geral do Oracle PL/SQL
-- Aula 01 - Visão geral do Oracle PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 011
--


-- Bloco Anônimo - Exemplo

SET SERVEROUTPUT ON
DECLARE
  vTexto VARCHAR2(100) := 'Seja bem vindo ao PL/SQL';
BEGIN
  DBMS_OUTPUT.PUT_LINE(vTexto);
EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;