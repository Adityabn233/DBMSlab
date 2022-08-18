create table student(usn varchar(10),sname varchar(20), mob int(10),dept varchar(30),sem int(10), primary key(usn));
 create table faculty(fid varchar(10),fname varchar(30),fmob int(10),dept_cont int(10) ,primary key(fid));
 
 create  table hod(fid varchar(10),fname varchar(10),dept varchar(10),foreign key(fid) References faculty(fid));
 create table activity(act_name varchar(30),alocation varchar(100),address varchar(100),apoints varchar(100),duration_in_weeks int(20),adate date, usn varchar(10), foreign key(usn) references student(usn));
 
 create table meeting(slno int(100),mdate date,purpose varchar(100), fid varchar(10),outcome varchar(100), foreign key(fid) references faculty(fid));
 create table activity_claim(org_name varchar(30), org_addr varchar(100),type varchar(20),activity_conducted varchar(100));
