
USE Project
GO

--Create a table called Category (category_id,category_name)
create table category (
     category_id int identity(1, 1) primary key,
	 category_name nvarchar(25)
)

--Insert information to Category table ,category name can be contain only TV, Audio, Computer, Photo_Video. 
--You need to identify Primary and Foreign keys
insert into category
values ('TV'),
       ('AUDIO'),
	   ('Computer'),
	   ('Photo_Video')

-----------------------------------------------------------

--Create a table called Electronics (id, category_id, e_name, date, price)
Create table Electronics (
     Elec_id int identity(1, 1) primary key,
	 category_id int constraint FK_Electronics_Category_id foreign key references category(category_id),
	 e_name nvarchar(40),
	 date smalldatetime,
	 price money
)

--Insert 15 rows to the Electronics table, you need to insert same category a few time
insert into Electronics
values (1, 'Samsung', '20210820', 500)

insert into Electronics
values (2, 'Redmi Airdots 2', '20210821', 40),
        (3, 'Asus Vivobook', '20210821', 1400),
		(4, 'Sonny', '20210822', 900),
		(1, 'Beko', '20210823', 950),
		(2, 'Samsung buds', '20210824', 200),
		(3, 'Acer', '20210825', 1500),
		(4, 'GVM Bi-Color LED Ring Light', '20210826', 150),
		(1, 'LG', '20210826', 600),
		(2, 'Melomania 1+', '20210826', 250),
		(3, 'HP', '20210827', 1300),
		(4, 'Panasonic Lumix DMC-GX85', '20210828', 700),
		(1, 'Redmi', '20210829', 1000),
		(2, 'Evo 75', '20210830', 80),
		(3, 'Lenova', '20210830', 1500),
		(4, 'FUJIFILM INSTAX Mini 40 Instant Film Camera', '20210831', 9500)

------------------------------------------------------------------


 
---Create a view called VW_Expensive_Elec
--The view should save name, category, and price of the most expensive products 
alter view VW_Expensive_Elec
as
select category_name, e_name, max_price
 from
      (select c.category_name, e_name, max(price) max_price,
	           dense_rank() over(partition by category_name order by max(price) desc) row_count	    
       from Electronics e
       inner join category c
           on e.category_id = c.category_id
       group by c.category_name, e_name) as d
where row_count = 1

select * from VW_Expensive_Elec


--Retrieve the name and price of the cheapest product
create view VW_Min_price_elec
as
select e_name, min(price) min_price
from Electronics
group by e_name
order by min_price
offset 0 row 
fetch first 1 row only;

select * from VW_Min_price_elec



--Retrieve the average price by category
Create view VW_Avg_prices_by_category
as
select category_name, avg(price) avg_price
from Electronics e
inner join category c
  on c.category_id = e.category_id
group by category_name;

select * from VW_Avg_prices_by_category



--Retrieve the first 5 products that have been manufactured earlier than others
create view VW_First_5_sold_product
as
select *
from Electronics
order by date
offset 0 rows
fetch first 5 row only


select * from VW_First_5_sold_product





--Create a view called VW_New and this view should save the information
--of electronics table and category name
alter view VW_New 
as
select e.category_id, category_name, Elec_id, e_name, date, avg(price) avg_price
from Electronics e
inner join category c
   on e.category_id = c.category_id
group by e.category_id, category_name, Elec_id, e_name, date

select * from VW_New




--Retrieve average price by category name
SELECT category_name, avg(price)
FROM VW_New
GROUP BY category_name




--Retrieve the 3 most expensive products from the elektronic products
create view VW_Most_Expensiv_3_Electronic
as
select Elec_id, e_name, max(price) max_price
from Electronics
group by Elec_id, e_name
order by max_price desc
offset 0 row 
fetch first 3 rows only

select * from VW_Most_Expensiv_3_Electronic



--Also we can use view that we have created before
select top(3) e_name, max(price) max_price
from vw_new
group by e_name
order by max_price desc
