SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE
PROCEDURE IncrementSalary
AS
    INC NUMBER DEFAULT 0;
BEGIN
    FOR i IN (SELECT * FROM instructor) LOOP
        IF i.salary<75000 THEN
            INC:=INC+1;
        END IF;
    END LOOP;
    dbms_output.put_line(INC);
    UPDATE instructor SET salary=1.10*salary WHERE salary<75000;
END;
/

BEGIN
    IncrementSalary;
END;
/