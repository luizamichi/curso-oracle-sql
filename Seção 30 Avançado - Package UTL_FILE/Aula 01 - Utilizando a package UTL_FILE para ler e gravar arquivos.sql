--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 30 - Package UTL_FILE
-- Aula: 01 - Utilizando a package UTL_FILE para ler e gravar arquivos
-- Autor: Emílio Scudero
-- Identificador: 106
-- Tempo: 24m
--


-- Criar o diretorio 'C:\ARQUIVOS' no Windows
-- Conectar como SYS

CREATE OR REPLACE DIRECTORY ARQUIVOS AS 'C:\ARQUIVOS';

GRANT READ, WRITE ON DIRECTORY ARQUIVOS TO hr;


-- Gravando um arquivo texto

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  v_file UTL_FILE.FILE_TYPE;
  CURSOR employees_c IS
    SELECT employee_id, first_name, last_name, job_id, salary
      FROM employees;
BEGIN
  v_file := UTL_FILE.FOPEN('ARQUIVOS', 'employees.txt', 'w', 32767);

  FOR employees_r IN employees_c LOOP
    UTL_FILE.PUT_LINE(v_file, employees_r.employee_id || ';' ||
                              employees_r.first_name || ';' ||
                              employees_r.last_name || ';' ||
                              employees_r.job_id || ';' ||
                              employees_r.salary);
  END LOOP;

  UTL_FILE.FCLOSE(v_file);
  DBMS_OUTPUT.PUT_LINE('Arquivo texto "employees.txt" gerado com sucesso');
EXCEPTION
  WHEN UTL_FILE.INVALID_PATH THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Diretório inválido');
  WHEN UTL_FILE.INVALID_OPERATION THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Operação inválida no arquivo');
  WHEN UTL_FILE.WRITE_ERROR THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Erro de gravação no arquivo');
  WHEN UTL_FILE.INVALID_MODE THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Modo de acesso inválido');
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;


-- Lendo um arquivo texto

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  v_file UTL_FILE.FILE_TYPE;
  v_registro VARCHAR2(400);
BEGIN
  v_file := UTL_FILE.FOPEN('ARQUIVOS', 'employees.txt', 'r', 32767);

  LOOP
    UTL_FILE.GET_LINE(v_file, v_registro);
    DBMS_OUTPUT.PUT_LINE(v_registro);
  END LOOP;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Arquivo texto "employees.txt" lido com sucesso');
  WHEN UTL_FILE.INVALID_PATH THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Diretório inválido');
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;