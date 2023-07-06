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
  vTotal NUMBER(38) := 1;
BEGIN
  <<LOOP1>>
  FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I: ' || TO_CHAR(i));

    <<LOOP2>>
    FOR j IN 1..8 LOOP
      DBMS_OUTPUT.PUT_LINE('J: ' || TO_CHAR(j));
      DBMS_OUTPUT.PUT_LINE('Total: ' || TO_CHAR(vTotal, '99G999G999G999G999G999G999G999D99'));
      vTotal := vTotal * 2;
      -- EXIT LOOP1 WHEN vTotal > 1000000000000000;
    END LOOP;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total final: ' || TO_CHAR(vTotal, '99G999G999G999G999G999G999G999D99'));
END;

-- Utilizando EXIT com label

SET SERVEROUTPUT ON
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  vTotal NUMBER(38) := 1;
BEGIN
  <<LOOP1>>
  FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I: ' || TO_CHAR(i));

    <<LOOP2>>
    FOR j IN 1..8 LOOP
      DBMS_OUTPUT.PUT_LINE('J: ' || TO_CHAR(j));
      DBMS_OUTPUT.PUT_LINE('Total: ' || TO_CHAR(vTotal, '99G999G999G999G999G999G999G999D99'));
      vTotal := vTotal * 2;
      EXIT LOOP1 WHEN vTotal > 1000000000000000;
    END LOOP;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total final: ' || TO_CHAR(vTotal, '99G999G999G999G999G999G999G999D99'));
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
  vContadorLinhas NUMBER(38) := 0;
BEGIN
  <<LOOP1>>
  FOR l IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Linha ' || TO_CHAR(l));
    vContadorLinhas := vContadorLinhas + 1;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total de linhas: ' || vContadorLinhas);
END;

-- Segundo vamos fazer um loop para imprimir todos os números de colunas

SET SERVEROUTPUT ON
DECLARE
  vContadorColunas NUMBER(38) := 0;
BEGIN
  <<LOOP1>>
  FOR c IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Coluna ' || TO_CHAR(c));
    vContadorColunas := vContadorColunas + 1;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total de colunas: ' || vContadorColunas);
END;

-- Terceiro vamos fazer um loop para imprimir todos os números das linhas
--   e dentro deste loop faremos outro loop para imprimir os todos os números de colunas de cada linha

SET SERVEROUTPUT ON
BEGIN
  <<LOOP1>>
  FOR l IN 1..10 LOOP
    <<LOOP2>>
    FOR c IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE('Linha ' || TO_CHAR(l) || ' - Coluna ' || TO_CHAR(c));
    END LOOP;
  END LOOP;
END;