create database bankingenterprice;
use bankingenterprice;

create table branch(
        branch_name varchar(20) primary key,
        branch_city varchar(15),
        assets real
        );
        
create table accounts(
        accno int primary key,
        branch_name varchar(20),
        balance real,
        foreign key (branch_name) references branch(branch_name)
        );
create table depositor(
        accno int,
        customer_name varchar(20) primary key,
        customer_street varchar(20),
        customer_city varchar(15),
        foreign key (accno) references accounts(accno)
        );
create table loan(
        loan_number int primary key,
        branch_name varchar(20),
        amount real,
        foreign key (branch_name) references branch(branch_name)
        );
create table borrower(
        customer_name varchar(20),
        loan_number int,
        foreign key (customer_name) references depositor(customer_name),
        foreign key (loan_number) references loan(loan_number)
        );
        drop table borrower;
        drop table loan;
        drop table depositor;
        
insert into branch values ('HanumantNagar','Bengaluru',2398428);
insert into branch values ('Jayanagar','Bengaluru',8358418);
insert into branch values ('MahalakshmiLayout','Bengaluru',2598421);
insert into branch values ('Basavangudi','Bengaluru',8395423);
insert into branch values ('Sinhgadh','Pune',9398427);

insert into accounts values (187237,'HanumantNagar',83796);
insert into accounts values (872346,'Sinhgadh',837374);
insert into accounts values (186333,'Basavangudi',1237617);
insert into accounts values (787237,'Basavangudi',374796);
insert into accounts values (187877,'HanumantNagar',98796);
insert into accounts values (917237,'MahalakshmiLayout',83346);
insert into accounts values (837237,'Jayanagar',87689);

insert into depositor values (187237,'Aditya','1stCross','Pune');
insert into depositor values (872346,'Aryan','6thCross','Bengaluru');
insert into depositor values (186333,'Adi7ysa','8thCross','Pune');
insert into depositor values (787237,'Avasctya','10thCross','Bengaluru');
insert into depositor values (187877,'jhxtya','11thCross','Bengaluru');
insert into depositor values (917237,'Ahbhjya','3rdCross','Bengaluru');

insert into loan values ('98348','HanumantNagar','122188');
insert into loan values ('98344','HanumantNagar','122736');
insert into loan values ('98387','Basavangudi','168188');
insert into loan values ('98334','Jayanagar','122358');
insert into loan values ('98665','Sinhgadh','124788');

insert into borrower values ('Aditya','98348');
insert into borrower values ('Aryan','98344');
insert into borrower values ('Adi7ysa','98387');
insert into borrower values ('Avasctya','98334');
insert into borrower values ('Ahbhjya','98665');

select customer_name from depositor
where accno in(select accno from accounts where branch_name='Basavangudi')
group by customer_name
having count(accno)>1;

delete from depositor
where accno in(select accno from accounts where branch_name in(select branch_name from branch where branch_city='Pune'));


