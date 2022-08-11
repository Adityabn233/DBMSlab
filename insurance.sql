create database supplier1;
use supplier1;
create table suppliers(sid int,sname varchar(20),address varchar(20),primary key(sid));
desc suppliers;
insert into suppliers(sid,sname,address)values(1,'abc','ABC'); 
insert into suppliers(sid,sname,address)values(2,'def','DEF'); 
insert into suppliers(sid,sname,address)values(3,'ghi','GHI');
select* from suppliers;
create table parts(pid int,pname varchar(20),color varchar(20),primary key(pid));
desc parts;
insert into parts(pid,pname,color)values(1,'xyz','red'); 
insert into parts(pid,pname,color)values(2,'wxy','blue'); 
insert into parts(pid,pname,color)values(3,'vwx','green');
select* from parts;
create table catalog(sid int,pid int,cost int,foreign key(sid) references suppliers(sid),foreign key(pid) references parts(pid));
desc catalog;
insert into catalog(sid,pid,cost)values(1,1,1000);
insert into catalog(sid,pid,cost)values(2,3,2000);
insert into catalog(sid,pid,cost)values(3,3,4000);
select* from catalog;
select pname from parts,suppliers where sid=pid;
select sname from suppliers,parts where color='red' and pid=sid;
select pname from suppliers,parts where sname='abc' group by sname;




