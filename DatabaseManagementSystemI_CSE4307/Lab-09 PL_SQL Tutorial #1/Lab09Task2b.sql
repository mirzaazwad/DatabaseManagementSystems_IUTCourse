SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE
PROCEDURE CustomerStatus(CustomerName IN customer.customer_name%TYPE)
AS
    NET_BALANCE number;
    NET_LOAN number;
BEGIN
    
    SELECT sum(account.balance) INTO NET_BALANCE FROM account,depositor WHERE depositor.customer_name=CustomerName and depositor.account_number=account.account_number;
    SELECT sum(loan.amount) INTO NET_LOAN FROM borrower,loan WHERE borrower.customer_name=CustomerName and borrower.loan_number=loan.loan_number;
    IF((NET_BALANCE)<=(NET_LOAN)) THEN
        DBMS_OUTPUT.PUT_LINE('Green Zone');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Red Zone');
    END IF;
END;
/

DECLARE
    Name customer.customer_name%TYPE;
BEGIN
    Name:='&username';
    CustomerStatus(Name);
END;
/