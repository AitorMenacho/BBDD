CREATE OR REPLACE PROCEDURE DATOS_DE_EMPLEADO 
(
  P_ID employees.employee_id%TYPE
) IS

    V_ID employees.employee_id%TYPE := P_ID;
    V_EMPLEADO EMPLOYEES%ROWTYPE;
    V_DEPARTAMENTO DEPARTMENTS%ROWTYPE;
    V_LOCALIDAD LOCATIONS%ROWTYPE;
    V_REGION REGIONS%ROWTYPE;
    V_PAIS COUNTRIES%ROWTYPE;

BEGIN
  
    SELECT *
    INTO V_EMPLEADO
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = V_ID;
    
    SELECT *
    INTO V_DEPARTAMENTO
    FROM departments
    WHERE department_id = V_EMPLEADO.DEPARTMENT_ID;
    
    SELECT *
    INTO V_LOCALIDAD
    FROM LOCATIONS
    WHERE location_id = V_DEPARTAMENTO.LOCATION_ID;
    
    SELECT *
    INTO V_PAIS
    FROM COUNTRIES
    WHERE country_id = V_LOCALIDAD.COUNTRY_ID;
    
    SELECT *
    INTO V_REGION
    FROM REGIONS
    WHERE REGION_ID = V_PAIS.REGION_ID;
    
    DBMS_OUTPUT.PUT_LINE ('ID: '|| V_EMPLEADO.EMPLOYEE_ID || ' | ' ||
                          'Nombre: '|| V_EMPLEADO.FIRST_NAME || ' | ' ||
                          'Apellido: '|| V_EMPLEADO.LAST_NAME || ' | ' ||
                          'Email: '|| V_EMPLEADO.EMAIL || ' | ' ||
                          'Teléfono: '|| V_EMPLEADO.PHONE_NUMBER || ' | ' ||
                          'Fecha: '|| V_EMPLEADO.HIRE_DATE || ' | ' ||
                          'Trabajo: '|| V_EMPLEADO.JOB_ID || ' | ' ||
                          'Salario: '|| V_EMPLEADO.SALARY || ' | ' ||
                          'Comisión: '|| V_EMPLEADO.COMMISSION_PCT || ' | ' ||
                          'Jefe: '|| V_EMPLEADO.MANAGER_ID || ' | ' ||
                          'Departamento: '|| V_EMPLEADO.DEPARTMENT_ID || ' | ' ||
                          'Localidad: '|| V_LOCALIDAD.CITY || ' | ' ||
                          'País: '|| V_LOCALIDAD.COUNTRY_ID || ' | ' ||
                          'Región: '|| V_REGION.REGION_NAME);    
    
EXCEPTION

    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('NO EXISTE DICHO EMPLEADO ');
  
END DATOS_DE_EMPLEADO;