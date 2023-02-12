CREATE OR REPLACE PROCEDURE PerformTransaction
AS
TransactionAmount number;
AccountNo number;
begin
  FOR Row IN (SELECT * FROM QUIZ_STUDENTS)loop
    TransactionAmount:=GeneratePaymentInformation(Row.ID);
    SELECT QUIZ_STUDENTS.AccountNo INTO AccountNo FROM QUIZ_STUDENTS WHERE QUIZ_STUDENTS.ID=Row.ID;
    IF(TransactionAmount>0)THEN
      INSERT INTO QUIZ_TRANSACTIONS VALUES(AccountNo,'101',SYSDATE(),TransactionAmount,'Amount to be paid: '|| TransactionAmount,1);
    END IF;
  end loop;
end;
/