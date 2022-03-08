-------------SQL Project 4----------------------

use SQL_Projects
go

--Create a tabler called "teacher", and identify Priamry Key column

CREATE TABLE teacher
(
Id int,
Name varchar(255),
Salary int,
Dept varchar(255)
);

alter table teacher
alter column ID int not null

alter table teacher
add constraint PK_teacher Primary Key (ID)


--Insert some values into "teacher" column
insert into teacher values (1, 'A', 100, 'D1')
insert into teacher values (2, 'B', 50, 'D5')
insert into teacher values (3, 'C', 500, 'D3')
insert into teacher values (4, 'D', 200, 'D7')
insert into teacher values (5, 'E', 400, 'D1')

select * from teacher



--Create a table called "Subjects" and add a "Foreign Key" constraint
--with "teacher_id" of the "teacher" table
CREATE TABLE subjects
(
Subject_ID varchar(50),
Title varchar(255),
Time varchar(255),
Instructor_ID int
);

alter table subjects
alter column subject_id int not null

alter table subjects
add constraint PK_subject Primary Key (Subject_ID)

--Creating Foreign Key
Alter table subjects
add constraint FK_subject_teacher Foreign Key (Instructor_ID)
references teacher(ID)

--Insertin some values into subjects table
insert into subjects values (1, 'Maths', 'Summer', 1)
insert into subjects values (2, 'English', 'Winter', 2)
insert into subjects values (3, 'Science', 'Summer', 3)
insert into subjects values (4, 'Language', 'Spring', 5)




--Using subquery method retrieve the ID, name, and salary of teachers
--whose title is "Science"
select Id, Name, Salary
from teacher
where id in (select Instructor_Id
             from subjects
			 where Title = 'Science')


--Query the same thing using Join
select Id, Name, Salary
from teacher t
inner join subjects s
   on t.Id = s.Instructor_Id
where Title = 'Science'



--Using Subquery query the number of teacher whose time are 'Summer', 'Winter'
select time, count(Instructor_Id) count_teacher
from subjects
where time in (select time 
               from subjects
			   where time in ('Summer','Winter')) 
group by time


--Do the same thing using Join
select s1.time, count(s1.instructor_id) count_teacher
from subjects s1
inner join subjects s2
   on s1.Subject_Id = s2.Subject_Id
where s1.time in ('Summer', 'Winter')
group by s1.Time



--Using Subquery, query the names and salaries of teachers whose names include "i"
select Name, Salary
from teacher
where id in (select Instructor_Id
             from subjects
			 where Title like '%i%')

--Do the same thing using Join
select Name, Salary
from teacher t
inner join subjects s
   on t.Id = s.Instructor_Id
where Title like '%i%'
 

--Retrieve teachers whose title is "Maths"
select Id, Name, Salary, Dept
from teacher
where id in (select Instructor_Id
                from subjects
				where Title = 'Maths')


--Do the same thing using Join
select name, Salary
from teacher t
inner join subjects s
  on t.Id = s.Instructor_ID
where Title like 'Maths'
