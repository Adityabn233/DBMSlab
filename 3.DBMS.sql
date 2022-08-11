show databases;
create database tushar_supplier_insurance;
use tushar_supplier_insurance;
drop database tushar_supplier_insurance;
create table SUPPLIERS
(
sid int primary key,
sname varchar(20),
city varchar(20));

drop table suppliers; 

create table PARTS
(
pid int primary key,
pname varchar(20),
color varchar(10));

create table CATALOG
(
sid int,
pid int,
cost float,
primary key(sid,pid),
foreign key(pid) references PARTS(pid) on delete cascade
);

insert into SUPPLIERS values('1001','abc','xyz');
insert into SUPPLIERS values('1002','abc1','xyz1');
insert into SUPPLIERS values('1003','abc2','xyz2');
insert into SUPPLIERS values('1004','abc3','xyz3');
insert into SUPPLIERS values('1005','abc4','xyz4');

select * from suppliers;

insert into parts values('2001','name1','red');
insert into parts values('2002','name2','blue');
insert into parts values('2003','name3','black');
insert into parts values('2004','name4','green');
insert into parts values('2005','name5','yellow');

select * from parts;

insert into catalog values('1001','2001','15');
insert into catalog values('1002','2002','25');
insert into catalog values('1003','2003','35');
insert into catalog values('1004','2004','45');
insert into catalog values('1005','2005','55');

select * from catalog;

select distinct P.pname from parts P,Catalog C where P.pid=C.pid;

select s.sname from suppliers s where s.sid IN (select c.sid from catalog c where c.pid IN (select p.pid from parts p where  p.color='red'));

select DISTINCT c.sid from catalog c where c.cost>(select avg(c1.cost) from catalog c1 where c1.pid=c.pid);