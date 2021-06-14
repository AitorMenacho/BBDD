DECLARE
CURSOR actualizar_comm IS SELECT employees_32087389.* FROM employees_32087389;

BEGIN
FOR datos_empleado IN actualizar_comm
LOOP

    IF datos_empleado.salary > 10000 THEN
        
        UPDATE EMPLOYEES_32087389 SET EMPLOYEES_32087389.COMMISSION_PCT = '0,4'
        WHERE EMPLOYEES_32087389.employee_id = datos_empleado.employee_id;
        
    else                        

        DBMS_OUTPUT.PUT_LINE ('ID: '|| datos_empleado.EMPLOYEE_ID || ' | ' ||
                          'Nombre: '|| datos_empleado.FIRST_NAME || ' | ' ||
                          'Apellido: '|| datos_empleado.LAST_NAME || ' | ' ||
                          'Email: '|| datos_empleado.EMAIL || ' | ' ||
                          'Teléfono: '|| datos_empleado.PHONE_NUMBER || ' | ' ||
                          'Fecha: '|| datos_empleado.HIRE_DATE || ' | ' ||
                          'Trabajo: '|| datos_empleado.JOB_ID || ' | ' ||
                          'Salario: '|| datos_empleado.SALARY || ' | ' ||
                          'Comisión: '|| datos_empleado.COMMISSION_PCT);
    END IF;
END LOOP;
END;