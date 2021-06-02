create or replace NONEDITIONABLE PROCEDURE DATOS_POR_NOMBRE 
(
  
  p_nombrempleado emp.ename%TYPE
   
) IS

    v_ename emp.ename%TYPE:=p_nombrempleado;
    v_empleados emp%ROWTYPE;
    v_cuenta int;
    v_total int;

BEGIN

    SELECT COUNT(*)
    INTO v_total
    FROM EMP;
    
    SELECT *
    INTO v_empleados 
    FROM EMP
    WHERE ENAME = v_ename;
    
    DBMS_OUTPUT.PUT_LINE ('Código:'||v_empleados.empno || ' ' ||
                          'Nombre:'||v_empleados.ENAME || ' ' || 
                          'Trabajo:'|| v_empleados.JOB || ' ' || 
                          'Jefe:'|| v_empleados.MGR || ' ' ||
                          'Contratado:'||v_empleados.HIREDATE || ' ' || 
                          'Salario:'|| v_empleados.sal || ' ' || 
                          'Comisión:'||v_empleados.comm|| ' ' || 
                          'Departamento:'||v_empleados.deptno);    
    
EXCEPTION

    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('De entre los '||v_total||' empleados que hay en la base de datos, no hay ninguno con el nombre '||v_ename);
    
    WHEN TOO_MANY_ROWS THEN
        SELECT COUNT(ENAME)
        INTO v_cuenta
        FROM EMP
        WHERE ENAME = v_ename
        GROUP BY ENAME;
        DBMS_OUTPUT.PUT_LINE('De los '||v_total||' registros que hay en la base de datos existen: ' || v_cuenta||' con ese nombre');
END DATOS_POR_NOMBRE;