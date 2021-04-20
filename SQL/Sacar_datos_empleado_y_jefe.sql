DECLARE
	v_empleados  emp%ROWTYPE;
	v_jefes emp%ROWTYPE;

BEGIN
    SELECT *
    INTO v_empleados
    FROM EMP
    WHERE EMPNO = 7521;
        
    DBMS_OUTPUT.PUT_LINE ('Empleado: ' ||
                          'Código:'||v_empleados.empno || ' ' ||
                          'Nombre:'||v_empleados.ENAME || ' ' || 
                          'Trabajo:'|| v_empleados.JOB || ' ' || 
                          'Jefe:'|| v_empleados.MGR || ' ' ||
                          'Contratado:'||v_empleados.HIREDATE || ' ' || 
                          'Salario:'|| v_empleados.sal || ' ' || 
                          'Comisión:'||v_empleados.comm|| ' ' || 
                          'Departamento:'||v_empleados.deptno);

    IF v_empleados is not null

        THEN 
            SELECT *
            INTO v_jefes
            FROM EMP
            WHERE EMPNO = v_empleados.mgr;

            DBMS_OUTPUT.PUT_LINE ('Empleado: ' ||
                                  'Código:'||v_jefes.empno || ' ' ||
                                  'Nombre:'||v_jefes.ENAME || ' ' || 
                                  'Trabajo:'|| v_jefes.JOB || ' ' || 
                                  'Jefe:'|| v_jefes.MGR || ' ' ||
                                  'Contratado:'||v_jefes.HIREDATE || ' ' || 
                                  'Salario:'|| v_jefes.sal || ' ' || 
                                  'Comisión:'||v_jefes.comm|| ' ' || 
                                  'Departamento:'||v_jefes.deptno);
        
    ELSE

        DBMS_OUTPUT.PUT_LINE ('No tiene jefe');

    END IF;
   
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE ('Cliente no encontrado');
END;