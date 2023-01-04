SET SERVEROUTPUT ON SIZE 1000000
DROP TRIGGER ADVISOR_ASSIGN;
CREATE OR REPLACE TRIGGER ADVISOR_ASSIGN
AFTER INSERT
   ON STUDENT
   FOR EACH ROW
DECLARE
   INS_ID advisor.i_id%TYPE;
BEGIN
    select i_id INTO INS_ID from (select i_id from advisor WHERE s_id<>:new.ID) WHERE ROWNUM<=1;
    insert into advisor(i_id,s_id) values(INS_ID,:new.ID);
END ;
/

begin
  insert into student(NAME,DEPT_NAME,TOT_CRED) values ('Mirza', 'Comp. Sci.', '181');
end;
/