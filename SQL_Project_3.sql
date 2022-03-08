 -----------SQL Project 3.-------------

use SQL_Projects
go

create table info_sales
( trans_id int primary key,
  region nvarchar(100),
  country nvarchar(100), 
  city  nvarchar(80),
  amount int 
);


insert into info_sales values (1,'Asia','UAE','Abu Dhabi',400) ;
insert into info_sales values (2,'Asia','UAE','Abu Dhabi',600) ;
insert into info_sales values (3,'Asia','UAE','Duabi',300) ;
insert into info_sales values (4,'Asia','UAE','Duabi',120) ;
insert into info_sales values (5,'Africa','Egypt','Cairo',309) ;
insert into info_sales values (6,'Africa','Egypt','Cairo',123) ;
insert into info_sales values (7,'Europe','Spain','Madrid',109) ;
insert into info_sales values (8,'Europe','Spain','Madrid',153) ;
insert into info_sales values (9,'Europe','Spain','Barcelona',193) ;
insert into info_sales values (10,'Asia','Jordan','Amman',300) ;
insert into info_sales values (11,'Asia','Jordan','Zarqa',120) ;

select * from info_sales


--Find the total number of population for each region
select region, sum(amount) total_population
from info_sales
group by region



--Find the total number of population for each region except Europe
select region, sum(amount) tottal_population
from info_sales
where region <> 'Europe'
group by region



--Find the average population for each region
select region, avg(amount) avg_population
from info_sales
group by region



--Find the total number of population in Egypt, Jordan, Spain
select city, country, sum(amount) total_population 
from info_sales
where country in ('Egypt', 'Jordan', 'Spain')
group by city, country




--Find total number of tourists in on of the following countries
--UAE, Jordan, Spain or Asia region
select region, country, sum(amount) tourists_num
from info_sales
where country in ('UAE', 'Jordan', 'Spain') or region = 'Asia'
group by region, country



--Find the number of population for each city
select city, sum(amount) number_of_population
from info_sales
group by city



--Retrieve the name and number of people for the region with the lowest population 
select top(1) region, sum(amount) population
from info_sales
group by region
order by population



--Retrieve 3 cities and their population number with the highest population 
select city, sum(amount) population
from info_sales
group by city
order by population desc
offset 0 row
fetch first 3 rows only


--her  qite,olkeye gore ehali sayi tapmaq
--Find the total number of population for each region and country
select region, country, sum(amount) population
from info_sales
group by region, country
order by region, country



--Pivot table
select *
from (
       select region,
	          country,
			  amount
	   from info_sales
) as d
pivot (
        sum(amount) for region in ([Asia],
		                           [Africa],
								   [Europe] )
) as pivot_table