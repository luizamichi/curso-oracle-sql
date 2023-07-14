--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 16 - Gerenciando procedures e functions
-- Aula: 01 - Gerenciando procedures e functions
-- Autor: Emílio Scudero
-- Identificador: 061
-- Tempo: 18m
--


-- Consultando objetos do tipo procedure e function do seu usuário

DESC USER_OBJECTS

SELECT object_name, object_type, last_ddl_time, timestamp, status
  FROM user_objects
 WHERE object_type IN ('PROCEDURE', 'FUNCTION');

SELECT object_name, object_type, last_ddl_time, timestamp, status
  FROM all_objects
 WHERE object_type IN ('PROCEDURE', 'FUNCTION');


-- Consultando objetos inválidos do schema do seu usuário

DESC USER_OBJECTS

SELECT object_name, object_type, last_ddl_time, timestamp, status
  FROM user_objects
 WHERE status = 'INVALID';


-- Consultando o código fonte de procedimentos e funções do seu usuário

DESC user_source

SELECT line, text
  FROM user_source
 WHERE name = 'PRC_INSERE_EMPREGADO'
   AND type = 'PROCEDURE'
 ORDER BY line;

SELECT line, text
  FROM user_source
 WHERE name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
   AND type = 'FUNCTION'
 ORDER BY line;


-- Consultando a lista de parâmetros de procedimentos e Funções

DESC PRC_INSERE_EMPREGADO

DESC FNC_CONSULTA_SALARIO_EMPREGADO


-- Forçando um erro de compilação

CREATE OR REPLACE FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO (
  p_employee_id IN NUMBER
) RETURN NUMBER IS
  v_salary employees.salary%TYPE;
BEGIN
  SELECT salary
    INTO v_salary
    FROM employees
   WHERE employee_id = p_employee_id;

  RETURN v_salary;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || ' ' || SQLERRM);
END;


-- Consultando erros de compilação - Comando SHOW ERRORS

SHOW ERRORS PROCEDURE FNC_CONSULTA_SALARIO_EMPREGADO


-- Consultando erros de compilação - Visão USER_ERRORS

DESC user_errors

COLUMN position FORMAT a4
COLUMN text FORMAT a60
SELECT line || '/' || position position, text
  FROM user_errors
 WHERE name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
 ORDER BY line;