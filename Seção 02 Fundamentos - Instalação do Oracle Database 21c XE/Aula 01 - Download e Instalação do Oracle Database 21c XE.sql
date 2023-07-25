--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 02 - Instalação do Oracle Database 21c XE
-- Aula: 01 - Download e Instalação do Oracle Database 21c XE
-- Autor: Emílio Scudero
-- Identificador: 002
-- Tempo: 29m
--


-- 1. Acessar o site da Oracle

--    1.1 Selecione o link: http://otn.oracle.com ou https://www.oracle.com/technical-resources

--    1.2 Selecione View Accounts

--    1.3 Selecione Create an Account e complete o seu cadastro

--    Obs.: Se você já possui uma conta Oracle faça o Login, selecione Sign in

-- 2. Efetuar o Download da última versão do Java JDK

--    2.1 Selecione o link: http://otn.oracle.com ou https://www.oracle.com/technical-resources

--    2.2 Selecione Java Downloads

--    2.3 Selecione Java (JDK) for Developers

--    Link: https://www.oracle.com/java/technologies/downloads

--    2.4 Selecione a Tab Windows

--    2.5 Selecione o link X64 MSI Installer ou X64 Installer

--    2.6 Selecione Salvar Arquivo

-- 3. Instalação do Java JDK

--    3.1 Com o botão direito: Selecione o arquivo jdk-17_windows-x64_bi.msi => Instalar

--        Ou

--        Com o botão direito: Selecione o arquivo jdk-17_windows-x64_bi.exe => Executar como Administrador

--    3.2 Aceite as opções default e clique NEXT até concluir a instalação

--    3.3 Configuração das variáveis de ambiente

--        No Windows:
--           Edite a váriável PATH: Adicione o caminho para o diretório bin do Java
--           Crie a variável JAVA_HOME: Informe o caminho para o do Java

-- 4. Efetuar o Download do Oracle Database 21c XE

--    4.1 Selecione o link: http://otn.oracle.com ou https://www.oracle.com/technical-resources

--    4.2 Selecione Database Download

--    4.2 Selecione Database Express Edition

--    4.3 Selecione Download Oracle Database 21c Express Edition for Windows x64

--    4.4 Aceite o Oracle License Agreement

-- 5. Instalação do Oracle Database 21c XE

--    5.1 Mova o arquivo OracleXE213_Win64.zip para o drive C:

--    5.2 Extraia o arquivo para a pasta OracleXE213_Win64

--    5.3 Na pasta OracleXE213_Win64:

--        . Com o botão direito selecione setup.exe Executar como Administrador
--        . Aceite as opções default e clique NEXT até concluir a instalação

--        Obs.: Defina uma senha simples (não use caracteres especiais) para o usuário SYS (DBA), por exemplo: oracle

-- 6. Configurando os Serviços Oracle do Windows para automático

--    6.1 Acesse os serviços do Windows

--    6.2 Configure o serviço OracleServiceXE para automático (default)

--    6.3 Configure o serviço OracleOraDB21Home1TNSListener para automático (default)