select a_no from account where balance<100000;
select customer_name from customer where customer_city='KHL';
select c_no from customer where customer_name like '%A%';
select distinct account_no from DEPOSITOR_INFO;
select * from account, DEPOSITOR_INFO;
select * from customer natural join depositor_info where c_no=customer_no;
select customer_name,customer_city from customer,depositor_info where c_no=customer_no;
select customer.* from customer,depositor_info,account where customer_no=c_no and account_no=a_no and balance>1000;
select a_no,balance from (
    select * from customer, depositor_info,account 
    where customer_no=c_no and account_no=a_no) 
    where balance between 5000 and 10000 or customer_city='DHK';