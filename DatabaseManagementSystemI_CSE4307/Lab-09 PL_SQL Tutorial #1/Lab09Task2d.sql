SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE
FUNCTION CustomerCategory(CustomerName customer.customer_name%TYPE)
RETURN varchar2
AS
    NET_BALANCE number;
    NET_LOAN number;
    Category varchar2(5);
BEGIN
    SELECT sum(account.balance) INTO NET_BALANCE FROM account,depositor WHERE depositor.customer_name=CustomerName and depositor.account_number=account.account_number;
    SELECT sum(loan.amount) INTO NET_LOAN FROM borrower,loan WHERE borrower.customer_name=CustomerName and borrower.loan_number=loan.loan_number;
    IF((NET_BALANCE)>1000 AND (NET_LOAN)<1000) THEN
        Category:='C-A1';
    ELSIF((NET_BALANCE)<500 AND (NET_LOAN)>2000) THEN
        Category:='C-C3';
    ELSE
        Category:='C-B1';
    END IF;
    RETURN Category;
END;
/

DECLARE
    Name customer.customer_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(CustomerCategory('Johnson'));
END;
/