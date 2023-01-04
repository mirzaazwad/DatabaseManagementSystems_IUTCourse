create or replace view Advisor_Selection AS select ID,name,dept_name from instructor;


create or replace view Student_Count as select name,count(*)StudentCount from (select Advisor_Selection.*,s_ID from Advisor_Selection join advisor on ID=i_ID) group by name,ID;

create role students;
create role teachers;
create role head;
create role administrator;

grant select on Advisor_Selection to students;
grant select on course to students;

grant select on course to teachers;
grant select on student to teachers;

grant select on course to head;
grant select on student to head;

grant insert on instructor to head;

grant select on department to administrator;
grant select on instructor to administrator;
grant update(budget) on department to administrator;

create user sys_student identified by 123;
create user sys_teacher identified by 123;
create user sys_administrator identified by 123;
create user sys_head identified by 123;

grant students,create session sys_student;
grant teachers,create session sys_teacher;
grant administrator,create session sys_administrator;
grant head,create session sys_head;
