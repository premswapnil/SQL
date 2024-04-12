--------------------------------------------------------------------DAY 1 --------------------------------------------------------------

Create database testdb;

use testdb;

create table employee(
ID int,
CName varchar(255),
City varchar(255),
Salary int
);

insert into employee(ID, CName, City, Salary)
values(1,'XYZ','Mumbai',50000)

insert into employee
values(2, 'ABC', 'Chennai',60000)

insert into employee
values(3,'Guru','Hyd', 750000),(4, 'Prasad','Benhaluru',65000)

select * from employee;

select ID,CName from employee;

---------------------------------------------------------------------------- DAY-2 --------------------------------------------------------------------

---TEST---

create database BankDBT;

use BankDBT;

create table customer(
ID int,
Age int,
Job varchar(255),
marital varchar(255),
Education varchar(255)
);

insert into customer
values (1,30,'Unemployed','Married','Primary'),(2,33,'Services','Married','Secondary'),
(3, 35, 'Management','Single', 'Teritary'),(4, 30, 'Blue-Collar', 'Single', 'Teritary')

select * from customer;

insert into customer
values (1,30,'Unemployed','Married','Primary'),
(2,33,'Services','Married','Secondary'),
(3, 35, 'Management','Single', 'Teritary'),
(4, 30, 'Blue-Collar', 'Single', 'Teritary')

select * from customer;

-----------------------------------------------------------------------------------------------------------------------------------------------------

/* distinct*/

select distinct * from customer;

use BankDBT;

insert into customer
values (1,40,'Unemployed','Married','Primary')

select distinct * from customer;

select distinct ID from customer;

select count(distinct ID) from customer;

use BankDBT;
insert into customer(ID)
values (11)

select * from customer;


---Identity---

create table products(
product_id int,
product_name varchar(255)
);

insert into products
values (1, 'TV'),(2, 'AC')

select * from products;

create table product1(
product_id int identity (1,1) primary key,
product_name varchar(255)
);

insert into product1
values ('TV'),('AC')

select * from product1;

---create a table product2---
create table product2(
product_ID int identity (1,1) primary key,
product_name varchar(255),
City_name varchar(255),
)

insert into product2
Values('TV', 'HYD'),('AC', 'Delhi')

select * from product2;

insert into product2(product_name)
Values('TV')

select * from product2;

create table product3(
Product_id int identity(1,1) primary key,
product_name varchar(255),
city_name varchar(255) not null,
)

insert into product3(product_name)
values ('TV')

select * from product3;

select * from INFORMATION_SCHEMA.TABLES


--- Default Concept---

create table product4
(Product_ID int identity (1,1) primary key,
Product_Name varchar(255),
City_Name varchar(255),
)

insert into product4
values ('TV', 'HYD'), ('AC', 'Hyd'), ('Radio', 'Hyd')

select * from product4;

create table product5
(Product_ID int identity (1,1) primary key,
Product_Name varchar(255),
City_Name varchar(255) default 'Bengaluru',
)

insert into product5(Product_Name)
values ('TV'),('AC'),('Radio')

Select * from product5;

---------------------------------------------- DAY 3 ----------------------------------------------------------
---1) Identity
---2) Default
---3) Not Null
---4) Computed Column

---Data Types---
---a. bigint (8 bytes), b. int (4 bytes), c. smallint (2bytes)
---1 bytes = 

use BankDBT;

---Create New Table

create table product6
(Product_ID int identity(1,1) primary key,
No_Of_Chocolates smallint,
price_Per_Chocolate int,
Total_Price_Chocolate int,
Total_Price as No_Of_Chocolates * Price_Per_Chocolate);

-- Insert Into
insert into product6 (No_Of_Chocolates, Price_Per_Chocolate)
values(25, 2), (30, 3)

--Display the rows in a table
select * from product6;

select distinct No_Of_Chocolates from product6

--f5 key

---- If you want to see the values ues "OUTPUT CLAUSE".

insert into product6 (No_Of_Chocolates, Price_Per_Chocolate)
values(25, 2), (30, 3)

