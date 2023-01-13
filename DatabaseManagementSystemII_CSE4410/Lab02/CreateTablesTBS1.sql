drop table student;
drop table courses;
drop table department;

CREATE TABLE department(
  dept_id varchar2(50),
  dept_name varchar2(100),
  CONSTRAINT pk_department PRIMARY KEY(dept_id)
)TABLESPACE tbs1;

CREATE TABLE student(
  student_id varchar2(50),
  student_name varchar2(100),
  dept_id varchar2(50),
  CONSTRAINT pk_student PRIMARY KEY(student_id),
  CONSTRAINT fk_student_department FOREIGN KEY(dept_id) REFERENCES department(dept_id) ON DELETE CASCADE
)TABLESPACE tbs1;


CREATE TABLE courses(
  code varchar2(50),
  course_name varchar2(100),
  credit number,
  offer_by varchar2(50),
  CONSTRAINT pk_courses PRIMARY KEY(code),
  CONSTRAINT fk_courses_department FOREIGN KEY(offer_by) REFERENCES department(dept_id) ON DELETE CASCADE
)TABLESPACE tbs2;