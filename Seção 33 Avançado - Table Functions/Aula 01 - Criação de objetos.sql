--
-- Curso: Oracle PL/SQL Especialista (do básico ao avançado) 2023
-- Seção: 33 - Table Functions
-- Aula: 01 - Criação de objetos
-- Autor: Emílio Scudero
-- Identificador: 115
-- Tempo: 9m
--


-- Criação de objetos no banco de dados

DROP TYPE employees_row;
CREATE TYPE employees_row AS OBJECT (
    e_employee_id    NUMBER(6),
    e_first_name     VARCHAR2(20),
    e_last_name      VARCHAR2(25),
    e_email          VARCHAR2(25),
    e_phone_number   VARCHAR2(20),
    e_hire_date      DATE,
    e_job_id         VARCHAR2(10),
    e_salary         NUMBER(8, 2),
    e_commission_pct NUMBER(2, 2),
    e_manager_id     NUMBER(6, 0),
    e_department_id  NUMBER(4, 0)
);


-- Criação de tabela utilizando tipos no banco de dados
DROP TYPE employees_table;
CREATE TYPE employees_table IS TABLE OF employees_row;


-- Exemplo de orientação a objetos

CREATE OR REPLACE TYPE employee_type AS OBJECT (
  employee_id NUMBER(6),
  first_name VARCHAR2(20),
  last_name VARCHAR2(25),
  email VARCHAR2(20),
  phone_number VARCHAR2(20),
  hire_date DATE,
  job_id NUMBER(10),
  salary NUMBER(8, 2),
  commission_pct NUMBER(2, 2),
  manager_id NUMBER(6),
  department_id NUMBER(4),

  CONSTRUCTOR FUNCTION employee_type (
    p_employee_id NUMBER,
    p_first_name VARCHAR2,
    p_last_name VARCHAR2,
    p_email VARCHAR2,
    p_phone_number VARCHAR2,
    p_hire_date DATE,
    p_salary NUMBER
  ) RETURN SELF AS RESULT,

  MEMBER PROCEDURE increase_salary (p_increase_amount IN NUMBER),
  MEMBER FUNCTION get_full_name RETURN VARCHAR2,
  MEMBER FUNCTION get_age RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY employee_type AS
  CONSTRUCTOR FUNCTION employee_type (
    p_employee_id NUMBER,
    p_first_name VARCHAR2,
    p_last_name VARCHAR2,
    p_email VARCHAR2,
    p_phone_number VARCHAR2,
    p_hire_date DATE,
    p_salary NUMBER
  ) RETURN SELF AS RESULT IS
  BEGIN
    self.employee_id := p_employee_id;
    self.first_name := p_first_name;
    self.last_name := p_last_name;
    self.email := p_email;
    self.phone_number := p_phone_number;
    self.hire_date := p_hire_date;
    self.salary := p_salary;

    RETURN;
  END;

  MEMBER PROCEDURE increase_salary (p_increase_amount IN NUMBER) IS
  BEGIN
    self.salary := self.salary + p_increase_amount;
  END;

  MEMBER FUNCTION get_full_name RETURN VARCHAR2 IS
  BEGIN
    RETURN self.first_name || ' ' || self.last_name;
  END;

  MEMBER FUNCTION get_age RETURN NUMBER IS
    v_months_diff NUMBER;
  BEGIN
    v_months_diff := MONTHS_BETWEEN(SYSDATE, self.hire_date);
    RETURN FLOOR(v_months_diff / 12);
  END;
END;
/

DECLARE
  v_emp employee_type;
BEGIN
  v_emp := employee_type(1, 'John', 'Doe', 'johndoe@mail.com', '1234567890', TO_DATE('18/05/1994', 'DD/MM/YYYY'), 50000);

  DBMS_OUTPUT.PUT_LINE('Full Name: ' || v_emp.get_full_name);
  DBMS_OUTPUT.PUT_LINE('Mail: ' || v_emp.email);
  DBMS_OUTPUT.PUT_LINE('Phone: ' || v_emp.phone_number);
  DBMS_OUTPUT.PUT_LINE('Age: ' || v_emp.get_age);
  DBMS_OUTPUT.PUT_LINE('Old Salary: ' || v_emp.salary);

  v_emp.increase_salary(10000);

  DBMS_OUTPUT.PUT_LINE('New Salary: ' || v_emp.salary);
END;
/
