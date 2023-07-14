--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 14 - Procedures de banco de dados
-- Aula: 06 - Removendo procedures de banco de dados
-- Autor: Emílio Scudero
-- Identificador: 056
-- Tempo: 2m
--


-- Removendo procedure de Banco de Dados

DROP PROCEDURE PRC_CONSULTA_EMPREGADO;


-- Recriando a procedure para manter o exemplo do curso

CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO (
  p_employee_id IN NUMBER,
  p_first_name OUT NOCOPY VARCHAR2,
  p_last_name OUT NOCOPY VARCHAR2,
  p_email OUT NOCOPY VARCHAR2,
  p_phone_number OUT NOCOPY VARCHAR2,
  p_hire_date OUT NOCOPY DATE,
  p_job_id OUT NOCOPY VARCHAR2,
  p_salary OUT NOCOPY NUMBER,
  p_commission_pct OUT NOCOPY NUMBER,
  p_manager_id OUT NOCOPY NUMBER,
  p_department_id OUT NOCOPY NUMBER
) IS
BEGIN
  SELECT first_name, last_name, email, phone_number, hire_date,
         job_id, salary, commission_pct, manager_id, department_id
    INTO p_first_name, p_last_name, p_email, p_phone_number, p_hire_date,
         p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id
    FROM employees
   WHERE employee_id = p_employee_id;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado não existe: ' || p_employee_id);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;