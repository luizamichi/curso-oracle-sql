--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 07 - PL/SQL Fundamentos - Sintaxe e diretrizes de um bloco PL/SQL
-- Aula: 03 - Blocos aninhados e escopo de identificadores (variáveis e constantes)
-- Autor: Emílio Scudero
-- Identificador: 019
-- Tempo: 11m
--


-- Escopo de identificadores e blocos aninhados

SET SERVEROUTPUT ON
DECLARE
  vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);

  -- Se você referencia "vBloco2" aqui ocorrerá erro
  DECLARE
    vBloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 2: ' || vBloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);
  -- Se você referencia "vBloco2" aqui ocorrerá erro
END;


-- Escopo de identificadores e blocos aninhados com variáveis que sobrescrevem a declarada no bloco aninhado

SET SERVEROUTPUT ON
DECLARE
  vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);

  -- Se você referencia "vBloco2" aqui ocorrerá erro
  DECLARE
    vBloco1 VARCHAR2(20) := 'Bloco 2';
    vBloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 1 do bloco 2: ' || vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 2 do bloco 2: ' || vBloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || vBloco1);
  -- Se você referencia "vBloco2" aqui ocorrerá erro
END;


-- Identificando blocos através de labels

SET SERVEROUTPUT ON
<<BLOCO1>>
DECLARE
  vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.vBloco1);

  -- Se você referencia "vBloco2" aqui ocorrerá erro
  <<BLOCO2>>
  DECLARE
    vBloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 2: ' || bloco2.vBloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.vBloco1);
  -- Se você referencia "vBloco2" aqui ocorrerá erro
END;


-- Identificando blocos através de labels com variáveis que sobrescrevem a declarada no bloco aninhado

SET SERVEROUTPUT ON
<<BLOCO1>>
DECLARE
  vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.vBloco1);

  -- Se você referencia "vBloco2" aqui ocorrerá erro
  <<BLOCO2>>
  DECLARE
    vBloco1 VARCHAR2(20) := 'Bloco 2';
    vBloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 1 do bloco 2: ' || bloco2.vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 2 do bloco 2: ' || bloco2.vBloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.vBloco1);
  -- Se você referencia "vBloco2" aqui ocorrerá erro
END;