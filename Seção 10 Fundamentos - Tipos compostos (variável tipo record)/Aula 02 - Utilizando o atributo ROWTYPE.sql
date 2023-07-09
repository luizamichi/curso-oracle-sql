--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 10 - Tipos compostos (variável tipo PL/SQL record)
-- Aula: 02 - Utilizando atributo %ROWTYPE
-- Autor: Emílio Scudero
-- Identificador: 036
-- Tempo: 9m
--


-- Criando um PL/SQL Record utilizando atributo %ROWTYPE

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o ID do empregado: '
DECLARE
  employee_record employees%rowtype;
  vEmployee_id employees.employee_id%type := &pEmployee_id;
BEGIN
  SELECT *
    INTO employee_record
    FROM employees
   WHERE employee_id = vEmployee_id;

  DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' ||
                       employee_record.first_name || ' - ' ||
                       employee_record.last_name || ' - ' ||
                       employee_record.phone_number || ' - ' ||
                       employee_record.job_id);
END;