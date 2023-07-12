--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 16 - Gerenciando dependências de objetos
-- Aula: 02 - Utilizando as visões DEPTREE e IDEPTREE
-- Autor: Emílio Scudero
-- Identificador: 063
-- Tempo: 11m
--


-- Executando o script UTLDTREE
-- Observação: Substitua o caminho de pastas pelo caminho da sua instalação

@C:\app\Emilio\product\18.0.0\dbhomeXE\rdbms\admin\utldtree.sql


-- Executando a procedure DEPTREE_FILL

EXEC DEPTREE_FILL('TABLE', 'HR', 'EMPLOYEES')


-- Utilizando as visões DEPTREE

DESC deptree

SELECT *
  FROM deptree
 ORDER BY seq#;


-- Utilizando as visões IDEPTREE

DESC ideptree

SELECT *
  FROM ideptree;