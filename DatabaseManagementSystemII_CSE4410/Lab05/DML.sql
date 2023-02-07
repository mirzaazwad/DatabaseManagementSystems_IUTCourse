
insert into AccountProperty values (1, 'Saving Account', 5, 30);
insert into AccountProperty values (2, 'Current Account', 3, 0);
insert into AccountProperty values (3, 'Fixed Deposit Account', 7, 90);
insert into AccountProperty values (4, 'Recurring Deposit Account', 6, 60);
insert into AccountProperty values (5, 'Money Market Account', 4, 45);

insert into Account(Name,AccCode,OpeningDate,LastDateInterest) values ( 'John Doe', 1, TO_DATE('2020-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account(Name,AccCode,OpeningDate,LastDateInterest) values ( 'Jane Doe', 2, TO_DATE('2020-02-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account(Name,AccCode,OpeningDate,LastDateInterest) values ( 'Bob Smith', 3, TO_DATE('2020-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account(Name,AccCode,OpeningDate,LastDateInterest) values ( 'Sara Lee', 4, TO_DATE('2020-04-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account(Name,AccCode,OpeningDate,LastDateInterest) values ( 'Tom Cruise', 5, TO_DATE('2020-05-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TRANSACTION VALUES(1,'520200501.Tom.1010',1000, TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO TRANSACTION VALUES(2,'520200501.Tom.1010',1000, TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO TRANSACTION VALUES(3,'520200501.Tom.1010',1000, TO_DATE('2023-01-10', 'YYYY-MM-DD'));