DECLARE
CURSOR EMPLEADOS IS SELECT employees_32087389.*, departments_32087389.location_id, locations_32087389.city 
                FROM employees_32087389, departments_32087389, locations_32087389 
                WHERE employees_32087389.DEPARTMENT_ID = departments_32087389.department_id
                AND departments_32087389.LOCATION_ID = locations_32087389.location_id
                ORDER BY employees_32087389.employee_id; 
BEGIN
FOR datos_empleado IN EMPLEADOS
LOOP
DBMS_OUTPUT.PUT_LINE ('ID: '|| datos_empleado.EMPLOYEE_ID || ' | ' ||
                          'Nombre: '|| datos_empleado.FIRST_NAME || ' | ' ||
                          'Apellido: '|| datos_empleado.LAST_NAME || ' | ' ||
                          'Email: '|| datos_empleado.EMAIL || ' | ' ||
                          'Teléfono: '|| datos_empleado.PHONE_NUMBER || ' | ' ||
                          'Fecha: '|| datos_empleado.HIRE_DATE || ' | ' ||
                          'Trabajo: '|| datos_empleado.JOB_ID || ' | ' ||
                          'Salario: '|| datos_empleado.SALARY || ' | ' ||
                          'Comisión: '|| datos_empleado.COMMISSION_PCT || ' | ' ||
                          'Localidad: '||datos_empleado.CITY);
END LOOP;
END;