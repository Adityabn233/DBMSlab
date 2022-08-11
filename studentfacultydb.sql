create database studentfacdb;
use studentfacdb;

create table student(
          snum int primary key,
          sname varchar(30),
          major varchar(30),
          level varchar(30),
          age int);
create table class(
		  name varchar(30) primary key,
          meets_at time,
          room varchar(30),
          fid int,
          foreign key (fid) references faculty(fid)
          );
create table enrolled(
		snum int primary key,
        cname varchar(30),
        foreign key(snum) references student(snum),
        foreign key(cname) references class(name)
        );
create table faculty(
		fid int primary key,
        fname varchar(20),
        deptid int
        );
        
insert into student values(123,'Aditya','ML','SR',20);
insert into student values(124,'Adarsh','AI','JR',20);
insert into student values(125,'Adam','DS','FR',20);
insert into student values(126,'Akash','CC','SO',20);
insert into student values(127,'Avinash','WD','FR',20);
insert into student values(128,'Atul','SDE','SR',20);

insert into class values('A',123021,'R21',21);
insert into class values('B',123022,'R22',22);
insert into class values('C',123023,'R23',23);
insert into class values('D',123024,'R24',24);

insert into enrolled values(123,'A');
insert into enrolled values(124,'A');
insert into enrolled values(125,'B');
insert into enrolled values(126,'B');
insert into enrolled values(127,'C');
insert into enrolled values(128,'D');

insert into faculty values(21,'Jakkali',10);
insert into faculty values(22,'Chandrashekhar',20);
insert into faculty values(23,'Prasad',30);
insert into faculty values(24,'Manjunath',40);

/*1 Complete*/
select s.sname from student s,enrolled e
where s.level= 'JR' and s.snum=e.snum and e.cname in(select name from class where fid=(select fid from faculty where fname = 'Jakkali'));  

/*2 Complete*/
select distinct c.name from class c
where c.room='R24' or (select count(snum) from enrolled where c.name=cname)>4;

/*3*/
select s.sname from student s
where (select count(e.cname) from enrolled where s.snum=e.snum)=2 and e.cname; 

/*4*/
select f.fname from faculty f,class c;

/*5 Complete*/
select f.fname from faculty f, class c
where (select count(distinct e.snum) from enrolled e where c.name=e.cname)<5 and c.fid=f.fid;

/*6 Complete*/
select sname from student
where snum not in(select distinct snum from enrolled);

/*7 */ 






