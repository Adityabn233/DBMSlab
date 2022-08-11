show databases;
create database tushar_airline;
use tushar_airline;
create table flights(
flno int primary key,
from1 varchar(20),
to1 varchar(20),
distance int,
departs time,
arrives time,
price int);

create table aircraft(
aid int primary key,
aname varchar(20),
c_range int);

create table employee(
eid int primary key,
ename varchar(20),
salary int);

create table certified(
eid int,
aid int,
primary key(aid,eid),
foreign key(aid) references aircraft(aid) on update cascade,
foreign key(eid) references employee(eid) on update cascade);

drop table certified;

insert into flights values(1,'Bengaluru','New Delhi',500,'06:15:45','09:00:00',5000);
insert into flights values(2,'Bengaluru','Chennai',300,'07:00:00','08:30:00',3000);
insert into flights values(3,'Trivandrum','New Delhi',800,'08:00:00','11:30:00',6000);
insert into flights values(4,'Bengaluru','Frankfurt',10000,'06:00:00','23:30:00',50000);
insert into flights values(5,'Kolkota','New Delhi',2400,'11:00:00','03:30:00',9000);
insert into flights values(6,'Bengaluru','Frankfurt',8000,'09:00:00','23:00:00',40000);

select * from flights;
 
insert into employee values(101,'Avinash',50000);
insert into employee values(102,'Lokesh',60000);
insert into employee values(103,'Rakesh',70000);
insert into employee values(104,'Santhosh',82000);
insert into employee values(105,'Tilak',50000);

select * from employee;

insert into aircraft values(1,'Airbus',2000);
insert into aircraft values(2,'Boeing',700);
insert into aircraft values(3,'JetAirways',550);
insert into aircraft values(4,'Indigo',5000);
insert into aircraft values(5,'Boeing',4500);
insert into aircraft values(6,'Airbus',2200);

select * from aircraft;

insert into certified values(101,1);
insert into certified values(101,4);
insert into certified values(101,5);
insert into certified values(101,6);
insert into certified values(102,1);
insert into certified values(102,3);
insert into certified values(102,5);
insert into certified values(103,2);
insert into certified values(103,3);
insert into certified values(103,5);
insert into certified values(103,6);
insert into certified values(104,6);
insert into certified values(104,1);
insert into certified values(104,3);
insert into certified values(105,3);
insert into certified values(101,3);

insert into certified values(104,1);
insert into certified values(105,1);
insert into certified values(102,1);
insert into certified values(104,3);
insert into certified values(105,3);


update certified set eid=102 where eid=104 and aid=6;
update employee set salary=90000 where eid=105;

select * from certified;

select aname from aircraft where aid in (select aid from certified where eid in (select eid from employee where salary>=80000));

select aname from aircraft where aid in (select aid from certified where NOT EXISTS (select * from employee where salary<80000));
select * from employee where salary<80000;
select distinct aid from certified where EXISTS (select * from employee where salary>=80000);

