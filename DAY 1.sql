---DAY 1 ---

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