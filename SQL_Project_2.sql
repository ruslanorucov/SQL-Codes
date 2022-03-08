-----SQL Project 2------

use SQL_Projects
go


--Create a table called Salary with ID-pk, name, surname, salary, dateofbirth columns
--And insert 10 rows
CREATE TABLE Salary (
     İD int identity(1,1) primary key,
	 Name nvarchar(25),
	 Surname nvarchar(25),
	 Salary money,
	 dateofbirth date
)	


insert into Salary 
values ('Rasim', 'Bedelov', 100, '20030915'),
       ('Ramin', 'Nezirov', NULL, '19960223'),
       ('Surac', 'Kamilov', 800, '19800405'),
	   ('Sona', 'Eliyeva', 300, '19951204'),
	   ('Tural', 'Rzaxanov', 600, '19930702'),
	   ('Veli', 'Ramaldanov', 900, '19900925'),
	   ('Yasemen', 'Ceferova', 2000, '19960206'),
	   ('Ruslan', 'Orucov', 3500, '20000902'),
	   ('Emil', 'Ramazanov', 1500, '19850807'),
	   ('Sebine', 'Rasimova', 1800, '19941108'),
	   ('Resul', 'Resulov', 350, '20021211'),
	   ('Ibrahim', 'Balabeyov', 1300, '19790309'),
	    ('Mehemmed', 'Sadiqov', 550, '20010602'),
	   ('Tunar', 'Muradov', 1850, '19860422'),
	   ('Fidan', 'Rehimli', 1600, '19920804'),
	   ('Turkan', 'Ahmadova', 2300, '19990707'),
	   ('Seymur', 'Nebiyev', 1100, '19830513')

select * from Salary



--Retrieve the employee who get the most salary
select top (1) Name, Surname, Salary
from Salary
order by Salary desc




--Retrieve the name and surname of 3 employees whose get at least salary 
select top(3)  Name, Surname, Salary
from Salary
order by Salary




--Retrieve the name, surname, and salary of employees whose name contain "a" and 
--whose salary more than 500 and sort by salary in ascending order
select Name, Surname, Salary
from Salary
where Name like '%a%' and Salary > 500
order by Salary




--Sort the names by their length
select  Name 
from Salary 
order by len(Name) desc 



--Retrieve the surnames and salaries and sort by names in descending order
select Surname, Salary
from Salary
order by name desc




--Increase the salary by 30 percent of employees whose name starts with "V"
select Name, Salary before_inc, Salary + Salary*0.30 after_inc
from Salary
where Name like 'V%'



--Retrieve the names and salaries of employees whose names include "e" 
--and ID is less than 10 and then sort by name in ascending order
--and salary in descending order
select Name, Salary
from Salary
where Name like '%e%' and İD < 10
order by Name , Salary desc;




--Increase the salary of employees whose salary is not null or greater than 1500
select Name, Surname, Salary before, Salary + 100 after
from Salary
where Salary is not null or Salary > 1500



select * 
from Salary
order by 4 desc




--Retrieve the name, and surname of the employees whose salary is different 
--from 570, 800, 700 or the last symbol of the name is "c", 
--sort by name and surname in descending ored
select Name, Surname
from Salary
where Salary not in (570, 800, 700) or Name like '%c'
order by 1 desc, 2 desc





--Retrievde the 10% of salary of employees whose salaries aren't between 200 and 500
select Salary*0.10 salary_10_percent
from Salary
where Salary not between 200 and 500
order by salary_10_percent




--Decrease salary 35 AZN of employees whose names include double "e"
select Name, Surname, Salary, Salary - 35 after_decrease
from Salary
where Name like '%e%e%'




--Retrieve the employees with the highest salaries whose names include "a" or "u" symbol
select top(1) Name, Salary
from Salary
where Name like '%[au]%'
order by Salary desc




--Add 100 AZN to salaries of the employees whose names containe 4 symbol
select Name, Salary + 100 After_increase
from Salary
where len(name) = 4





--Retrieve the name, surname, and salary of employees whose
--salaries is greater than 200 or the last symbol of surname is "v" 
--and sort by salary, name, and salary in descending order (using numbers)
select Name, Surname, Salary
from Salary
where Salary > 200 or Surname like '%v'
order by 3, 1, 2





--Increase the salaries of employees by twice whose names are not null
--and salaries are different from 100. And sort by salary in descending order.
select Name, Salary, Salary*2 increase_twice
from Salary
where Name is not null and Salary <> 100
order by increase_twice




--Retrieve the employees whose salaries is not between 1000 and 2000 
--and birthdate less than sysdatetime, and sort by birthdate column in descending order
select Name, Surname, Salary, dateofbirth
from Salary
where dateofbirth < SYSDATETIME() and Salary not between 1000 and 2000
order by dateofbirth




--Increase 10 days of information about employes in their date column and update it
update Salary
set dateofbirth = DATEADD(day, 10, dateofbirth)
where Name like '%R%'



--Decrease 1 day of date column where data is between sysdate and 01.01.2018 range
--(We have birthdate column and I will do this process in that caolumn)
update Salary
set dateofbirth = DATEADD(day, -1, dateofbirth)
where dateofbirth between SYSDATETIME() and cast('2018.01.01' as date)









