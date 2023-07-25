--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - Sintaxe e diretrizes de um bloco PL/SQL
-- Aula: 04 - Padrões de codificação sugeridos
-- Autor: Emílio Scudero
-- Identificador: 020
-- Tempo: 9m
--


-- Convenções de codificação
-----------------------------------------------------------------
-- Categoria                             -- Convenção sugerida --
-----------------------------------------------------------------
-- Comandos SQL                          -- Letras maiúsculas  --
-- Palavras-chave                        -- Letras maiúsculas  --
-- Tipos de dado                         -- Letras maiúsculas  --
-- Nomes de identificadores e parâmetros -- Letras minúsculas  --
-- Nomes de tabelas e colunas            -- Letras minúsculas  --
-----------------------------------------------------------------


-- Convenções de nomenclaturas
--------------------------------------------
-- Categoria       -- Convenção           --
--------------------------------------------
-- Variável        -- Prefixo v           --
-- Constante       -- Prefixo c           --
-- Cursor          -- Sufixo _cursor      --
-- Exceção         -- Prefixo e           --
-- Tipo Record     -- Sufixo _record_type --
-- Variável Record -- Sufixo _record      --
-- Parâmetro       -- Prefixo p           --
-- Variável global -- Prefixo g           --
--------------------------------------------


-- Exemplo de uso dos padrões de codificação sugeridos

SET SERVEROUTPUT ON
DECLARE
  v_bloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);

  -- Se você referencia v_bloco2 aqui ocorrerá erro
  DECLARE
    v_bloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 2: ' || v_bloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);
  -- Se você referencia v_bloco2 aqui ocorrerá erro
END;