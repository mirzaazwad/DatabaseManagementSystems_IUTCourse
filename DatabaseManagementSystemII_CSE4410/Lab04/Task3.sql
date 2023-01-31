CREATE OR REPLACE PROCEDURE update_accounts
AS
  Prof Balance.PrincipalAmount%TYPE;
  FBalance Balance.PrincipalAmount%TYPE;
  PBalance Balance.PrincipalAmount%TYPE;
begin
  FOR i IN (SELECT * FROM Account) loop
    PBalance:=Profit(i.ID,Prof,FBalance);
    UPDATE Balance SET PrincipalAmount=FBalance WHERE AccNo=i.ID;
    UPDATE Balance SET ProfitAmount=Prof WHERE AccNo=i.ID;
  end loop;
end;
/

begin
  update_accounts();
end;