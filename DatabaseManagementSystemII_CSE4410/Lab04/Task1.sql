SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE FUNCTION CurrentBalance(AcN IN number) RETURN number
AS
Curr_Balance number;
begin
  SELECT sum(Amount) INTO Curr_Balance FROM Transaction WHERE AccNo=AcN;
  return Curr_Balance;
end;
/

DECLARE
    AcN Transaction.AccNo%TYPE;
BEGIN
    AcN:='&something';
    DBMS_OUTPUT.PUT_LINE(CurrentBalance(AcN));
END;
/