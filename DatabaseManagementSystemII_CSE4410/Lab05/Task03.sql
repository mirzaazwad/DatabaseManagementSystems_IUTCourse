CREATE OR REPLACE TRIGGER Account_IDGenerator
BEFORE INSERT
   ON Account
   FOR EACH ROW
DECLARE
  AccountID varchar2(150);
BEGIN
  AccountID:=GetAccountID(:NEW.Name,:New.AccCode,:New.OpeningDate);
  :New.Account_id:=AccountID;   
END;
/