--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 29 - Package DBMS_SCHEDULER
-- Aula: 02 - Criando e habilitando um programa
-- Autor: Emílio Scudero
-- Identificador: 103
-- Tempo: 15m
--


-- Conectar como SYS

GRANT CREATE JOB TO hr;


-- Criação da tabela AGENDA

DROP TABLE agenda;

CREATE TABLE agenda (
  agenda_id   NUMBER,
  agenda_data DATE
);

DROP SEQUENCE agenda_seq;

CREATE SEQUENCE agenda_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOMAXVALUE
NOCYCLE;

CREATE OR REPLACE PROCEDURE prc_insere_data_agenda IS
BEGIN
  INSERT INTO hr.agenda
  VALUES (agenda_seq.NEXTVAL, SYSDATE);
  COMMIT;
END;


-- Criando e habilitado um programa

BEGIN
  DBMS_SCHEDULER.CREATE_PROGRAM (
    program_name        => 'HR.PRC_INSERE_AGENDA',
    program_action      => 'HR.PRC_INSERE_DATA_AGENDA',
    program_type        => 'STORED_PROCEDURE',
    number_of_arguments => 0,
    comments            => 'Insere dados na agenda',
    enabled             => TRUE
  );

  -- DBMS_SCHEDULER.ENABLE(name => 'HR.PRC_INSERE_AGENDA');
END;


-- Removendo um programa

BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM (
    program_name => 'HR.PRC_INSERE_AGENDA',
    force        => TRUE
  );
END;


-- Backup do programa

BEGIN
  DBMS_SCHEDULER.CREATE_PROGRAM (
    program_name        => 'HR.PRC_INSERE_AGENDA',
    program_action      => 'HR.PRC_INSERE_DATA_AGENDA',
    program_type        => 'STORED_PROCEDURE',
    number_of_arguments => 0,
    comments            => 'Insere dados na agenda',
    enabled             => TRUE
  );

  -- DBMS_SCHEDULER.ENABLE(name => 'HR.PRC_INSERE_AGENDA');
END;