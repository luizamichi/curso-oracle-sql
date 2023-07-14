--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 09 - Estruturas de controle
-- Aula: 07 - Controlando LOOPs aninhados
-- Autor: Emílio Scudero
-- Identificador: 034
-- Tempo: 11m
--


-- Controlando LOOPs aninhados

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  v_total NUMBER(38) := 1;
BEGIN
  <<loop1>>
  FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I: ' || TO_CHAR(i));

    <<loop2>>
    FOR j IN 1..8 LOOP
      DBMS_OUTPUT.PUT_LINE('J: ' || TO_CHAR(j));
      DBMS_OUTPUT.PUT_LINE('Total: ' || TO_CHAR(v_total, '99G999G999G999G999G999G999G999D99'));
      v_total := v_total * 2;
      -- EXIT LOOP1 WHEN v_total > 1000000000000000;
    END LOOP;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total final: ' || TO_CHAR(v_total, '99G999G999G999G999G999G999G999D99'));
END;


-- Utilizando EXIT com label

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  v_total NUMBER(38) := 1;
BEGIN
  <<loop1>>
  FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I: ' || TO_CHAR(i));

    <<loop2>>
    FOR j IN 1..8 LOOP
      DBMS_OUTPUT.PUT_LINE('J: ' || TO_CHAR(j));
      DBMS_OUTPUT.PUT_LINE('Total: ' || TO_CHAR(v_total, '99G999G999G999G999G999G999G999D99'));
      v_total := v_total * 2;
      EXIT LOOP1 WHEN v_total > 1000000000000000;
    END LOOP;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total final: ' || TO_CHAR(v_total, '99G999G999G999G999G999G999G999D99'));
END;


-- Controlando LOOPs aninhados

-- Imagine um quadrado com 10 linhas e 10 colunas
-- Imprima todas as combinações possíveis de número de linhas e número de colunas
-- Exemplo:
--   Linha 1 - Coluna 1
--   Linha 1 - Coluna 2
--   Linha 1 - Coluna 3
--   ...

-- Vamos resolver em partes

-- Primeiro vamos fazer um loop para imprimir todos os números de linhas

SET SERVEROUTPUT ON
DECLARE
  v_contador_linhas NUMBER(38) := 0;
BEGIN
  <<loop1>>
  FOR l IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Linha ' || TO_CHAR(l));
    v_contador_linhas := v_contador_linhas + 1;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total de linhas: ' || v_contador_linhas);
END;


-- Segundo vamos fazer um loop para imprimir todos os números de colunas

SET SERVEROUTPUT ON
DECLARE
  v_contador_colunas NUMBER(38) := 0;
BEGIN
  <<loop1>>
  FOR c IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Coluna ' || TO_CHAR(c));
    v_contador_colunas := v_contador_colunas + 1;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total de colunas: ' || v_contador_colunas);
END;


-- Terceiro vamos fazer um loop para imprimir todos os números das linhas
--   e dentro deste loop faremos outro loop para imprimir os todos os números de colunas de cada linha

SET SERVEROUTPUT ON
BEGIN
  <<loop1>>
  FOR l IN 1..10 LOOP
    <<loop2>>
    FOR c IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE('Linha ' || TO_CHAR(l) || ' - Coluna ' || TO_CHAR(c));
    END LOOP;
  END LOOP;
END;