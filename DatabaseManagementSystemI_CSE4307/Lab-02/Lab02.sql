conn system/123;
drop user s200042121;
create user s200042121 identified by cse4308;

grant dba to s200042121;

drop table student;
create table student(
    id varchar(20) primary key,
    name varchar(20),
    dept_name varchar(20),
    tot_cred number
);


insert into student values('00128','Zhang','Comp. Sci.', 102);
insert into student values('12345','Shankar','Comp. Sci.',32);
insert into student values('19991','Brandt','History',80);
insert into student values('23121','Chavez','Finance',110);
insert into student values('44553','Peltier','Physics',56);
insert into student values('45678','Levy','Physics',46);
insert into student values('54321','Williams','Comp. Sci.',5);
insert into student values('55739','Sanchez','Music',38);
insert into student values('70557','Snow','Physics',0);
insert into student values('76543','Brown','Comp. Sci.',58);
insert into student values('76653','Aoi','Elec. Eng.',60);
insert into student values('98765','Bourikas','Elec. Eng.',9);
insert into student values('98988','Tanaka','Biology',120);

select * from student;

select id,name from student;

select name,dept_name from student where tot_cred>100;

select name,dept_name from student where tot_cred>=80 and tot_cred<=120;

select id,name from student where dept_name='Comp. Sci.';

select name, tot_cred from student where dept_name='Physics';

select id,name from student where dept_name='Comp. Sci.' or tot_cred<10;

select distinct dept_name from student;



