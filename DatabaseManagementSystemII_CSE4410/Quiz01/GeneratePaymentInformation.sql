CREATE OR REPLACE FUNCTION GeneratePaymentInformation(ID IN STUDENTS.ID%TYPE) RETURN NUMBER
AS
TotalLab number default 0;
TotalTheory number default 0;
FailureCount number default 0;
TotalPayment number default 0;
begin
  For Row IN (SELECT QUIZ_Courses.Credit AS Credit, QUIZ_Courses.Cat AS Cat FROM QUIZ_Courses,QUIZ_Grades WHERE QUIZ_Courses.CID=QUIZ_Grades.CID AND QUIZ_Grades.SID=ID AND QUIZ_Grades.Grade='F') loop
    IF (Row.Cat='1') THEN
      TotalLab:=TotalLab+Row.Credit*50;
    ELSIF (Row.Cat='0') THEN
      TotalTheory:=TotalTheory+Row.Credit*75;
    END IF;
    FailureCount:=FailureCount+1;
  end loop;
  IF(FailureCount>=3)THEN
    TotalPayment:=TotalTheory+TotalLab;
  ELSE 
    TotalPayment:=0;
  END IF;
  RETURN TotalPayment;
end;
/