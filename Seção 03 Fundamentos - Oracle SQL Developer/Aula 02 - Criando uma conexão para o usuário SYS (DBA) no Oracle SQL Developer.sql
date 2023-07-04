--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: PL/SQL Fundamentos - Download e instalação do Oracle SQL Developer
-- Aula: 02 - Criando uma conexão para o usuário SYS (DBA) no Oracle SQL Developer
-- Autor: Emílio Scudero
-- Identificador: 005
--


-- 1. Criando uma conexão para o usuário SYS (dba) no Oracle SQL Developer

--    1.1 No SQL Developer
--        Com o botão direito, selecione Oracle Conexões => Selecione Nova Conexão

--        Name: sys_XEPDB1
--        Nome do usuário: sys
--        Senha: oracle (senha que você definiu para os usuários sys e system na instalação)
--        Atribuição: SYSDBA

--        Tipo de conexão: Básico
--        Nome do host: localhost
--        Porta: 1521
--        Nome do Serviço: XEPDB1

--        Clique em Testar
--        Clique em Salvar
--        Clique em Conectar, informe a senha do SYS
--        Clique OK

-- 2. Executando um comando na Área de Trabalho

--    2.1 Execute o comando:

--        SELECT SYSDATE
--          FROM DUAL;

--    2.2 Desconecte