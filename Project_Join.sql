USE Project
GO

--Create a table called Person
create table Person (
    Person_id int identity (1, 1) primary key,
	Name nvarchar(25) not null,
	Email nvarchar(30)
)


--Insert some informations
insert into Person
values ('Ruslan', 'ruslanorucov945@gmail.com'),
       ('Emil', 'emmilramazanov12@gmail.com'),
	   ('Murad ', 'muradshirinov23@gmail.co'),
	   ('Tunar', 'tunarmuradov56@mail.ru'),
	   ('Seymur', 'seymurnebiyev99@yahoo.ru'),
	   ('Mehemmed', 'mehemmedsadiqov@mail.ru'),
	   ('Kerim ', 'kerikerimov@gmail.co'),
	   ('Anar', 'anaraggerov@yahoo.ru'),
	   ('Ibrahim', 'ibrahimbalabayov@gmail.com'),
	   ('Resul', 'resulresulov@mail.ru')


--Create a table called PassportDetails
create table PassportDetails (
      passport_id int identity (1, 1) primary key,
	  passport_number nvarchar(30) not null,
	  person_d int constraint FK_Passport_id foreign key references person(person_id)
)

insert into PassportDetails
values ( 'A100B44', 1)

 insert into PassportDetails
 values ('A101B55', 2),
         ('B200C77', 3),
		 ('C456H22', 4),
		 ('D845J89', 5),
		 ('W785L99', 6),
		 ('Y300T11', 7),
		 ('M888D22', 8),
		 ('N555R45', 9),
		 ('Z777A85', 10)

------------------------------------------------------------

--Retrieve the name and PasportNumber of each person and sort by ID in descending order
select Name, Passport_number
from Person p
inner join PassportDetails pd
   on p.Person_id = pd.Person_id
order by p.Person_id desc



--Create a stored procedure that retrieve name of person with the smallest ID
create proc Min_Person_Id
as
begin
select top (1) p.Person_id, Name, Passport_number 
from Person p
inner join PassportDetails pd
  on p.Person_id = pd.passport_id
order by Person_id
end

exec Min_Person_Id



--retreive the name of emails located in emailID column only till @ symbol
--I have created it as a procedure
drop proc if exists User_names_in_Email_Column
create proc User_names_in_Email_Column
as
begin
select name, SUBSTRING(Email, 1, CHARINDEX('@', email)-1) user_names from Person
end

exec User_names_in_Email_Column



--Retrieve the person that don't have passportr_number
alter proc [dbo].[Persons_without_Passportdetail]
as
begin
   select name
   from Person p
   left join PassportDetails pd
       on pd.person_id  = p.Person_id
   where passport_number is null
end

exec persons_without_passportdetail


--Retrieve the name of person that passport_number starts with A
alter proc PassporNumber_starts_with_A
as
begin
   select name, passport_number
   from Person p
   inner join PassportDetails pd
       on pd.person_id  = p.Person_id
   where passport_number like 'A%'
end

exec [dbo].[PassporNumber_starts_with_A]
