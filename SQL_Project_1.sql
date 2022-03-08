-------SQL Project 1-------

use SQL_Projects
go

--Create a table called Deposits that have columns 
--dep_account, dep_type, customer_ID, Dep_amount.
create table Deposits (
      dep_account int primary key,
	  dep_type varchar(30),
	  customer_ID int,
	  Dep_amount money
);


--Create a table called Customers.
drop table if exists [dbo].[Mushteriler]
create table Customers (
     Customer_ID int primary key,
	 Name varchar(35),
	 Surname varchar(25),
	 Birthdate date,
	 Salary money
);

--Create Foreign key constraint
alter table dbo.Deposits
add constraint FK_Customer_id foreign key (customer_ID) 
references Customers(Customer_ID)



--Insert information to Customers and Deposits tables
insert into Customers
values (1, 'Ruslan', 'Orucov', '20000902', 3000)

insert into Customers(customer_ID, Name, Surname, Birthdate, Salary)
values (12, 'Sahib', 'Osmanov', '19981230', 650),
       (2, 'Rasim', 'Ceferov', '19850804', 1500),
       (3, 'Semral', 'Memmedov', '19790502', 1700),
	   (4, 'Resul', 'Resulov', '19870301', 250),
       (5, 'Shamil', 'Heyderov', '19991112', 700),
	   (6, 'Senan', 'Abuzerov', '19890207', 100),
       (7, 'Murad', 'Kerimov', '19950701', 600),
	   (8, 'Tunar', 'Muradov', '19901215', 1200),
       (9, 'Elburus', 'Agamirzeyev', '19770817', 1550),
	   (10, 'Cabbar', 'Cabbarov', '19740804', 500),
       (11, 'Seymur', 'veliyev', '20000110', 200)



insert into Deposits
values (101, 'Muddetli', 1, 1000),
       (102, 'Telebli', 2, 700),
	   (103, 'Muddetli', 3, 150),
       (104, 'Muddetli', 1, 900),
	   (105, 'Telebli', 6, 300),
       (106, 'Telebli', 5, 400),
	   (107, 'Telebli', 2, 1200),
       (108, 'Muddetli', 4, 1200),
	   (109, 'Muddetli', 7, 500),
       (110, 'Telebli', 8, 200),
	   (111, 'Muddetli', 9, 800),
	   (112, 'Telebli', 10, 400),
       (113, 'Muddetli', 1, 300),
	   (114, 'Telebli', 2, 1000),
       (115, 'Telebli', 3, 900),
	   (116, 'Muddetli', 4, 700),
       (117, 'Muddetli', 8, 200)

select * from Deposits

--Retrieve the customers that have salary between 200 and 800.
select Name, Salary 
from Customers
where Salary between 200 and 800




--Retrieve deposit accounts that deposit amount different from 1000, 500, 980
select dep_account, dep_amount
from Deposits
where Dep_amount not in (1000, 500, 980)





--Retrieve the name of customer that is different from X name
--or whose salary is 600
select Name, Surname, Birthdate, Salary
from Customers
where Name not like 'Murad' or Salary = 600




--Retrieve the customers whose birthdate is 30.12.1998 (day month year) and 
--whose salary not between 200 and 500
select Name, Surname, Birthdate, Salary
from Customers
where Birthdate = '19981230' and Salary not between 200 and 500


insert into Customers
values (13, 'Cefer', 'Ceferov', '20000110', 550)




--Retrieve the surname of customers whose ID is equal to any X value 
--or whose birthdate 01.10.2000 (month day year)
select Surname
from Customers
where Customer_ID = 11 or Birthdate = '20000110'




--Create a tabale called Company with columns id, name, date, emp_count, profit.
--Add default constraint to the date column (12.03.2020 (month day year))
create table Company (
     id int identity (1,1) primary key,
	 name nvarchar(25),
	 date date constraint DF_Date default '20201203',
	 emp_count int,
	 profit money
)

insert into Company (name, emp_count, profit)
values ('Company A', 20, 1000)

select * from Company