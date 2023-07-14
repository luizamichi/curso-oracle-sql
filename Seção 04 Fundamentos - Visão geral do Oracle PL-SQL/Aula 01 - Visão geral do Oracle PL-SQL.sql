--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 04 - PL/SQL Fundamentos - Visão geral do Oracle PL/SQL
-- Aula: 01 - Visão geral do Oracle PL/SQL
-- Autor: Emílio Scudero
-- Identificador: 011
-- Tempo: 36m
--


-- Exemplo de definição de um bloco de código anônimo no PL/SQL

SET SERVEROUTPUT ON
DECLARE
  -- Declaração de variáveis
  v_texto VARCHAR2(100) := 'Seja bem-vindo ao PL/SQL';
BEGIN
  -- Ativação da saída do servidor
  DBMS_OUTPUT.PUT_LINE(v_texto);
EXCEPTION
  WHEN OTHERS THEN
    -- Manipulação de erros
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;