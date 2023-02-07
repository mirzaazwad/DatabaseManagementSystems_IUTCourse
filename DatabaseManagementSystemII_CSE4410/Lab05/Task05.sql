CREATE OR REPLACE TRIGGER PRINCIPAL_UPDATE 
AFTER INSERT ON Transaction
FOR EACH ROW
begin
  UPDATE Balance SET PrincipalAmount=PrincipalAmount+:New.Amount WHERE AccNo=:New.AccNo;
end;
/
