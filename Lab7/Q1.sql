-------------------------------------------Table Creation -----------------------------------------------------------------------------
create table Order1(Id int not null primary key auto_increment, 
	                OrderDate date not null, 
	                OrderNumber int not null, 
	                CustomerId int not null, 
	                TotalAmount int not null, 
	                foreign key(CustomerId) references Customer(Id));

create table Customer1(Id int not null primary key auto_increment, 
	                   Fname varchar(20) not null, 
	                   Lname varchar(20) not null, 
	                   city varchar(20) not null, 
	                   country varchar(20) not null, 
	                   phone int not null);

create table Order_Item1(id int not null primary key auto_increment, 
	                     order_id int not null, 
	                     ProductId int not null, 
	                     unitprice int not null, 
	                     quantity int not null,
	                     foreign key(order_id) references Order1(Id),
	                     foreign key(ProductId) references Product1(Id));

create table Product1(Id int not null primary key auto_increment, 
	                  Productname varchar(20) not null, 
	                  supplierid int not null, 
	                  unitprice int not null, 
	                  package int not null, 
	                  isDiscontinued varchar(20) not null,
	                  foreign key(supplierid) references Supplier1(id));

create table Supplier1(id int not null primary key auto_increment, 
	                   companyname varchar(20) not null, 
	                   contactname varchar(20) not null, 
	                   city varchar(20) not null, 
	                   country varchar(20) not null, 
	                   phone int not null, 
	                   Fax int not null);

-----------------------------------------------------Tuple Insertion----------------------------------------------------------

insert into Customer1(Fname,Lname,city,country,phone) values
	                  ('fgd','rew','delhi','usa',987654321),
	                  ('fd','ew','london','uk',987654321),
	                  ('fddhy','esfw','tokyo','japan',787654321),
	                  ('fdhy','sfw','washington','usa',787654321),
	                  ('fdhy','sfw','london','uk',754654321);

insert into Product1(Productname,supplierid,unitprice,package,isDiscontinued) values
	                 ('cvac',1,30,12,'yes'),
	                 ('cva',2,60,2,'no'),
	                 ('varee',3,10,123,'yes'),
	                 ('array',4,90,13,'yes'),
	                 ('Tiku',4,75,9,'yes'),
	                 ('Tikul',5,55,14,'no');

insert into Order1(OrderDate,OrderNumber,CustomerId,TotalAmount) values
	                 ('2018-12-8',1,1,1234),
	                 ('2018-12-4',2,2,4234),
	                 ('2018-04-12',3,3,234),
	                 ('2015-04-08',4,4,2000),
	                 ('2018-11-28',5,5,1200);

insert into Order_Item1(order_id,ProductId,unitprice,quantity) values
	                   (1,1,200,90),
	                   (2,1,300,150),
	                   (3,2,600,150),
	                   (3,3,600,230),
	                   (4,3,300,500);

insert into Supplier1(companyname,contactname,city,country,phone,Fax) values
	                 ('company1','name1','dvg','usa',987654321,987654321),
	                 ('company2','name2','baker','uk',987654321,987654321),
	                 ('company3','name3','tokyo','japan',987654321,987654321),
	                 ('company4','name4','california','usa',987654321,987654321),
	                 ('company5','name5','london','uk',987654321,987654321);


-------------------------------------------------------------Queries--------------------------------------------------------------------

--Query1
select * from Supplier1 where country = "usa" or country = "uk" or country = "japan"; 

+----+-------------+-------------+------------+---------+-----------+-----------+
| id | companyname | contactname | city       | country | phone     | Fax       |
+----+-------------+-------------+------------+---------+-----------+-----------+
|  1 | company1    | name1       | dvg        | usa     | 987654321 | 987654321 |
|  2 | company2    | name2       | baker      | uk      | 987654321 | 987654321 |
|  3 | company3    | name3       | tokyo      | japan   | 987654321 | 987654321 |
|  4 | company4    | name4       | california | usa     | 987654321 | 987654321 |
|  5 | company5    | name5       | london     | uk      | 987654321 | 987654321 |
+----+-------------+-------------+------------+---------+-----------+-----------+

--Query2
select * from Product1 where unitprice not in (10,20,30,40,50);

+----+-------------+------------+-----------+---------+----------------+
| Id | Productname | supplierid | unitprice | package | isDiscontinued |
+----+-------------+------------+-----------+---------+----------------+
|  2 | cva         |          2 |        60 |       2 | no             |
|  4 | array       |          4 |        90 |      13 | yes            |
|  5 | Tiku        |          4 |        75 |       9 | yes            |
|  6 | Tikul       |          5 |        55 |      14 | no             |
+----+-------------+------------+-----------+---------+----------------+

