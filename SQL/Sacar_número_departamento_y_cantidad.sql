create or replace NONEDITIONABLE PROCEDURE DEVOLVERCODDEPT 
(

   p_nadept dept.dname%TYPE

) IS 

v_nadept dept.dname%type:=p_nadept;
v_departamento dept%ROWTYPE;
v_cuenta int;

BEGIN
    SELECT *
    INTO v_departamento
    FROM DEPT
    WHERE DNAME = v_nadept;
    
    DBMS_OUTPUT.PUT_LINE ('Departamento: '||v_departamento.dname || ' ' ||
                          'Código: '||v_departamento.deptno);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('Departamento no existe');
    WHEN TOO_MANY_ROWS THEN
        SELECT COUNT(dname) INTO v_cuenta
        FROM dept
        WHERE dname=v_nadept;
        DBMS_OUTPUT.PUT_LINE ('Departamento: '||v_departamento.dname || ' ' ||
                              'tiene: '||v_cuenta);
  NULL;
END DEVOLVERCODDEPT;