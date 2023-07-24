--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 20 - Database DML Triggers
-- Aula: 03 - Database DML Triggers a nível de linha
-- Autor: Emílio Scudero
-- Identificador: 075
-- Tempo: 27m
--


-- Criando a tabela de log de auditoria para a tabela EMPLOYEES para a coluna SALARY

DROP TABLE employees_log;

CREATE TABLE employees_log (
  employees_log_id NUMBER (11) NOT NULL,
  dt_log DATE DEFAULT SYSDATE NOT NULL,
  usuario VARCHAR2(30),
  evento CHAR(1) NOT NULL,
  employee_id NUMBER(6) NOT NULL,
  salary_old NUMBER(8, 2),
  salary_new NUMBER(8, 2)
);

ALTER TABLE employees_log
ADD CONSTRAINT employees_log_pk PRIMARY KEY (employees_log_id);

CREATE SEQUENCE employees_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;


-- Criando uma trigger que gera log de auditoria para a Tabela EMPLOYEES para a coluna SALARY

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYESS_R_TRG
  AFTER INSERT OR UPDATE OF salary OR DELETE
  ON EMPLOYEES
  FOR EACH ROW
DECLARE
  v_evento      employees_log.evento%TYPE;
  v_employee_id employees_log.employee_id%TYPE;
BEGIN
  CASE
    WHEN INSERTING THEN
      v_evento      := 'I';
      v_employee_id := :new.employee_id;
    WHEN UPDATING THEN
      v_evento      := 'U';
      v_employee_id := :new.employee_id;
    ELSE
      v_evento      := 'D';
      v_employee_id := :old.employee_id;
  END CASE;

  INSERT INTO employees_log (
    employees_log_id,
    dt_log,
    usuario,
    evento,
    employee_id,
    salary_old,
    salary_new
  ) VALUES (
    employees_log_seq.NEXTVAL,
    SYSDATE,
    USER,
    v_evento,
    v_employee_id,
    :old.salary,
    :new.salary
  );
END A_IUD_EMPLOYESS_R_TRG;


-- Testando o disparo da trigger

UPDATE employees
   SET salary = salary * 1.5;


-- Desabilitando a trigger B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG para poder testar a trigger fora do horário comercial

ALTER TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG DISABLE;


-- Testando a trigger

UPDATE employees
   SET salary = salary * 1.5;


-- Consultando a tabela EMPLOYEES_LOG

SELECT *
  FROM employees_log;


-- Limpando a tabela de logs

DELETE FROM employees_log;

COMMIT;

SELECT *
  FROM employees_log;


-- Cláusula WHEN

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYESS_R_TRG
  AFTER INSERT OR UPDATE OF SALARY OR DELETE
  ON EMPLOYEES
  FOR EACH ROW
  WHEN (new.job_id <> 'AD_PRES')
DECLARE
  v_evento      employees_log.evento%TYPE;
  v_employee_id employees_log.employee_id%TYPE;
BEGIN
  CASE
    WHEN INSERTING THEN
      v_evento      := 'I';
      v_employee_id := :new.employee_id;
    WHEN UPDATING THEN
      v_evento      := 'U';
      v_employee_id := :new.employee_id;
    ELSE
      v_evento      := 'D';
      v_employee_id := :old.employee_id;
  END CASE;

  INSERT INTO employees_log (
    employees_log_id,
    dt_log,
    usuario,
    evento,
    employee_id,
    salary_old,
    salary_new
  ) VALUES (
    employees_log_seq.NEXTVAL,
    SYSDATE,
    USER,
    v_evento,
    v_employee_id,
    :old.salary,
    :new.salary
  );
END A_IUD_EMPLOYESS_R_TRG;


-- Testando a trigger

UPDATE employees
   SET salary = salary * 1.5;

SELECT *
  FROM employees_log;

COMMIT;