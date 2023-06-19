create or replace
--v4final
PROCEDURE proc_emp_cursor is
  CURSOR c_emp_cursor IS 
   SELECT empno, ename FROM emp
   WHERE deptno =30;
  v_empno emp.empno%TYPE;
  v_lname emp.ename%TYPE;
BEGIN  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO v_empno, v_lname;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( v_empno ||'  '||v_lname);  
  END LOOP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('The query did not return a result');
END;
/