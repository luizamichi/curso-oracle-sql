--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 14 - Procedures de banco de dados
-- Aula: 02 - Utilizando parâmetros tipo IN
-- Autor: Emílio Scudero
-- Identificador: 052
-- Tempo: 12m
--


CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO (
  p_employee_id IN NUMBER,
  p_percentual IN NUMBER
) IS
-- Nenhuma váriável declarada
BEGIN
  UPDATE employees
     SET salary = salary * (1 + p_percentual / 100)
   WHERE employee_id = p_employee_id;

EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;


-- Executando a procedure pelo bloco PL/SQL

BEGIN
  PRC_AUMENTA_SALARIO_EMPREGADO(109, 10);
  COMMIT;
END;


-- Validando se o valor for alterado

SELECT *
  FROM employees
 WHERE employee_id = 109;