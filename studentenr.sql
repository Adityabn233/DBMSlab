create database student_enrollment;
use student_enrollment;
show tables;

create table student(
stud_regno varchar(25) primary key,
stud_name varchar(25),
stud_major varchar(25),
stud_bdate date);

INSERT INTO student VALUES ('1pe11cs001','a','sr',19931230);
insert into student values('1pe11cs002','b','sr','19930924');
insert into student values('1pe11cs003','c','sr','19931127');
insert into student values('1pe11cs004','d','sr','19930413');
insert into student values('1pe11cs005','e','jr','19940824');

create table course(
course_no int primary key,
cname varchar(25),
cdept varchar(25));

INSERT INTO course VALUES(111,'OS','CSE');
INSERT INTO course VALUES(112,'EC','CSE');
INSERT INTO course VALUES(113,'SS','ISE');
INSERT INTO course VALUES(114,'DBMS','CSE');
INSERT INTO course VALUES(115,'SIGNALS','ECE');

create table text_book(
book_ISBN int primary key,
book_title varchar(25),
book_publisher varchar(25),
book_author varchar(25));

INSERT INTO text_book VALUES(10,'DATABASE SYSTEMS','PEARSON','SCHIELD');
INSERT INTO text_book VALUES(900,'OPERATING SYS','PEARSON','LELAND');
INSERT INTO text_book VALUES(901,'CIRCUITS','HALL INDIA','BOB');
INSERT INTO text_book VALUES(902,'SYSTEM SOFTWARE','PETERSON','JACOB');
INSERT INTO text_book VALUES(903,'SCHEDULING','PEARSON','PATIL');
INSERT INTO text_book VALUES(904,'DATABASE SYSTEMS','PEARSON','JACOB');
INSERT INTO text_book VALUES(905,'DATABASE MANAGER','PEARSON','BOB');
INSERT INTO text_book VALUES(906,'SIGNALS','HALL INDIA','SUMIT');

create table enroll(
regno varchar(25),
courseno int,
sem int,
marks int,
primary key(regno,courseno,sem),
foreign key(regno) references student(stud_regno),
foreign key(courseno) references course(course_no));

INSERT INTO enroll VALUES('1pe11cs001',115,3,100);
INSERT INTO enroll VALUES('1pe11cs002',114,5,100);
INSERT INTO enroll VALUES('1pe11cs003',113,5,100);
INSERT INTO enroll VALUES('1pe11cs004',111,5,100);
INSERT INTO enroll VALUES('1pe11cs005',112,3,100);

create table book_adoption(
course_no int,
sem int,
book_ISBN int,
primary key(course_no,sem,book_ISBN),
foreign key(course_no) references course(course_no),
foreign key(book_ISBN) references text_book(book_ISBN));

INSERT INTO book_adoption VALUES(111,5,900);
INSERT INTO book_adoption VALUES(111,5,903);
INSERT INTO book_adoption VALUES(111,5,904);
INSERT INTO book_adoption VALUES(112,3,901);
INSERT INTO book_adoption VALUES(113,3,10);
INSERT INTO book_adoption VALUES(114,5,905);
INSERT INTO book_adoption VALUES(113,5,902);
INSERT INTO book_adoption VALUES(115,3,906);




