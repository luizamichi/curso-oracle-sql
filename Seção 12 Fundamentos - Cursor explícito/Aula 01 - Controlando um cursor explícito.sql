--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 12 - Cursor explícito
-- Aula: 01 - Controlando um cursor explícito
-- Autor: Emílio Scudero
-- Identificador: 044
-- Tempo: 26m
--


----------------------------------------------------------------------------------------------------------
-- Tipo      -- Descrição                                                                               --
----------------------------------------------------------------------------------------------------------
-- Implícito -- Cursores implícitos são declarados implicitamente para todos os comandos DML e para     --
--           -- comandos SELECT que retornam somente uma linha                                          --
-- Explícito -- Para consultas que retornam mais de uma linha, um cursor explícito pode ser declarado   --
--           -- e nomeado pelo programador e manipulado através de comandos específicos no bloco PL/SQL --
----------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
-- Método    -- Tipo    -- Tipos de collections                                           --
--------------------------------------------------------------------------------------------
-- %ISOPEN   -- BOOLEAN -- Retorna TRUE se o cursor estiver aberto                        --
-- %NOTFOUND -- BOOLEAN -- Retorna TRUE se o último FETCH não retornou uma linha          --
-- %FOUND    -- BOOLEAN -- Retorna TRUE se o último FETCH retornou uma linha              --
-- %ROWCOUNT -- NUMBER  -- Retorna o número de linhas recuperadas por FETCH até o momento --
--------------------------------------------------------------------------------------------


-- Controlando um cursor explícito com LOOP básico

SET SERVEROUTPUT ON
SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  CURSOR employees_cursor IS
    SELECT *
      FROM employees; -- Declaração do cursor

  employees_record employees_cursor%rowtype;
BEGIN
  OPEN employees_cursor; -- Abre a consulta do cursor

  LOOP -- Loop básico
    FETCH employees_cursor
    INTO employees_record; -- Carrega o registro do cursor para a variável do tipo record

    EXIT WHEN employees_cursor%notfound;

    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' ||
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
  END LOOP;

  CLOSE employees_cursor; -- Fecha o cursor
END;


-- Controlando um cursor explícito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
DECLARE
  CURSOR employees_cursor IS
    SELECT *
      FROM employees; -- Declaração do cursor

  employees_record employees_cursor%rowtype;
BEGIN
  OPEN employees_cursor; -- Abre a consulta do cursor

  FETCH employees_cursor
  INTO employees_record; -- Carrega o registro do cursor para a variável do tipo record

  WHILE employees_cursor%found LOOP
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' ||
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    FETCH employees_cursor
    INTO employees_record;
  END LOOP;

  CLOSE employees_cursor; -- Fecha o cursor
END;