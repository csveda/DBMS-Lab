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


--create table currency
create table currency_table(Location varchar(100) primary key, currency_code varchar(100));

--insert into currency table
insert into currency_table(Location, currency_code) values("Chicago", "USD");
insert into currency_table(Location, currency_code) values("London", "GBP");
insert into currency_table(Location, currency_code) values("Paris", "EUR");

--query1
select Employee_lab5.Office,Employee_lab5.EID,Employee_lab5.salary, currency_table.currency_code from Employee_lab5,currency_table where Employee_lab5.Office=currency_table.Location;

--query2
select e1.Fname,e1.Lname,e1.EID from Employee_lab5 as e1, Employee_lab5 as e2 where e1.Fname=e2.Fname and e1.EID!=e2.EID;

--query3
select trim(trailing ".com" from substring_index(email, '@', -1)) as mailservice, count(*) as count from Employee_lab5
           group by trim(trailing ".com" from substring_index(email, '@', -1)) having count>1;


--query4
select salary-(0.05*salary) as Deduction, bonus+(salary-(0.05*salary)) as Final_salary from Employee_lab5;

--query5
select * from Employee_lab5 order by salary desc lname asc;

--query6
select Dno from Employee_lab group by Dno 
