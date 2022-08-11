create database tushar_order_database;
use tushar_order_database;
show tables;
drop database tushar_order_database;

create table customer(
cust_no int primary key,
cname varchar(20),
city varchar(20));

create table customerorder(
orderno int primary key,
odate date,
cust_no int,
order_amt int,
foreign key (cust_no) references customer(cust_no) on delete cascade);

create table item(
item_no int primary key,
unit_price int);

create table order_item(
orderno int,
item_no int,
qty int,
primary key(orderno,item_no),
foreign key (orderno) references customerorder(orderno) on delete cascade,
foreign key (item_no) references item(item_no) on delete cascade);

create table warehouse(
warehouse_no int primary key,
city varchar(20));

create table shipment(
orderno int,
warehouse_no int,
ship_date date,
primary key(orderno,warehouse_no),
foreign key (orderno) references customerorder(orderno) on delete cascade,
foreign key (warehouse_no) references warehouse(warehouse_no) on delete cascade);

insert into customer values(1,'ABC','BLORE');
insert into customer values(2,'DEF','KOLAR');
insert into customer values(3,'GHI','BLORE');
insert into customer values(4,'JKL','CHITTOR');
insert into customer values(5,'MNO','MYSORE');

select * from customer;

insert into customerorder values(1 ,'2006-01-01',2,5000);
insert into customerorder values(2 ,'2006-04-26',3,2500);  
insert into customerorder values(3 ,'2006-04-27',3,1000);
insert into customerorder values(4 ,'2006-04-30',5,1000);
insert into customerorder values(5 ,'2006-05-25',1,5000);

select * from customerorder;

insert into item values(1,2500);
insert into item values(2,5000);
insert into item values(3,1000);
insert into item values(4,5);
insert into item values(5,200);

select * from item;

insert into order_item values(1,2,1);
insert into order_item values(1,4,1);
insert into order_item values(2,1,1);
insert into order_item values(3,5,5);
insert into order_item values(4,2,2);

select * from order_item;

insert into warehouse values(1,'BLORE');
insert into warehouse values(2,'KOLAR');
insert into warehouse values(3,'CHITTOR');
insert into warehouse values(4,'MLORE');
insert into warehouse values(5,'MYSORE');

select * from warehouse;

insert into shipment values(1,1,'2006-04-30');
insert into shipment values(2,2,'2006-04-29');
insert into shipment values(3,2,'2006-04-24');
insert into shipment values(4,5,'2006-04-30');
insert into shipment values(5,3,'2006-06-01');

select * from shipment;

select orderno
from warehouse w , shipment s
where w.warehouse_no=s.warehouse_no and city='BLORE';

select c.cname,count(*),avg(o.order_amt)
from customer c, customerorder o
where 
c.cust_no=o.cust_no group by c.cname;




