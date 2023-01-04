alter table driving_lic drop constraint fk_driv;
drop table driving_lic;
drop table passports;
create table passports
(pid number primary key,
name varchar2(10),
issued_on date,
expired_on date
);
insert into passports values(301,'a',sysdate-100,sysdate+360);
insert into passports values(302,'b',sysdate-10,sysdate+265);
insert into passports values(303,'c',sysdate-35,sysdate+163);
create table driving_lic
(did number primary key,
name varchar2(10),
issued_on date,
expired_on date,
vehicle varchar2(10),
passport number,
constraints fk_driv foreign key(passport) references passports
);

---now insert data into it
insert into driving_lic values(801,'a',sysdate-23,sysdate+230,'Heavy',301);
insert into driving_lic values(802,'c',sysdate-24,sysdate+30,'Light',303);
insert into driving_lic values(803,'n1',sysdate-24,sysdate+30,'Light',null);
insert into driving_lic values(804,'n2',sysdate-224,sysdate+432,'Light',null);
insert into driving_lic values(805,'n3',sysdate-56,sysdate+238,'Light',null);
---Natural join---

select p.pid,p.name,p.issued_on,d.did,d.issued_on,d.vehicle
from passports p, driving_lic d
where p.pid=d.passport;
---left outer ---
select p.pid,p.name,p.issued_on,d.did,d.issued_on,d.vehicle
from passports p, driving_lic d
where p.pid=d.passport(+);
---right outer---
select p.pid,p.name,p.issued_on,d.did,d.issued_on,d.vehicle
from passports p, driving_lic d
where p.pid(+)=d.passport;
---full outer
--new syntax
select p.pid,p.name,p.issued_on,d.did,d.issued_on,d.vehicle
from passports p
full outer join driving_lic d
on p.pid=d.passport;