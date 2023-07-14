--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 11 - Tipos compostos (collections)
-- Aula: 07 - Utilizando métodos para controlar Collections
-- Autor: Emílio Scudero
-- Identificador: 043
-- Tempo: 5m
--


-------------------------------------------------------------------------------------------------------------------------------------
-- Método    -- Descrição                                                                    -- Tipos de Collections               --
-------------------------------------------------------------------------------------------------------------------------------------
-- EXISTS(n) -- Retorna TRUE se o elemento n existe                                           -- Todos                             --
-- COUNT     -- Retorna o número de elementos                                                 -- Todos                             --
-- FIRST     -- Retorna o primeiro número do índice. Retorna NULL se a collection está vazia  -- Todos                             --
-- LAST      -- Retorna o último número do índice. Retorna NULL se a collection está vazia    -- Todos                             --
-- LIMIT     -- Retorna o maior possível do índice                                            -- Varray                            --
-- PRIOR(n)  -- Retorna o número do índice anterior a n                                       -- Todos                             --
-- NEXT(n)   -- Retorna o número do índice posterior a n                                      -- Todos                             --
-- EXTEND(n) -- Para aumentar o tamanho. EXTEND adiciona um elemento nulo. EXTEND(n) adiciona -- Nested, table e varray            --
--           -- n elementos nulos. EXTEND(n, i) adiciona n cópias do elemento i               --                                   --
-- TRIM      -- Remove um elemento do final da collection. TRIM(n) remove n elementos do      -- Nested table                      --
--           -- final da collection                                                           --                                   --
-- DELETE    -- DELETE remove todos os elementos de uma collection. DELETE(n) remove o        -- Associative array ou nested table --
--           -- elemento n da collection. DELETE(m, n) remove todos os elementos na faixa     --                                   --
--           -- m..n da collection                                                            --                                   --
-------------------------------------------------------------------------------------------------------------------------------------


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE employees_table_type IS TABLE OF employees%ROWTYPE;
  employees_table employees_table_type := employees_table_type();
BEGIN
  SELECT *
    BULK COLLECT INTO employees_table
    FROM employees;

  FOR i IN employees_table.first..employees_table.last
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary, '99G999G999D99'));
  END LOOP;
END;