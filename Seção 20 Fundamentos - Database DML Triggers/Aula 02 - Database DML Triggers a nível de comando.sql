--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 20 - Database DML Triggers
-- Aula: 02 - Database DML Triggers a nível de comando
-- Autor: Emílio Scudero
-- Identificador: 074
-- Tempo: 13m
--


-- Database DML Triggers a nível de comando

CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
  BEFORE INSERT ON employees
BEGIN
  IF (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
  TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18) THEN
    RAISE_APPLICATION_ERROR(-20001, 'O cadastramento de empregados só é permitido em dias de semana dentro do horário comercial');
  END IF;
END;


-- Testando a validação da trigger

BEGIN
  PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('George', 'Harrison', 'GHARRISON', '515.258.5690', SYSDATE, 'IT_PROG', 25000, NULL, 103, 60);
  COMMIT;
END;


-- Criando uma trigger combinando vários eventos

CREATE OR REPLACE TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG
  BEFORE INSERT OR UPDATE OR DELETE
  ON employees
BEGIN
  IF (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
  TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18) THEN
    CASE
      WHEN INSERTING THEN
        RAISE_APPLICATION_ERROR(-20001, 'O cadastramento de empregados só é permitido em dias de semana, dentro do horário comercial');
      WHEN DELETING THEN
        RAISE_APPLICATION_ERROR(-20002, 'A deleção de empregados só é permitido em dias de semana, dentro do horário comercial');
      ELSE
        RAISE_APPLICATION_ERROR(-20003, 'A atualização de empregados só é permitido em dias de semana, dentro do horário comercial');
    END CASE;
  END IF;
END;


-- Testando a validação da trigger

BEGIN
  PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('George', 'Harrison', 'GHARRISON', '515.258.5690', SYSDATE, 'IT_PROG', 25000, NULL, 103, 60);
  COMMIT;
END;