SET SERVEROUTPUT ON SIZE 1000000
DECLARE
 NAME varchar2(100);
 NUM1 number;
 NUM2 number;
 NUM3 integer;
 D TIMESTAMP:=SYSTIMESTAMP;
BEGIN
    DBMS_OUTPUT . PUT_LINE ( '200042121');
    NAME:='&username';
    DBMS_OUTPUT . PUT_LINE(NAME || ' LENGTH IS: ' || LENGTH(NAME));
    NUM1:='&num1';
    NUM2:='&num2';
    DBMS_OUTPUT . PUT_LINE('Sum is: ' || (NUM1+NUM2));
    DBMS_OUTPUT . PUT_LINE ('Time Right Now: ' || TO_CHAR(D,'HH24: MI: SS'));
    NUM3:='&num3';
    --WITHOUT CASE
    IF(MOD(NUM3,2)=0) THEN
        DBMS_OUTPUT . PUT_LINE('Even Number');
    ELSE
        DBMS_OUTPUT . PUT_LINE('Odd NUMBER');
    END IF;
    CASE MOD(NUM3,2) 
        WHEN 1 THEN
            DBMS_OUTPUT . PUT_LINE('Odd NUMBER');
        WHEN 0 THEN 
            DBMS_OUTPUT . PUT_LINE('Even NUMBER');
        ELSE
            DBMS_OUTPUT. PUT_LINE('Unprecedented Error');
    END CASE;
END;
/
CREATE OR REPLACE
PROCEDURE IS_PRIME(NUM IN number)
AS
    FOUND BOOLEAN DEFAULT FALSE;
BEGIN
    FOR i IN 2..(NUM-1) LOOP
        IF(MOD(NUM,i)=0) THEN
            DBMS_OUTPUT . PUT_LINE('IS NOT PRIME');
            FOUND:=TRUE;
            EXIT;
        END IF;
    END LOOP;
    IF(FOUND=FALSE) THEN
        DBMS_OUTPUT. PUT_LINE('IS PRIME');
    END IF;

END;
/
BEGIN
    IS_PRIME(6);
END;
/

