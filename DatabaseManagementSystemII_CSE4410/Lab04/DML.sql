
insert into AccountProperty values (1, 'Saving Account', 5, 30);
insert into AccountProperty values (2, 'Current Account', 3, 0);
insert into AccountProperty values (3, 'Fixed Deposit Account', 7, 90);
insert into AccountProperty values (4, 'Recurring Deposit Account', 6, 60);
insert into AccountProperty values (5, 'Money Market Account', 4, 45);

insert into Account values (1, 'John Doe', 1, TO_DATE('2020-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account values (2, 'Jane Doe', 2, TO_DATE('2020-02-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account values (3, 'Bob Smith', 3, TO_DATE('2020-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account values (4, 'Sara Lee', 4, TO_DATE('2020-04-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into Account values (5, 'Tom Cruise', 5, TO_DATE('2020-05-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));


insert into Transaction values (1, 1, 1000, TO_DATE('2021-01-10', 'YYYY-MM-DD'));
insert into Transaction values (2, 1, -500, TO_DATE('2021-02-10', 'YYYY-MM-DD'));
insert into Transaction values (3, 2, 1500, TO_DATE('2021-03-10', 'YYYY-MM-DD'));
insert into Transaction values (4, 2, -800, TO_DATE('2021-04-10', 'YYYY-MM-DD'));
insert into Transaction values (5, 3, 2000, TO_DATE('2022-05-10', 'YYYY-MM-DD'));
insert into Transaction values (6, 3, -1000, TO_DATE('2022-06-10', 'YYYY-MM-DD'));
insert into Transaction values (7, 4, 2500, TO_DATE('2022-07-10', 'YYYY-MM-DD'));
insert into Transaction values (8, 4, -1500, TO_DATE('2022-08-10', 'YYYY-MM-DD'));
insert into Transaction values (9, 5, 3000, TO_DATE('2022-09-10', 'YYYY-MM-DD'));
insert into Transaction values (10, 5, -2000, TO_DATE('2022-10-10', 'YYYY-MM-DD'));


insert into Balance values (1, 5000, 250);
insert into Balance values (2, 7000, 210);
insert into Balance values (3, 8000, 560);
insert into Balance values (4, 6000, 375);
insert into Balance values (5, 9000, 720);