use BankDBT;

insert into product6 output
inserted.No_Of_Chocolates,
inserted.price_Per_Chocolate
values(25, 2), (30, 3)

----------------------------------REVISION ---------------------------------------
---1. 

Select * from Customer

select * from product4

---ADD COLUMN---

alter table product4
add Sales_Date date

select * from product4

insert into Product4 (Sales_Date)
values ('2024-05-26')

select * from product4

alter table product4
add Company_Name char(255),
	Manu_Date date

select * from product4

---MODIFY The Column Data Types

alter table product4 alter column Company_Name varchar(255)
alter table product4 alter column Manu_Date datetime

insert into product4 (Company_Name, Manu_Date)
values('Delhi', '2024-05-22 16:12:11')

select * from product4;

---Delete the Column ---

alter table product4
drop column Sales_Date,
	 column Company_Name,
	 Column Manu_Date

select * from product4;

---Rename the Column ------
---CITY Name ---> C_Name
---EXEC = Execute a store Procedure

exec sp_rename 'product4.City_Name','C_Name','column';

select * from product4;

exec sp_rename 'product4.Product_Name','P_Name','column';

select * from product4;

---------- Rename the Table -------------------
-- product4 to product44

exec sp_rename 'product4','product44';

select * from product44;

exec sp_rename 'product44','product4';

select * from product4;


---------------------------------------------------------------------------------------- DAY 4 ---------------------------------------------------------------
use BankDBT;

select * from product6;

----------- Drop Table -----------

drop table product6;

--- The information also lost when you drop table ----------
--- Suppose if you want to delete all the infoemation/records but not Table ------

------- Truncate Table -----------
--- To delete all rows from tble at a time, We Cannot delete a specific row from the table ----

select * from product2;

truncate table product2;

select * from product5;

drop table product1,product2,product3,product4,product5

select * from products;

--Top 3 records i want to display
--Select top

-----* IN MYSQL -------> LIMIT
-----* Oracle ---------> FETCH first 4

select top 3 * from products;

select * from products;

select * from products
where product_name='TV';

select * from products
where product_id = 3;

select * from products
where product_id > 3;

select * from products
where product_id < 3;

select * from products
where product_id >= 3;

select * from products
where product_id >= 3 and product_name='TV';

-- AND Means two condition satisfaction
-- OR Means consider two condition

select * from products
where product_id >= 3 or product_name='TV';

--- IN ---> it shows the value pid =1 & pid =5

select * from products
where product_id in (1,5);

--- NOT IN ---> it omits the value pid =1 & pid =5

select * from products
where product_id not in (1,5);

--- BETWEEN ---> it shows the value pid =1 to pid =5 (it consider 1 & 5 also)

select * from products
where product_id between 1 and 5;

----------******** UPDATE
--CASE 1 -:
--Insert into means value inserted at next row
-- Update means want to add value at specific Place

create table product1(
product_id int identity (1,1) primary key,
product_name varchar(255)
);

insert into product1
values ('TV'),('AC')

select * from product1;

----UPDATE Product Name = " LAPTOP"

update product1
set product_name='Laptop';

select * from product1;

---CASE --> 2  --> Apply with condition

update product1
set product_name='Pendrive'
where product_id=4

select * from product1;

alter table product1
add city varchar(255);

select * from product1;

--- Update City Value with HYD Between 2 and 5

update product1
set city='HYD'
where product_id between 2 and 5;

select * from product1;

---> Update city value with channai where productid = 5 and pname - pendrive

update product1
set city='Channai'
where product_id=5
or product_name='pendrive'

Select * from product1;

------------ Case 3 
-- I want to replace mu Null values with Blr

update product1
set city='Blr'
where city is Null

select * from product1;

------------------------------------------------------------------------ DAY 5 --------------------------------------------------------------------------------
use BankDBT1;

select * from bank;

select age from bank;

--- What are the unusual things in this dataset
--- "age" (With Quotation)
--- Whenever data types written in "age" you need to give in (Tripple Quotes) """ age""" for reading the data.

