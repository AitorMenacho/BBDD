create or replace TRIGGER Cambio_De_Comision 
BEFORE UPDATE ON EMPLOYEES_32087389
FOR EACH ROW
BEGIN

    INSERT INTO employees_h_32087389 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, FECHA)
    VALUES (:OLD.EMPLOYEE_ID, :OLD.FIRST_NAME, :OLD.LAST_NAME, :OLD.email, :OLD.phone_number, :OLD.hire_date, :OLD.job_id, :OLD.salary, :OLD.commission_pct, :OLD.manager_id, :OLD.department_id, SYSDATE);

END;