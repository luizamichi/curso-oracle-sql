--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 18 - Depurando procedures e functions
-- Aula: 01 - Depurando procedures e functions
-- Autor: Emílio Scudero
-- Identificador: 064
-- Tempo: 18m
--


-- Edite a function FNC_CONSULTA_SALARIO_EMPREGADO

-- Compile a function FNC_CONSULTA_SALARIO_EMPREGADO para DEBUG

-- Tente depurar uma procedure ou funtion, ocorrerá o seguinte erro

/*
  Conectando ao banco de dados hr_XEPDB1.
  Executando PL/SQL: CALL DBMS_DEBUG_JDWP.CONNECT_TCP('127.0.0.1', '52091')
  ORA-01031: privilégios insuficientes
  ORA-06512: em "SYS.DBMS_DEBUG_JDWP", line 68
  ORA-06512: em line 1
  Essa sessão exige os privilégios de usuário DEBUG CONNECT SESSION e DEBUG ANY PROCEDURE.
  Processo encerrado.
  Desconectando do banco de dados hr_XEPDB1.
*/


-- Passando privilégios necessários para o usuário hr poder depurar procedures e functions

/*
  Requisitos necessários para executar o PL/SQL Debuger:

  . Efetuar o GRANT dos privilégios DEBUG CONNECT SESSION e DEBUG ANY PROCEDURE para o usuário que vai depurar a procedure ou function
  . O usuário deve ser o owner ou possuir o privilégio de EXECUTE da procedure ou function a que deseja depurar
  . A procedure ou function deve ser compilada para debug (Compiled for Debug)
*/


-- Conectado como SYS

GRANT DEBUG CONNECT SESSION, DEBUG ANY PROCEDURE TO hr;


-- Tente depurar novamente, ocorrerá o seguinte erro

/*
  Conectando ao banco de dados hr_XEPDB1.
  Executando PL/SQL: CALL DBMS_DEBUG_JDWP.CONNECT_TCP( '127.0.0.1', '52100' )
  ORA-24247: acesso à rede negado pela ACL (access control list)
  ORA-06512: em "SYS.DBMS_DEBUG_JDWP", line 68
  ORA-06512: em line 1
  Processo encerrado.
  Desconectando do banco de dados hr_XEPDB1.
*/


-- Conectado como SYS

/*
  Starting with Oracle 12c, if you want to debug PL/SQL stored procedures in the database through a Java
  Debug Wire Protocol (JDWP)-based debugger, such as SQL Developer or JDeveloper, then you must be granted
  the jdwp ACL privilege to connect your database session to the debugger at a particular host.

  This is one way you can configure network access for JDWP operations:
*/

BEGIN
  DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
    host => '127.0.0.1',
    lower_port => null,
    upper_port => null,
    ace => xs$ace_type(
      privilege_list => xs$name_list('jdwp'),
      principal_name => 'hr',
      principal_type => xs_acl.ptype_db
    )
  );
END;


-- Tente depurar novamente, agora deve funcionar corretamente