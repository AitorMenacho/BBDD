create or replace NONEDITIONABLE PROCEDURE ACT1 
(
    P_NOMBRE employees.first_name%TYPE,
    P_APELLIDO employees.last_name%TYPE,
    P_EMAIL employees.email%TYPE,
    P_NUMERO employees.phone_number%TYPE,
    P_FECHA employees.hire_date%TYPE,
    P_TRABAJO jobs.job_title%TYPE,
    P_SALARIO employees.salary%TYPE,
    P_COMISION employees.commission_pct%TYPE,
    P_JEFE employees.first_name%TYPE,
    P_JEFE_APELLIDO employees.last_name%TYPE,
    P_DEPARTAMENTO departments.department_name%TYPE
) AS 

    V_TELEFONO      employees.phone_number%TYPE;
    V_JEFE          employees.employee_id%TYPE;
    V_TRABAJO       jobs.job_id%TYPE;
    V_DEPARTAMENTO  departments.department_id%TYPE;

BEGIN
  
    SELECT EMPLOYEE_ID
    INTO V_JEFE
    FROM EMPLOYEES
    WHERE P_JEFE = FIRST_NAME
    AND P_JEFE_APELLIDO = LAST_NAME;
    
    SELECT JOB_ID
    INTO V_TRABAJO
    FROM JOBS
    WHERE P_TRABAJO = job_title;
    
    BEGIN 
     
    SELECT DEPARTMENT_ID
    INTO V_DEPARTAMENTO
    FROM departments
    WHERE p_departamento = department_name;
  
    EXCEPTION

    WHEN NO_DATA_FOUND THEN
  
    DBMS_OUTPUT.PUT_LINE('Departamento desconocido');
  
    END;
  
    BEGIN
    
  
    SELECT phone_number
    INTO V_TELEFONO
    FROM EMPLOYEES
    WHERE P_NUMERO = PHONE_NUMBER;
    
    EXCEPTION
  
    
  
    WHEN NO_DATA_FOUND THEN

    INSERT INTO employees (employee_id,first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
    VALUES
    (
    
    EMPLOYEES_SEQ.nextval,
    P_NOMBRE,
    P_APELLIDO,
    P_EMAIL,
    P_NUMERO,
    SYSDATE,
    V_TRABAJO,
    P_SALARIO,
    P_COMISION,
    V_JEFE,
    V_DEPARTAMENTO
    
    );
    
    DBMS_OUTPUT.put_line('Trabajador no encontrado se procede a insertar');
    
    END;
    
    UPDATE EMPLOYEES SET
    
    FIRST_NAME = P_NOMBRE,
    LAST_NAME = P_APELLIDO,
    EMAIL = P_EMAIL,
    PHONE_NUMBER = P_NUMERO,
    HIRE_DATE = P_FECHA,
    JOB_ID = V_TRABAJO,
    SALARY = P_SALARIO,
    COMMISSION_PCT = P_COMISION,
    MANAGER_ID = V_JEFE,
    DEPARTMENT_ID = V_DEPARTAMENTO
    WHERE PHONE_NUMBER = P_NUMERO;
    
    DBMS_OUTPUT.put_line('Este trabajador ya existe así que se procede a actualizar');
  
    
  
END ACT1;


------- Ejecución --------------

DECLARE

    P_NOMBRE employees.first_name%TYPE := 'Neena' ;
    P_APELLIDO employees.last_name%TYPE := 'Kochhar' ;
    P_EMAIL employees.email%TYPE := 'NKOCHHAR' ;
    P_NUMERO employees.phone_number%TYPE := '515.123.4568' ;
    P_FECHA employees.hire_date%TYPE := '21/09/05' ;
    P_TRABAJO jobs.job_title%TYPE := 'Administration Vice President' ;
    P_SALARIO employees.salary%TYPE := 17000 ;
    P_COMISION employees.commission_pct%TYPE := 0 ;
    P_JEFE employees.first_name%TYPE := 'Steven' ;
    P_JEFE_APELLIDO employees.last_name%TYPE := 'King' ;
    P_DEPARTAMENTO departments.department_name%TYPE := 'Executive' ;

BEGIN

    ACT1(P_NOMBRE,P_APELLIDO,P_EMAIL,P_NUMERO,P_FECHA,P_TRABAJO,P_SALARIO,P_COMISION,P_JEFE,P_JEFE_APELLIDO,P_DEPARTAMENTO);

END;