---scenario: a simple result processing system (rps)
--objects we have:
-- 1: depts
-- 2: students
--- 3: grades
--Lets create another 2 necessary relations
create table employees
(eid number primary key, 
name varchar2(20),
designation number(1,0), -- 1:Lecturer, 2: Asst. Professor, 3: Assoc. Prof. 4:Professor
RoomNo varchar2(10),
CounselHour varchar2(15),
Dept number,
Salary number,
PersonalFileNo varchar2(15),
constraints fk_emp foreign key(Dept) references depts on delete cascade
);
---Lets put some recods

insert into employees values(90001,'Abdul Karim',3,'AB2-301','14:30-15:30',4,1000,'xyz');
insert into employees values(90002,'Abdur Rahim',1,'AB2-301','14:30-15:30',4,500,'xyz1');
insert into employees values(90003,'Abdul Halim',4,'AB2-301','16:30-17:30',4,2000,'xyz2');
insert into employees values(90004,'Abdullah',4,'AB2-301','15:30-17:30',4,1500,'xyz3');
---now another table--
create table course_info
(cid varchar2(15) primary key,
title varchar2(30),
credit number(4,2)
);
---insert some date--
insert into course_info values('CSE 4101','Fundamental of Computing',3.0);
insert into course_info values('CEE 4101','Fundamental of CEE',2.0);
---Now create a view for emp--

create or replace view emp_v
as
select name, designation, RoomNo,CounselHour
from employees readonly;
----followings are the steps to distribute application among different users--
---step 1: role create and customize i
create role role_readonly;
-- summary of objects
--COURSE_INFO TABLE
--DEPTS TABLE
--EMPLOYEES TABLE
--EMP_V VIEW
--GRADES TABLE
--STUDENTS TABLE

grant select on course_info to role_readonly;
grant select on depts to role_readonly;
grant select on emp_v to role_readonly;
grant select on grades to role_readonly;
grant select on students to role_readonly;
---2: role to insert and update values in grades
drop role role_marks_entry;
create role role_marks_entry;
grant insert,update on grades to role_marks_entry;
---role can also be granted to another role
grant role_readonly to role_marks_entry;
---3: role to update course info
drop role role_update_course;
create role role_update_course;
grant insert,update,delete on course_info to role_update_course;
---now I will create few more users--
drop user hod;
drop user reg;
drop user c_teacher;
create user hod identified by test123;
create user reg identified by test123;
create user c_teacher identified by test123;
---dont do in real-life: I am doing to save time!!
grant dba to hod;

grant dba to reg;
grant dba to c_teacher;
grant role_readonly,role_marks_entry to hod;
grant role_readonly,role_update_course to reg;
grant role_readonly,role_marks_entry to c_teacher;
---now connect to any of these newly created user---
connect reg/test123;
---reg has no objects, but it can access rps's object by role-based access control
select * from rps.students;