select """age""" from bank;

exec sp_rename 'bank."""age"""', 'age', 'column';

select * from bank;

select age from bank;

---Count of the Dataset

select count (*) from bank;

select * from bank;
where """y""" = '"no"'

select count (*) from bank;
-- there are total 9042 values are there
-- in Actual dataset size 4521
-- you loaded data set two times
-- for the first time 4052 values fir all the column loaded	
-- for the second time except age values all other column values are loaded
-- Second time age values appended as Null values

select count (*) from bank
where age is NULL;

-- Your dataset column and table should match
-- every time you uploaded your data set, you are getting duplicate records

-- Your dataset column and table should match
-- every time you uploaded your dataset, you are getting duplicate records

select * from bank;

-- deleted old record
-- and check for both data and table column are match or not
-- so here age column is not matched, so it is ignoring
-- that means appending NULL Values

use marketing;
select * from bank;

--Q1:> How many types of Jobs available

select distinct(job) from bank;

select count (distinct job) from bank;

--- 12 categories are there under the jobs column
--- alias 
-- as
select count (distinct job) as types_of_jobs
from bank;

--- Q2:> repeat for education
--- No_Of_Levels of Education using alias

select distinct(education) from bank;
select count (distinct education) from bank;
select count (distinct education) as Levels_of_Education
from bank;

------------------------------------------------------------- DAY 6 -------------------------------------------------------------
use Marketing;

select * from bank;
-- Q1> How many types of Jobs available

select distinct job from bank;
select count(distinct job) from bank;
--alias as 
select count(distinct job) as types_of_jobs from bank;

--Q2:> You have a column nme called Balance in bank dataset
-- Avg of the balance

select balance from bank;

select avg(balance) from bank;

select avg(balance) as Avg_Balance from bank;

--Q3> if you want to get avg balance wrt age
-- group bt (Tpoic)--

select avg(balance) as avg_balance, age from bank
group by age

select balance, age from bank
where age=84;

select balance, age from bank
where age=87;

select balance, age from bank
where age = 70;

select sum(balance) as sum_70 from bank
where age =70

select avg(balance) as avg_70 from bank
where age = 70;

select avg(balance) as avg_balance from bank; --> Only one Value
Select sum(balance) as sum_balance from bank;-->  Only one value
select count(balance) as count_balance from bank;-->  Only one value
select max(balance) as max_balance from bank;-->  Only one value
select min(balance) as min_balance from bank;-->  Only one value
Select age from bank; --> Here 4521 records

select age, avg(balance) as avg_balance,
sum(balance) as Sum_balance
from bank group by age;

select * from bank;

--------Group By Education ---------

select education, avg(balance) as Avg_Balance,
sum(balance) as Sum_Balance,
count(balance) as Count_Balance,
max(balance) as Max_Balance,
min(balance) as Min_Balance
from bank group by education;

select education, age,
	avg(balance) as Avg_Balance,
	sum(balance) as Sum_Balance,
	count(balance) as Count_Balance,
	max(balance) as Max_Balance,
	min(balance) as Min_Balance
	from bank
	group by education, age
	order by education

select education, age,
	avg(balance) as Avg_Balance,
	sum(balance) as Sum_Balance,
	Count(balance) as Count_Balance,
	max(balance) as Max_Balance,
	min(balance) as Min_Balance
	from bank
	where age=30
	group by education, age

--- Round Off ---
select avg(balance) as Avg_Balance from bank;
select Round(avg(balance),0) as Avg_Balance from bank;
select Round(avg(balance),1) as Avg_Balance from bank;
select Round(avg(balance),2) as Avg_Balance from bank;

--- ORDER BY CONCEPT ------
-- ascending order or descending order

select age, marital from bank
order by age;

select age, marital from bank
order by age asc;

select age, marital from bank
order by age desc;

select age, marital from bank
order by marital; ---> Alphabatival Order

select age, marital from bank
order by marital desc;

