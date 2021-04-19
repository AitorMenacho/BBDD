DECLARE
v_empleados  emp%ROWTYPE;
BEGIN
    SELECT *
    INTO v_empleados 
    FROM EMP
    WHERE EMPNO = 7521;
    
    DBMS_OUTPUT.PUT_LINE ('Código:'||v_empleados.empno || ' ' ||
                          'Nombre:'||v_empleados.ENAME || ' ' || 
                          'Trabajo:'|| v_empleados.JOB || ' ' || 
                          'Jefe:'|| v_empleados.MGR || ' ' ||
                          'Contratado:'||v_empleados.HIREDATE || ' ' || 
                          'Salario:'|| v_empleados.sal || ' ' || 
                          'Comisión:'||v_empleados.comm|| ' ' || 
                          'Departamento:'||v_empleados.deptno);
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE ('Cliente no encontrado');
END;