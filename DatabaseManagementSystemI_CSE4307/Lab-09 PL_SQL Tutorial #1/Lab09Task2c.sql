SET SERVEROUTPUT ON SIZE 1000000

CREATE OR REPLACE
FUNCTION TaxAmount(CustomerName customer.customer_name%TYPE)
RETURN NUMBER
AS
    NET_BALANCE number;
    TAX number;
BEGIN
    SELECT sum(account.balance) INTO NET_BALANCE FROM account,depositor WHERE depositor.customer_name=CustomerName and depositor.account_number=account.account_number;
    IF((NET_BALANCE)>=750) THEN
        TAX:=0.08*NET_BALANCE;
    ELSE
        Tax:=0;
    END IF;
    RETURN Tax;
END;
/

DECLARE
    Name customer.customer_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(TaxAmount('Johnson'));
END;
/