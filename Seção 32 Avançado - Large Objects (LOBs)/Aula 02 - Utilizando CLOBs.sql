--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 32 - LOBs - Large Objects
-- Aula: 02 - Utilizando CLOBs
-- Autor: Emílio Scudero
-- Identificador: 112
-- Tempo: 32m
--


-- Criando tabela com CLOBs

DROP TABLE job_resumes;

CREATE TABLE job_resumes (
  resume_id  NUMBER,
  first_name VARCHAR2(200),
  last_name  VARCHAR2(200),
  resume     CLOB
);

INSERT INTO job_resumes
VALUES (1, 'Paul', 'Jones', EMPTY_CLOB());

COMMIT;

SELECT resume_id, first_name, last_name, SUBSTR(resume, 1, 30)
  FROM job_resumes;

SELECT LENGTH(resume), DBMS_LOB.GETLENGTH(resume)
  FROM job_resumes;

SELECT DBMS_LOB.SUBSTR(resume, DBMS_LOB.GETLENGTH(resume), 1)
  FROM job_resumes;


-- Inserindo dados na coluna CLOB

INSERT INTO job_resumes
VALUES (2, 'Robert', 'Johnson', 'Project Manager - Scrum Master, Porto Alegre, RS, Brasil');

SELECT resume_id, first_name, last_name, SUBSTR(resume, 1, 30)
  FROM job_resumes;

SELECT LENGTH(resume), DBMS_LOB.GETLENGTH(resume)
  FROM job_resumes;

SELECT DBMS_LOB.SUBSTR(resume, DBMS_LOB.GETLENGTH(resume), 1)
  FROM job_resumes;

COMMIT;

CREATE OR REPLACE PROCEDURE prc_insere_resume(p_resume_id IN job_resumes.resume_id%TYPE, p_resume IN VARCHAR2)
IS
  v_resume_localizador CLOB;
  v_tamanho_texto      NUMBER;
  v_deslocamento       NUMBER;
BEGIN
  SELECT resume
    INTO v_resume_localizador
    FROM job_resumes
   WHERE resume_id = p_resume_id
     FOR UPDATE;

  v_deslocamento := 1;
  v_tamanho_texto := LENGTH(p_resume);

  DBMS_LOB.WRITE(v_resume_localizador, v_tamanho_texto, v_deslocamento, p_resume);
  COMMIT;
END;

EXEC prc_insere_resume(1, 'DBA - Database administrator, Porto Alegre, RS, Brasil');

SELECT resume_id, first_name, last_name, SUBSTR(resume, 1, 30)
  FROM job_resumes;

SELECT LENGTH(resume), DBMS_LOB.GETLENGTH(resume)
  FROM job_resumes;

SELECT DBMS_LOB.SUBSTR(resume, DBMS_LOB.GETLENGTH(resume), 1)
  FROM job_resumes;

CREATE OR REPLACE PROCEDURE prc_exibe_resume(p_resume_id IN job_resumes.resume_id%TYPE)
IS
  v_resume_localizador CLOB;
  v_tamanho_texto      NUMBER;
  v_deslocamento       NUMBER;
  v_texto              VARCHAR2(32767);
  v_loop               NUMBER;
  v_quantidade         NUMBER := 1;
  v_exibe              VARCHAR2(240);
BEGIN
  SELECT resume
    INTO v_resume_localizador
    FROM job_resumes
   WHERE resume_id = p_resume_id
     FOR UPDATE;

  v_deslocamento := 1;
  v_tamanho_texto := DBMS_LOB.GETLENGTH(v_resume_localizador);

  DBMS_LOB.READ(v_resume_localizador, v_tamanho_texto, v_deslocamento, v_texto);

  v_loop := TRUNC((LENGTH(v_texto)) / 240) + 1;
  FOR i IN 1 .. v_loop LOOP
    v_exibe := SUBSTR(v_texto, v_quantidade, 240);
    v_quantidade := v_quantidade + 240;
    DBMS_OUTPUT.PUT_LINE(v_exibe);
  END LOOP;
  COMMIT;
END;

CLEAR SCREEN
SET SERVEROUTPUT ON
SET VERIFY OFF

EXEC prc_exibe_resume(1);

EXEC prc_exibe_resume(2);