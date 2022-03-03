create database lab_21;
use lab_21;
create table Cars(
ID integer,
VIN TEXT,
Manufacturer TEXT,
Model TEXT,
Year integer,
COLOR TEXT);
Create table Customers_Cars(
ID integer,
Name TEXT,
Phone INTEGER,
Email text,
Address TEXT,
CITY TEXT,
State_Province TEXT,
country TEXT,
postal integer);
Create table Salespersons(
ID integer,
Staff_ID text,
Name text,
Store text);
Create table Invoices(
ID integer,
Invoice_number text,
Date DATE,
Car integer,
Customer integer,
Sales_Person integer);
insert into Cars
values(0,'3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
	  (1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
      (2,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White');
select * from Cars;






