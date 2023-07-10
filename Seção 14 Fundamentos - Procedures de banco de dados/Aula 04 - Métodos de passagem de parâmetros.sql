--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 14 - Procedures de banco de dados
-- Aula: 04 - Métodos de passagem de parâmetros
-- Autor: Emílio Scudero
-- Identificador: 054
-- Tempo: 6m
--


-- Método posicional

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  employees_record employees%ROWTYPE;
BEGIN
  PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
                         employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
                         employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);

  DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' ||
                       employees_record.last_name || ' - ' ||
                       employees_record.department_id || ' - ' ||
                       employees_record.job_id || ' - ' ||
                       employees_record.phone_number || ' - ' ||
                       LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;


-- Método nomeado

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  vemployee_id    NUMBER := 100;
  vfirst_name     VARCHAR2(200);
  vlast_name      VARCHAR2(200);
  vemail          VARCHAR2(200);
  vphone_number   VARCHAR2(200);
  vhire_date      DATE;
  vjob_id         VARCHAR2(200);
  vsalary         NUMBER;
  vcommission_pct NUMBER;
  vmanager_id     NUMBER;
  vdepartment_id  NUMBER;
BEGIN
  PRC_CONSULTA_EMPREGADO(
    pemployee_id => vemployee_id,
    pfirst_name => vfirst_name,
    plast_name => vlast_name,
    pemail => vemail,
    pphone_number => vphone_number,
    phire_date => vhire_date,
    pjob_id => vjob_id,
    psalary => vsalary,
    pcommission_pct => vcommission_pct,
    pmanager_id => vmanager_id,
    pdepartment_id => vdepartment_id
  );

  DBMS_OUTPUT.PUT_LINE('PFIRST_NAME: ' || vfirst_name);
  DBMS_OUTPUT.PUT_LINE('PLAST_NAME: ' || vlast_name);
  DBMS_OUTPUT.PUT_LINE('PEMAIL: ' || vemail);
  DBMS_OUTPUT.PUT_LINE('PPHONE_NUMBER: ' || vphone_number);
  DBMS_OUTPUT.PUT_LINE('PHIRE_DATE: ' || vhire_date);
  DBMS_OUTPUT.PUT_LINE('PJOB_ID: ' || vjob_id);
  DBMS_OUTPUT.PUT_LINE('PSALARY: ' || vsalary);
  DBMS_OUTPUT.PUT_LINE('PCOMMISSION_PCT: ' || vcommission_pct);
  DBMS_OUTPUT.PUT_LINE('PMANAGER_ID: ' || vmanager_id);
  DBMS_OUTPUT.PUT_LINE('PDEPARTMENT_ID: ' || vdepartment_id);
END;