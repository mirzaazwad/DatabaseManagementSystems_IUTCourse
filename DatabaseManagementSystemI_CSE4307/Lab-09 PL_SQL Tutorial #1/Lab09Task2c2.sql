CREATE OR REPLACE
FUNCTION TaxAmount
RETURN number
AS
    NET_BALANCE number;
    TAX number;
BEGIN
    FOR i IN (SELECT sum(account.balance) as balance_amount,depositor.customer_name as name FROM account,depositor WHERE depositor.account_number=account.account_number group by depositor.customer_name) LOOP
        IF(i.balance_amount>=750) THEN
            TAX:=0.08*i.balance_amount;
        ELSE
            Tax:=0;
        END IF;
        DBMS_OUTPUT.PUT_LINE(' Tax: ' || Tax);
    END LOOP;
    RETURN 0;
END;
/


BEGIN
    DBMS_OUTPUT.PUT_LINE(TaxAmount);
END;
/