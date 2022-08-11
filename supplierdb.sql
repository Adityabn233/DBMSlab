create database supplier;
use supplier;

create table suppliers(
              sid int primary key,
              sname varchar(30),
              address varchar(30)
              );
create table parts(
              pid int primary key,
              pname varchar(20),
              color varchar(20)
              );
create table catalog(
              sid int,
              pid int,
              cost real,
              foreign key (sid) references suppliers(sid),
              foreign key (pid) references parts(pid)
              );
              
insert into suppliers values (123,'ABC','Bnglr');
insert into suppliers values (132,'ACB','Bnglr1');
insert into suppliers values (213,'BAC','Bnglr2');
insert into suppliers values (231,'BCA','Bnglr3');
insert into suppliers values (312,'CAB','Bnglr4');

insert into parts values(143,'DEF','RED');
insert into parts values(134,'DEH','GREEN');
insert into parts values(314,'DEG','BLUE');
insert into parts values(341,'DEI','WHITE');
insert into parts values(413,'DEJ','PURPLE');

insert into catalog values(123,143,2355);
insert into catalog values(132,134,2373);
insert into catalog values(213,314,2387);
insert into catalog values(231,341,2312);
insert into catalog values(312,413,2397);

/*1 Complete */
select p.pname from parts p, catalog c
where p.pid=c.pid;

/*2 Incomplete */
select catalog.sid from catalog
where (select c.pid from catalog c, suppliers s where c.sid=s.sid) = (select pid from parts);

/*3 Incomplete */
select sname from suppliers s
where s.sid=(select sid from catalog where pid IN(select pid from parts where color='RED'));

/*4 Complete*/
select pname from parts p, catalog c 
where c.sid=123 and c.pid NOT IN(select pid from catalog where sid != 123) and p.pid=c.pid;

/*5 Complete*/
select s.sid from suppliers s, catalog c
where c.cost = (select avg(ct.cost) from catalog ct, parts p where p.pid=ct.pid);

/*6 Complete*/
select s.sname from suppliers s,catalog c
where c.cost IN(select max(cost) from catalog group by pid) and s.sid=c.sid;

/*7 Complete*/
select s.sid from suppliers s, catalog c
where c.pid IN(select pt.pid from catalog ct,parts pt where pt.color='RED' and ct.pid=pt.pid) and c.pid not in(select pt.pid from parts pt,catalog ct where pt.color!='RED' and ct.pid=pt.pid) and c.sid=s.sid;



