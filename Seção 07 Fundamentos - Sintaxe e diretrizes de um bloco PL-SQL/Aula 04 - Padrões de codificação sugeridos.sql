--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - PL/SQL Fundamentos - Sintaxe e diretrizes de um bloco PL/SQL
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
  vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);

  -- Se você referencia vBloco2 aqui ocorrerá erro
  DECLARE
    vBloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 2: ' || vBloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);
  -- Se você referencia vBloco2 aqui ocorrerá erro
END;