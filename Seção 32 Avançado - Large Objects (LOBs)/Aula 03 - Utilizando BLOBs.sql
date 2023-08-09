--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 32 - LOBs - Large Objects
-- Aula: 03 - Utilizando BLOBs
-- Autor: Emílio Scudero
-- Identificador: 113
-- Tempo: 29m
--


-- Criando tabela com BLOBs

DROP TABLE job_profiles;

CREATE TABLE job_profiles (
  resume_id       NUMBER,
  first_name      VARCHAR2(200),
  last_name       VARCHAR2(200),
  profile_picture BLOB
);


-- Conectar como SYS

CREATE DIRECTORY IMAGENS AS 'C:\Imagens';
GRANT READ, WRITE ON DIRECTORY IMAGENS TO hr;


-- Criar uma pasta C:\Imagens no windows
-- Importando uma imagens de um arquivo binário para uma coluna BLOB

DECLARE
  v_arquivo_origem BFILE;
  v_blob_destino   BLOB;
  v_nome_arquivo   VARCHAR2(100) := 'CursoOracleCompleto.jpeg';
  v_diretorio      VARCHAR2(100) := 'IMAGENS';
BEGIN
  v_arquivo_origem := BFILENAME(v_diretorio, v_nome_arquivo);

  IF DBMS_LOB.FILEEXISTS(v_arquivo_origem) = 1 THEN
    INSERT INTO job_profiles
    VALUES (1, 'Oracle', 'Man', EMPTY_BLOB())
    RETURNING profile_picture INTO v_blob_destino;

    DBMS_LOB.OPEN(v_arquivo_origem, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(v_blob_destino, v_arquivo_origem, DBMS_LOB.GETLENGTH(v_arquivo_origem));
    DBMS_LOB.CLOSE(v_arquivo_origem);

    COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Arquivo: ' || v_nome_arquivo || ' não existe!');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_LOB.CLOSE(v_arquivo_origem);
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;

SELECT *
  FROM job_profiles;


-- Exportando uma imagens a partir de uma coluna BLOB para um arquivo do S.O.

DECLARE
  v_arquivo_destino      UTL_FILE.FILE_TYPE;
  v_buffer               RAW(32767);
  v_quantidade           BINARY_INTEGER := 32767;
  v_posicao              INTEGER := 1;
  v_blob_origem          BLOB;
  v_tamanho_blob         INTEGER;
  v_nome_arquivo_destino VARCHAR2(100) := 'CursoOracleCompletoCopia.jpeg';
  v_diretorio_destino    VARCHAR2(100) := 'IMAGENS';
  v_resume_id            NUMBER := 1;
BEGIN
  SELECT profile_picture
    INTO v_blob_origem
    FROM job_profiles
   WHERE resume_id = v_resume_id
     FOR UPDATE;

  v_tamanho_blob := DBMS_LOB.GETLENGTH(v_blob_origem);
  DBMS_OUTPUT.PUT_LINE('Tamanho do arquivo: ' || v_tamanho_blob);

-- Cria o arquivo binário de destino
  v_arquivo_destino := UTL_FILE.FOPEN(v_diretorio_destino, v_nome_arquivo_destino, 'wb', 32767);

  -- Leitura do BLOB e escrita no arquivo
  WHILE v_posicao < v_tamanho_blob LOOP
    DBMS_LOB.READ(v_blob_origem, v_quantidade, v_posicao, v_buffer);
    UTL_FILE.PUT_RAW(v_arquivo_destino, v_buffer, TRUE);
    v_posicao := v_posicao + v_quantidade;
  END LOOP;

  -- Fecha o arquivo
  UTL_FILE.FCLOSE(v_arquivo_destino);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(v_arquivo_destino) THEN
      UTL_FILE.FCLOSE(v_arquivo_destino);
      RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
    END IF;
END;


-- Exemplo de atualização de uma coluna BLOB

DECLARE
  v_arquivo_origem BFILE;
  v_blob_destino   BLOB;
  v_nome_arquivo   VARCHAR2(100) := 'PLEspecialista.jpg';
  v_diretorio      VARCHAR2(100) := 'IMAGENS';
BEGIN
  v_arquivo_origem := BFILENAME(v_diretorio, v_nome_arquivo);

  IF DBMS_LOB.FILEEXISTS(v_arquivo_origem) = 1 THEN
    SELECT profile_picture
      INTO v_blob_destino
      FROM job_profiles
     WHERE resume_id = 1
       FOR UPDATE;

    DBMS_LOB.OPEN(v_arquivo_origem, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.TRIM(v_blob_destino, 0);
    DBMS_LOB.LOADFROMFILE(v_blob_destino, v_arquivo_origem, DBMS_LOB.GETLENGTH(v_arquivo_origem));
    DBMS_LOB.CLOSE(v_arquivo_origem);

    COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Arquivo: ' || v_nome_arquivo || ' não existe!');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_LOB.CLOSE(v_arquivo_origem);
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;