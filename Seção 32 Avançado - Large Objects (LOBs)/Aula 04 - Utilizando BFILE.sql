--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 32 - LOBs - Large Objects
-- Aula: 03 - Utilizando BFILE
-- Autor: Emílio Scudero
-- Identificador: 114
-- Tempo: 10m
--


-- Criando tabela com coluna BFILE

DROP TABLE job_profiles;

CREATE TABLE job_profiles (
  resume_id       NUMBER,
  first_name      VARCHAR2(200),
  last_name       VARCHAR2(200),
  profile_picture BFILE
);

DESC job_profiles


-- Armazenando imagens em uma coluna BFILE

DECLARE
  v_nome_arquivo   VARCHAR2(100) := 'CursoOracleCompleto.jpeg';
  v_diretorio      VARCHAR2(100) := 'IMAGENS';
  v_arquivo_origem BFILE;
BEGIN
  v_arquivo_origem := BFILENAME(v_diretorio, v_nome_arquivo);

  IF DBMS_LOB.FILEEXISTS(v_arquivo_origem) = 1 THEN
    INSERT INTO job_profiles
    VALUES (1, 'Oracle', 'Man', v_arquivo_origem);
    COMMIT;
  END IF;
EXCEPTION
  WHEN others THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;

SELECT *
  FROM job_profiles;