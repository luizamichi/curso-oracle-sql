--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 29 - Package DBMS_SCHEDULER
-- Aula: 04 - Criando um job
-- Autor: Emílio Scudero
-- Identificador: 105
-- Tempo: 14m
--


-- Conectar como SYS

GRANT CREATE JOB TO hr;

BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name      => '"HR"."JOB_INSERE_DATA_AGENDA"',
    program_name  => '"HR"."PRC_INSERE_AGENDA"',
    schedule_name => '"HR"."SCH_A_CADA_10_SEGUNDOS"',
    enabled       => TRUE,
    auto_drop     => FALSE,
    comments      => 'Job Insere Data na Agenda',
    job_style     => 'REGULAR'
  );

  -- DBMS_SCHEDULER.enable(name => '"HR"."JOB_INSERE_DATA_AGENDA"');
END;


-- Consultando a tabela AGENDA

SELECT agenda_id, TO_CHAR(agenda_data, 'DD/MM/YYYY HH24:MI:SS') AGENDA_DATA
  FROM agenda
 ORDER BY agenda_id;


-- Remover o job

BEGIN
  DBMS_SCHEDULER.DROP_JOB (
    job_name => '"HR"."JOB_INSERE_DATA_AGENDA"',
    force    => TRUE
  );
END;