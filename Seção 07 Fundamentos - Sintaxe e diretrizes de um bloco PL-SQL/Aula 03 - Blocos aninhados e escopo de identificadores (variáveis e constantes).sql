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
  v_bloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);

  -- Se você referencia "v_bloco2" aqui ocorrerá erro
  DECLARE
    v_bloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 2: ' || v_bloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);
  -- Se você referencia "v_bloco2" aqui ocorrerá erro
END;


-- Escopo de identificadores e blocos aninhados com variáveis que sobrescrevem a declarada no bloco aninhado

SET SERVEROUTPUT ON
DECLARE
  v_bloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);

  -- Se você referencia "v_bloco2" aqui ocorrerá erro
  DECLARE
    -- Não é uma boa prática declarar "v_bloco1" aqui, pois pertence ao espoco externo
    -- Mas como exemplo, vemos que o valor obedece ao escopo interno
    -- Recomenda-se utilizar outro nome, exemplo: "v_bloco1_inner"
    v_bloco1 VARCHAR2(20) := 'Bloco 2';
    v_bloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 1 do bloco 2: ' || v_bloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 2 do bloco 2: ' || v_bloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || v_bloco1);
  -- Se você referencia "v_bloco2" aqui ocorrerá erro
END;


-- Identificando blocos através de labels

SET SERVEROUTPUT ON
<<bloco1>>
DECLARE
  v_bloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.v_bloco1);

  -- Se você referencia "v_bloco2" aqui ocorrerá erro
  <<bloco2>>
  DECLARE
    v_bloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.v_bloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 2: ' || bloco2.v_bloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.v_bloco1);
  -- Se você referencia "v_bloco2" aqui ocorrerá erro
END;


-- Identificando blocos através de labels com variáveis que sobrescrevem a declarada no bloco aninhado

SET SERVEROUTPUT ON
<<bloco1>>
DECLARE
  v_bloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.v_bloco1);

  -- Se você referencia "v_bloco2" aqui ocorrerá erro
  <<bloco2>>
  DECLARE
    v_bloco1 VARCHAR2(20) := 'Bloco 2';
    v_bloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.v_bloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 1 do bloco 2: ' || bloco2.v_bloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando variável 2 do bloco 2: ' || bloco2.v_bloco2);
  END;

  DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco 1: ' || bloco1.v_bloco1);
  -- Se você referencia "v_bloco2" aqui ocorrerá erro
END;