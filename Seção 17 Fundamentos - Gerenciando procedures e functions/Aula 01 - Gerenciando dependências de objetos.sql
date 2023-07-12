--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 16 - Gerenciando dependências de objetos
-- Aula: 01 - Gerenciando dependências de objetos
-- Autor: Emílio Scudero
-- Identificador: 062
-- Tempo: 17m
--


-- Consultando dependências diretas dos objetos do seu schema utilizando a visão USER_DEPENDENCIES

DESC user_dependencies

SELECT *
  FROM user_dependencies
 WHERE referenced_name = 'EMPLOYEES'
   AND referenced_type = 'TABLE';


-- Consultando dependências diretas e indiretas dos objetos do seu schema utilizando a visão USER_DEPENDENCIES

SELECT *
  FROM user_dependencies
 START WITH referenced_name = 'EMPLOYEES' AND referenced_type = 'TABLE'
CONNECT BY PRIOR name = referenced_name AND type = referenced_type;


-- Consultando dependências diretas e indiretas dos objetos de todos schemas utilizando a visão DBA_DEPENDENCIES

-- Conecte-se como SYS

DESC DBA_DEPENDENCIES

SELECT *
  FROM dba_dependencies
 START WITH referenced_owner = 'HR' AND referenced_name = 'EMPLOYEES' AND referenced_type = 'TABLE'
CONNECT BY PRIOR owner = referenced_owner AND name = referenced_name AND type = referenced_type;


-- Consultando objetos inválidos do schema do seu usuário

DESC USER_OBJECTS

SELECT object_name, object_type, last_ddl_time, timestamp, status
  FROM user_objects
 WHERE status = 'INVALID';