--Query3
select Fname,Lname from Customer1,Supplier1,Order1,Order_Item1,Product1 where Customer1.country = Supplier1.country and Product1.supplierid = Supplier1.id and
                                                               Order_Item1.ProductId = Product1.Id and Order_Item1.order_id = Order1.id and
                                                               Order1.CustomerId = Customer1.id;
                                                                              
+-------+-------+
| Fname | Lname |
+-------+-------+
| fgd   | rew   |
| fddhy | esfw  |
+-------+-------+

--Query4
select * from Order1,Customer1 where Order1.CustomerId=Customer1.Id;

+----+------------+-------------+------------+-------------+----+-------+-------+------------+---------+-----------+
| Id | OrderDate  | OrderNumber | CustomerId | TotalAmount | Id | Fname | Lname | city       | country | phone     |
+----+------------+-------------+------------+-------------+----+-------+-------+------------+---------+-----------+
|  1 | 2018-12-08 |           1 |          1 |        1234 |  1 | fgd   | rew   | delhi      | usa     | 987654321 |
|  2 | 2018-12-04 |           2 |          2 |        4234 |  2 | fd    | ew    | london     | uk      | 987654321 |
|  3 | 2018-04-12 |           3 |          3 |         234 |  3 | fddhy | esfw  | tokyo      | japan   | 787654321 |
|  4 | 2015-04-08 |           4 |          4 |        2000 |  4 | fdhy  | sfw   | washington | usa     | 787654321 |
|  5 | 2018-11-28 |           5 |          5 |        1200 |  5 | fdhy  | sfw   | london     | uk      | 754654321 |
+----+------------+-------------+------------+-------------+----+-------+-------+------------+---------+-----------+

--Query5
select Productname,Order_Item1.quantity,Order_Item1.unitprice from Order_Item1,Product1 where Order_Item1.ProductId=Product1.Id; 

+-------------+----------+-----------+
| Productname | quantity | unitprice |
+-------------+----------+-----------+
| cvac        |       90 |       200 |
| cvac        |      150 |       300 |
| cva         |      150 |       600 |
| varee       |      230 |       600 |
| varee       |      500 |       300 |
+-------------+----------+-----------+

--Query6
select * from Customer1 where Id not in(select CustomerId from Order1 where Customer1.Id=CustomerId);

Empty set 

--Query7
select Fname,Lname from Customer1,Supplier1,Order1,Order_Item1,Product1 where Customer1.country = Supplier1.country and Product1.supplierid = Supplier1.id and
                                                               Order_Item1.ProductId = Product1.Id and Order_Item1.order_id = Order1.id and
                                                               Order1.CustomerId = Customer1.id;

+-------+-------+
| Fname | Lname |
+-------+-------+
| fgd   | rew   |
| fddhy | esfw  |
+-------+-------+


--Query8
select c1.Fname,c1.Lname from Customer1 c1,Customer1 c2 where c1.city=c2.city and c1.country=c2.country and c1.Id!=c2.Id;

+-------+-------+
| Fname | Lname |
+-------+-------+
| fdhy  | sfw   |
| fd    | ew    |
+-------+-------+

--Query9
select Fname,Lname,contactname from Customer1,Order1,Order_Item1,Product1,Supplier1 where Customer1.Id=Order1.CustomerId and Order1.Id=Order_Item1.order_id and Order_Item1.ProductId=Product1.Id and Product1.supplierid=Supplier1.id;

+-------+-------+-------------+
| Fname | Lname | contactname |
+-------+-------+-------------+
| fgd   | rew   | name1       |
| fd    | ew    | name1       |
| fddhy | esfw  | name2       |
| fddhy | esfw  | name3       |
| fdhy  | sfw   | name3       |
+-------+-------+-------------+

--Query10
 select Productname from Product1,Order_Item1 where Product1.Id=Order_Item1.ProductId and Order_Item1.quantity>100;

 +-------------+
| Productname |
+-------------+
| cvac        |
| cva         |
| varee       |
| varee       |
+-------------+

--Query11
 select Fname,Lname,count(Order1.Id) from Customer1,Order1 where Customer1.Id=Order1.CustomerId group by Order1.CustomerId;

 +-------+-------+------------------+
| Fname | Lname | count(Order1.Id) |
+-------+-------+------------------+
| fgd   | rew   |                1 |
| fd    | ew    |                1 |
| fddhy | esfw  |                1 |
| fdhy  | sfw   |                1 |
| fdhy  | sfw   |                1 |
+-------+-------+------------------+

--Query12
select Productname from Product1,Order_Item1 where Product1.Id=Order_Item1.ProductId and Order_Item1.quantity=1;

Empty set
