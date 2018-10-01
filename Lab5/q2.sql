--create table employee
create table Employee_lab5(Fname varchar(100), Lname varchar(100), EID int(100) primary key, start_date date, office varchar(100),
	                       salary int(100), Dno int(100), Bonus int(100), email varchar(100));

--insert values
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("John", "Taylor", 1777, "2014-04-13", "Chicago", 20000, 4, 400, "jtaylor@yahoo.com");
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("Trevor", "Williams", 1945, "1980-06-23", "London", 55055, 4, 1000, "trev_william@gmail.com");
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("Zoe", "Johnson", 2050, "1992-06-23", "Paris", 55055, 5, 2000, "zoe777@msn.com");
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("Kathy", "Franklin", 2051, "2013-06-29", "Chicago", 20000, 5, 0, "kathyfrank@gmail.com");
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("Trevor", "Jacob", 2398, "1999-06-23", "London", 55055, 4, 0, "travorJ235@aol.com");
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("John", "Owens", 7777, "2004-12-04", "London",130000, 4, 3500, "mailjude@yahoo.com");
insert into Employee_lab5(Fname, Lname, EID, start_date, Office, salary, DNO, Bonus, email) 
	        values("Alice", "Bright", 8888, "1973-12-19", "London", 111114, 7, 3000, "ab23@gmail.com");


--query1
select a.salary from (select distinct salary from Employee_lab5) as a order by salary limit 1,1;

--query2
select substring_index(email,'@',1) as username from Employee_lab5;


