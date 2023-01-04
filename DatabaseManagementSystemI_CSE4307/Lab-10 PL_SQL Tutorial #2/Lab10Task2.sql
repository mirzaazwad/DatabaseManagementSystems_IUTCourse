SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE
PROCEDURE PRINT_TIME_SLOT
AS
BEGIN
    
    FOR ROW IN (SELECT I.ID AS ID,I.NAME AS NAME,T.TIME_SLOT_ID AS TIME_SLOT_ID, T.DAY AS DAY, T.start_hr AS start_hr, T.start_min AS start_min ,T.end_hr AS end_hr, T.end_min AS end_min FROM INSTRUCTOR I, TEACHES TE, SECTION S,TIME_SLOT T WHERE I.ID = TE.ID AND   
                    TE.COURSE_ID = S.COURSE_ID AND TE.SEC_ID = S.SEC_ID AND TE.SEMESTER = S.SEMESTER AND TE.YEAR = S.YEAR AND
                    S.TIME_SLOT_ID = T.TIME_SLOT_ID) LOOP
        dbms_output.put_line(ROW.ID || ' '||ROW.NAME || ' '||ROW.TIME_SLOT_ID || ' ' || ROW.DAY || ' ' || ROW.start_hr || ' '  || ROW.start_min  || ' ' || ROW.end_hr || ' '  || ROW.end_min);
    END LOOP;

END;
/

    BEGIN 
        PRINT_TIME_SLOT;
    END;
    /