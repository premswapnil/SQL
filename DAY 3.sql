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
















