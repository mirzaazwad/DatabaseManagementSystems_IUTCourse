drop user rps cascade;
create user rps identified by test123;
grant dba to rps;
--now connect as RPS
alter table students drop constraints fk_stu;
alter table grades drop constraints fk_grades;
drop table students;
drop table depts;
drop table grades;

create table depts
(id number primary key,
name varchar2(10)
);
---insert data--
insert into depts values(2,'EEE');
insert into depts values(1,'MCE');
insert into depts values(3,'TVE');
insert into depts values(4,'CSE');
insert into depts values(5,'CEE');
create table students
(sid number primary key,
name varchar2(10),
cgpa number(4,2),
dept number,
constraints fk_stu foreign key(dept) references depts on delete cascade
);
----insert data---
insert into students values(401,'a1', 3.5,4);
insert into students values(402,'a2', 3.7,4);
insert into students values(403,'a3', 3.2,4);
insert into students values(501,'b1', 3.8,5);
insert into students values(502,'b2', 3.2,5);
insert into students values(503,'b3', 3.3,5);
create table grades
(cid varchar2(10),
sid number,
grade varchar2(6),
constraints fk_grades foreign key(sid) references students on delete cascade
);
---now insert data--
insert into grades values('CSE 4101',401,'A+');
insert into grades values('CSE 4101',402,'A');
insert into grades values('CSE 4101',403,'A-');

insert into grades values('CEE 4101',501,'A');
insert into grades values('CEE 4201',503,'A-');
insert into grades values('CEE 4103',501,'B');
select * from students;
---NOW LETS SEE THE CASCADING EFFECTS---
--lets delete CEE dept--
delete depts
where id=5;
--you will find there is no students for CEE dept and no grades for those
select * from students;