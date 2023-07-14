--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 19 - Packages de banco de dados
-- Aula: 04 - Referenciando componentes de uma package
-- Autor: Emílio Scudero
-- Identificador: 068
-- Tempo: 6m
--


BEGIN
  PKG_EMPREGADOS.PRC_INSERE_EMPREGADO('Bob', 'Dylan', 'BDYLAN', '515.258.4861', SYSDATE, 'IT_PROG', 20000, NULL, 103, 60);
  COMMIT;
END;


BEGIN
  PKG_EMPREGADOS.PRC_INSERE_EMPREGADO('John', 'Lenon', 'JLENON', '515.244.4861', SYSDATE, 'IT_PROG', 15000, NULL, 103, 60);
  COMMIT;
END;