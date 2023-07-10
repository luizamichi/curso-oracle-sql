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

-- Recriando a Procedure para manter o exemplo do Curso

CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO (
  pEmployee_id IN NUMBER,
  pFirst_name OUT NOCOPY VARCHAR2,
  pLast_name OUT NOCOPY VARCHAR2,
  pEmail OUT NOCOPY VARCHAR2,
  pPhone_number OUT NOCOPY VARCHAR2,
  pHire_date OUT NOCOPY DATE,
  pJob_id OUT NOCOPY VARCHAR2,
  pSalary OUT NOCOPY NUMBER,
  pCommission_pct OUT NOCOPY NUMBER,
  pManager_id OUT NOCOPY NUMBER,
  pDepartment_id OUT NOCOPY NUMBER
) IS
BEGIN
  SELECT first_name, last_name, email, phone_number, hire_date,
         job_id, salary, commission_pct, manager_id, department_id
    INTO pFirst_name, pLast_name, pEmail, pPhone_number, pHire_date,
         pJob_id, pSalary, pCommission_pct, pManager_id, pDepartment_id
    FROM employees
   WHERE employee_id = pEmployee_id;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado não existe: ' || PEMPLOYEE_ID);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || SQLERRM);
END;