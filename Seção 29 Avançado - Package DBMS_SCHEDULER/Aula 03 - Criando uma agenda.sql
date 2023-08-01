--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 29 - Package DBMS_SCHEDULER
-- Aula: 03 - Criando uma agenda
-- Autor: Emílio Scudero
-- Identificador: 104
-- Tempo: 11m
--


-- Conectar como SYS

GRANT CREATE JOB TO hr;


-- Criando um schedule (a cada 10 segundos)

BEGIN
  DBMS_SCHEDULER.CREATE_SCHEDULE (
    schedule_name   => 'SCH_A_CADA_10_SEGUNDOS',
    start_date      => SYSTIMESTAMP,
    -- start_date   => TO_TIMESTAMP_TZ('2020-03-17 15:17:36.000000000 AMERICA/SAO_PAULO', 'YYYY-MM-DD HH24:MI:SS.FF TZR'),
    repeat_interval => 'FREQ=SECONDLY;INTERVAL=10',
    end_date        => TO_TIMESTAMP_TZ('2020-07-23 23:00:00.000000000 AMERICA/SAO_PAULO', 'YYYY-MM-DD HH24:MI:SS.FF TZR'),
    comments        => 'A cada 10 segundos'
  );
END;


--Removendo um schedule

BEGIN
  DBMS_SCHEDULER.DROP_SCHEDULE (
    schedule_name => 'SCH_A_CADA_10_SEGUNDOS',
    force         => FALSE
  );
END;


-- Backup da schedule

BEGIN
  DBMS_SCHEDULER.CREATE_SCHEDULE (
    schedule_name   => 'SCH_A_CADA_10_SEGUNDOS',
    start_date      => SYSTIMESTAMP,
    -- start_date   => TO_TIMESTAMP_TZ('2020-03-17 15:17:36.000000000 AMERICA/SAO_PAULO', 'YYYY-MM-DD HH24:MI:SS.FF TZR'),
    repeat_interval => 'FREQ=SECONDLY;INTERVAL=10',
    end_date        => TO_TIMESTAMP_TZ('2020-07-23 23:00:00.000000000 AMERICA/SAO_PAULO', 'YYYY-MM-DD HH24:MI:SS.FF TZR'),
    comments        => 'A cada 10 segundos'
  );
END;


-- Visões para DBMS_SCHEDULE
----------------------------------------------------------------------------------
-- Visão                          -- Descrição                                  --
----------------------------------------------------------------------------------
-- USER_SCHEDULER_JOB_ARGS        -- Argumentos configurados para todos os jobs --
-- USER_SCHEDULER_JOB_LOG         -- Informações de log de todos os jobs        --
-- USER_SCHEDULER_JOB_RUN_DETAILS -- Detalhes de execuções de jobs              --
-- USER_SCHEDULER_JOBS            -- Lista de jobs agendados                    --
-- USER_SCHEDULER_PROGRAM_ARGS    -- Argumentos de todos os programas agendados --
-- USER_SCHEDULER_PROGRAMS        -- Lista dos programas agendados              --
-- USER_SCHEDULER_SCHEDULES       -- Agendamentos pertencentes ao usuário       --
----------------------------------------------------------------------------------