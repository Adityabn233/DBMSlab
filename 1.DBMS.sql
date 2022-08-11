create database insurance;
use insurance;
create table person(
     driver_id char(8) primary key,
     name varchar(30),
     address varchar(30)
     );
     
create table car(
      regno int primary key,
      model varchar(10),
      year int
      );
      
create table accident(
      report_number int primary key,
      date1 date,
      location varchar(20)
      );
      
create table participated(
	driver_id char(8),
    regno int,
    report_number int,
    damage_amount int,
    primary key(driver_id, regno, report_number),
    foreign key (driver_id) references person(driver_id),
    foreign key (regno) references car(regno),
    foreign key (report_number) references accident(report_number)
    );
    
insert into person values('AB1234','David','California');
insert into person values('AB1235','Dravid','Calcutta');
insert into person values('AB1236','Davis','Florida');

insert into car values(1234, 'Toyota',2001);
insert into car values(1236, 'Honda',2002);
insert into car values(1238, 'Hero',2004);

insert into accident values(1234,'20010212','Banglore');
insert into accident values(1236,'20020313','Banglore');
insert into accident values(1238,'20040516','Banglore');

insert into participated values('AB1234',1236,1234,2132);
insert into participated values('AB1235',1234,1236,3287);
insert into participated values('AB1236',1238,1238,9589);

update participated
set damage_amount=25000
where report_number=1236 and regno=1234;


insert into accident values(12,20230302,'NewDelhi');



select count(distinct p.driver_id) from participated p,accident a
where a.date1 like '2008%' and a.report_number=p.report_number;



select count(distinct a.report_number) 
from accident a,car c,participated p
where a.report_number=p.report_number and p.regno=any(select regno from car where model='Toyota'); 