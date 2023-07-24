--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 20 - Database DML Triggers
-- Aula: 06 - Consultando Database DML Triggers pelo dicionário de dados
-- Autor: Emílio Scudero
-- Identificador: 078
-- Tempo: 4m
--


SELECT *
  FROM user_triggers
 WHERE table_name = 'EMPLOYEES'
   AND table_owner = 'HR';