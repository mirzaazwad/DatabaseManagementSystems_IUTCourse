SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE
PROCEDURE AdvisorHighestStudent(N IN NUMBER)
AS
    MAX_ROW NUMBER;
BEGIN
    SELECT count(*) INTO MAX_ROW FROM (SELECT * FROM (SELECT i_id,count(*)studentCount FROM advisor group by i_id order by studentCount desc)countTable JOIN instructor on countTable.i_id=instructor.ID);
    IF N>=MAX_ROW THEN
        DBMS_OUTPUT.put_line('N exceeds maximum number of records');
        RETURN;
    END IF;
    FOR ROW IN (SELECT * FROM (SELECT * FROM (SELECT i_id,count(*)studentCount FROM advisor group by i_id order by studentCount desc)countTable JOIN instructor on countTable.i_id=instructor.ID) WHERE ROWNUM<=N) LOOP
        DBMS_OUTPUT.PUT_LINE(ROW.ID || ' ' || ROW.name || ' ' || ROW.dept_name || ' ' || ROW.salary || ' ' || ROW.studentCount);
    END LOOP;
END;
/

DECLARE
    N NUMBER;
BEGIN
    N:='&number';
    AdvisorHighestStudent(N);
END;
/