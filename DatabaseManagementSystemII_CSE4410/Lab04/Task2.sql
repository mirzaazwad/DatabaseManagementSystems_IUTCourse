SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE FUNCTION Profit(AcN IN Transaction.AccNo%TYPE,Prof OUT Balance.PrincipalAmount%TYPE,FBalance OUT Balance.PrincipalAmount%TYPE) RETURN number
AS
PR number;
GP number;
AC number;
GPElapsed number;
MonthsAfterGP number;
Month number;
Princ number;
PBalance number;
begin
  SELECT AccCode INTO AC FROM Account WHERE ID=AcN;
  SELECT PrincipalAmount INTO Princ FROM Balance WHERE AccNo=AcN;
  SELECT ProfitRate INTO PR FROM AccountProperty WHERE ID=AC;
  SELECT GracePeriod INTO GP  FROM AccountProperty WHERE ID=AC;
  SELECT (SELECT SYSDATE FROM DUAL)-LastDateInterest INTO Month FROM Account WHERE ID=AcN;
  Month:= (FLOOR(Month/30));
  PBalance:=Princ;
  Prof:=0;
  For i IN 1..Month loop
    prof:=(prof+(PR/100)*Princ);
    IF(GP=0) THEN
      Princ:=Princ+prof;
      prof:=0;
    ELSIF MOD(i,GP)=0 THEN
      Princ:=Princ+prof;
      prof:=0;
    END IF;
  end loop;
  FBalance:=Princ;
  RETURN PBalance;
end;
/

DECLARE
    AcN Transaction.AccNo%TYPE;
    Prof Balance.PrincipalAmount%TYPE;
    FBalance Balance.PrincipalAmount%TYPE;
BEGIN
    AcN:='&something';
    DBMS_OUTPUT.PUT_LINE('Balance Before Profit: '||Profit(AcN,Prof,FBalance)||' Profit: ' || Prof ||' Final Balance: ' || FBalance);
END;
/