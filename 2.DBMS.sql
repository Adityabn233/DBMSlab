show databases;
create database tusharbanking;
use tusharbanking;
drop database tusharbanking;
show tables;
create table branch
(
branch_name varchar(25) primary key,
branch_city varchar(25),
assets int
);

create table accounts
(
accno int primary key,
branch_name varchar(25),
balance int,
foreign key(branch_name) references branch(branch_name) on delete cascade);

create table depositor
(
accno int,
customer_name varchar(25) primary key,
customer_street varchar(25),
customer_city varchar(25));

create table loan
(
loan_number int primary key,
branch_name varchar(25),
amount int,
foreign key(branch_name) references branch(branch_name) on delete cascade
);

create table borrower
(
customer_name varchar(25),
loan_number int,
primary key(customer_name,loan_number),
foreign key(customer_name) references depositor(customer_name) on delete cascade,
foreign key(loan_number) references loan(loan_number) on delete cascade);

insert into branch values('SBI_Chamarajpet','Bangalore',50000);
insert into branch values('SBI_Residency Road','Bangalore',10000);
insert into branch values('SBI_Shivaji Road','Bombay',20000);
insert into branch values('SBI_Parliament Road','Delhi',10000);
insert into branch values('SBI_Jantar Mantar','Delhi',30000);

insert into accounts values(123001,'SBI_Chamarajpet',50000);
insert into accounts values(123002,'SBI_Residency Road',10000);
insert into accounts values(123003,'SBI_Shivaji Road',20000);
insert into accounts values(123004,'SBI_Parliament Road',10000);
insert into accounts values(123005,'SBI_Jantar Mantar',30000);

insert into depositor values(123001,'Avinash','ResidencyRoad','Bangalore');
insert into depositor values(123002,'Rekha','BullTempleRoad','Bangalore');
insert into depositor values(123003,'Smrithi','SelamRoad','Bangalore');
insert into depositor values(123004,'Nikhil','ParliamentRoad','Delhi');
insert into depositor values(123005,'Dinesh','ParliamentRoad','Delhi');

insert into loan values(2,'SBI_Residency Road',2000);
insert into loan values(1,'SBI_Chamarajpet',2000);
insert into loan values(3,'SBI_Shivaji Road',2000);
insert into loan values(4,'SBI_Parliament Road',2000);
insert into loan values(5,'SBI_Jantar Mantar',2000);

insert into borrower values('Avinash',1);
insert into borrower values('Rekha',2);
insert into borrower values('Smrithi',3);
insert into borrower values('Nikhil',4);
insert into borrower values('Dinesh',5);

select customer_name from depositor d,accounts a where a.accno=d.accno AND a.branch_name='SBI_Chamarajpet' group by d.customer_name having count(*) >=2;

select * from depositor d,accounts a,branch b where b.branch_city='Bangalore' group by d.customer_name having count(distinct b.branch_name)=(select count(branch_name)from branch where branch_city='Bangalore');

delete from accounts where branch_name IN(select branch_name from branch where branch_city='Delhi');

select * from accounts;
