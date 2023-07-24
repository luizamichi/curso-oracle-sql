--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 15 - Funções de banco de dados
-- Aula: 02 - Utilizando funções em comandos SQL
-- Autor: Emílio Scudero
-- Identificador: 058
-- Tempo: 10m
--


-- Utilizando funções em comandos SQL

CREATE OR REPLACE FUNCTION fnc_consulta_titulo_cargo_empregado (
  p_job_id IN jobs.job_id%TYPE
) RETURN VARCHAR2 IS
  v_job_title jobs.job_title%TYPE;
BEGIN
  SELECT job_title
    INTO v_job_title
    FROM jobs
   WHERE job_id = p_job_id;

  RETURN (v_job_title);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Job inexistente');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Utilizando funções em comandos SQL

SELECT employee_id, first_name, last_name, job_id,
       fnc_consulta_titulo_cargo_empregado(job_id) "JOB TITLE"
  FROM employees;


-- Executando a função pelo comando SELECT

SELECT fnc_consulta_titulo_cargo_empregado('IT_PROG')
  FROM DUAL;


-- Executando a função pelo comando SELECT

SELECT fnc_consulta_salario_empregado(130)
  FROM DUAL;