select age,
	avg(balance) as Avg_Balance,
	sum(balance) as Sum_Balance,
	Count(balance) as Count_Balance,
	max(balance) as Max_Balance,
	min(balance) as Min_Balance
	from bank
	group by age
	order by age asc

select age,
	avg(balance) as Avg_Balance,
	sum(balance) as Sum_Balance,
	Count(balance) as Count_Balance,
	max(balance) as Max_Balance,
	min(balance) as Min_Balance
	from bank
	group by age
	order by age desc

select age,day,
	avg(balance) as Avg_Balance,
	sum(balance) as Sum_Balance,
	Count(balance) as Count_Balance,
	max(balance) as Max_Balance,
	min(balance) as Min_Balance
	from bank
	where day=19 and y='"no"'
	group by age,day
	order by age,day desc

---Q > Total How many member having job type as services also those members y = no category

select * from bank;

select job,
	count(job) as Service_Count
	from bank
	where job='"services"' and y='"no"'
	group by job

-- if i want all the jobs categories number whose having y=yes

select job,
	count(*) as Job_Count
	from bank
	where y='"Yes"'
	group by job

select count(*) as Job_Count, job
	from bank
	where y='"yes"'
	group by job
	order by Job_Count

---- TOP ----
select top 3 count(*) as Job_Count, job
	from bank
	where y='"yes"'
	group by job
	order by Job_Count


select count(*) as Job_Count, job
	from bank
	where y='"yes"'
	group by job
	order by Job_Count

select max(y.Job_Count) from
	(select count(*)as Job_Count, Job
	from bank where y='"yes"'
	group by job)y

------------------------------------------------------------------DAY 7--------------------------------------------------------------

Use Marketing;

----Create a table1 ---
create table emp1(
	eid int,
	ename varchar(255),
	salary money)
---Create a Table2 ---
create table emp2(
	eid int,
	ename varchar(255),
	salary money)

select * from emp1;
select * from emp2;

---- Union ----
---Condition:>
--- all column should be same
--- data types also same
--- emp1 {10001, 10002, 10003, 10004}
--- emp2 {10004, 10005, 10006}
--- data retrived without duplicate

select * from emp1
union
select * from emp2

--order of the column should be same

select eid,ename from emp1
union
select eid, ename from emp2

select eid from emp1
union
select ename from emp2

----Union all --------
select * from emp1
union all
select * from emp2

--- intersect-----------
select * from emp1
intersect
select * from emp2

--- Except---------------
select * from emp1
except
select * from emp2

------------------------------------------------------------------------------------------------------

create database joins;
use joins;
create table students(
	STID int,
	SNAME varchar(255),
	SMAIL varchar(255),
	COURSEID int)
create table Course(
	COURSEID int,
	CNAME varchar(255),
	CFEE Decimal(6,2))

select * from students
select * from Course

--INNER ID
--Based on course id coloum join two tables with matched records
select * from
students inner join Course
on
students.COURSEID = Course.COURSEID

--Outer Join
---1> Left outer Join
 select * from students
 select * from Course

 select * from 
 Course left outer join students
 on
 students.COURSEID = Course.COURSEID

 select * from
 Course c left outer join students s
 on
 s.COURSEID = c.COURSEID

use Marketing;
select * from bank;

select count(*) as job_y_no, job from bank
where y='"no"'
group by job

select COUNT(*) as job_y_yes, job from bank
where y='"yes"'
group by job

---Query on query
select * from 
(select count(*) as job_y_no, job from bank
where y='"no"'
group by job)t1
left outer join
(select COUNT(*) as job_y_yes, job from bank
where y='"yes"'
group by job)t2
on
t1.job=t2.job

use joins
select * from 
Course left outer join students
on
students.COURSEID = Course.COURSEID

select * from 
Course right outer join students
on
students.COURSEID = Course.COURSEID

------- Full Outer Join ------

select * from 
Course full outer join students
on
students.COURSEID = Course.COURSEID

--------------------------------------------------------------------- DAY 8 ------------------------------------------------------




















