USE TSQLV4
GO

--1.Figure out the gender ratio in the different departments of the company X. 
--Before that, you need to obtain the number of male and female employees who work in this company
WITH Male_Female AS (
      SELECT titleofcourtesy,
         CASE titleofcourtesy
            WHEN 'Mrs.' THEN 'Male'
	        WHEN 'Mr.' THEN 'Male'
	        WHEN 'Ms.' THEN 'Female'
	        ELSE 'Unknown'
         END AS gender
	  FROM HR.Employees
	  )

SELECT gender, COUNT(*) num_gender
FROM Male_Female
GROUP BY gender




--2.HR department is preparing prizes for the employees who work in the company longer than 5 years.
--They need the full name (first name and last name in one column) of those employees.
SELECT CONCAT(firstname, ' ', lastname) fullname,
       DATEDIFF(YEAR, hiredate, CAST(SYSDATETIME() AS DATE)) numyear
FROM HR.Employees
WHERE DATEDIFF(YEAR, hiredate, CAST(SYSDATETIME() AS DATE)) > 5




--3.Your job is to reveal the oldest and youngest employees in the company and 
--display their full name in order to determine the working age group and employment rate by age group. 
WITH EmpAge AS ( 
       SELECT CONCAT(firstname, ' ', lastname) fullname,
              DATEDIFF(YEAR, birthdate, SYSDATETIME()) workerage
       FROM HR.Employees )

SELECT fullname,
  CASE
    WHEN workerage <= 45  THEN 'Young worker'
	WHEN workerage  > 45  THEN 'Oldest worker'
  END AS agegroup
FROM EmpAge




--4.It is required to remove the null values from the ‘fax’ column.
--It is good practice to replace these values with phone numbers.
SELECT phone,
       coalesce(fax, phone) new_fax
FROM Sales.Customers




--5. According to the normalization rules for table construction,
--it is not good practice to place 2 different data in one column. 
--It is observable that the contact name column contains 2 data: 
--first and last name of the customers. You are assigned to separate this data
--and display the first name and last name as two different columns.
select contactname,
       LEFT(contactname, CHARINDEX(',', contactname)-1) firstname,
	   RIGHT(contactname, LEN(contactname) - LEN(left(contactname, CHARINDEX(',', contactname)+1))) lastname
from Sales.Customers
