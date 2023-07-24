--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 20 - Database DML Triggers
-- Aula: 05 - Desabilitando e habilitando Database DML Triggers
-- Autor: Emílio Scudero
-- Identificador: 077
-- Tempo: 4m
--


-- Desabilitando Database DML Triggers

ALTER TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG disable;


-- Habilitando Database DML Triggers

ALTER TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG enable;


-- Desabilitando todas Database DML Triggers da tabela employees

ALTER TABLE employees DISABLE ALL TRIGGERS;


-- Habilitando todas Database DML Triggers da tabela employees

ALTER TABLE employees ENABLE ALL TRIGGERS;