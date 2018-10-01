
--employee table
create table employee ( employee_name varchar(100) primary key not null, street varchar(100) not null, city varchar(100) not null);
insert into employee( employee_name, street, city) values("Hardik", "b510-mt2", "palanpur");
insert into employee( employee_name, street, city) values("chetan", "mt2", "gandhinagar");
insert into employee( employee_name, street, city) values("bobby", "mt1", "nagpur");
insert into employee( employee_name, street, city) values("Mishal", "mt1", "vadodara");

--company table
create table company ( company_name varchar(100) not null, city varchar(100) not null, primary key(company_name, city));
insert into company ( company_name, city) values ("Hp", "Banglore");
insert into company ( company_name, city) values ("Flipkart", "Hyderabad");
insert into company ( company_name, city) values ("Microsoft", "Hyderabad");
insert into company ( company_name, city) values ("MMT", "Gurgaon");


--works table
create table works ( employee_name varchar(100) not null, company_name varchar(100) not null, salary int not null, primary key(employee_name, company_name), foreign key(employee_name) references employee(employee_name) on delete cascade, foreign key(company_name) references company(company_name) on delete cascade);
insert into works(employee_name, company_name, salary) values("Hardik", "Hp", 10000);
insert into works(employee_name, company_name, salary) values("chetan", "MMT", 20000);
insert into works (employee_name, company_name, salary) values("bobby", "Microsoft", 30000);
insert into works(employee_name, company_name, salary) values("Mishal", "Flipkart", 40000);


--manages table
create table manages ( employee_name varchar(100) not null primary key, manager_name varchar(100) not null, foreign key(employee_name) references employee(employee_name) on delete cascade, foreign key(manager_name) references employee(employee_name) on delete cascade);
insert into manages (employee_name, manager_name) values("Hardik","booby");
insert into manages (employee_name, manager_name) values("Mishal","booby");
insert into manages (employee_name, manager_name) values("Chetan","Mishal");


--query-a
select employee.employee_name,street,city from employee,works where employee.employee_name = works.employee_name and works.company_name="State bank of india" and works.salary>10000;

--query-b
select employe.employee_name from employee,works,company where employee.employee_name = works.employee_name and works.city = company.city and works.company_name = company.company_name;

--query-c
select e1.employee_name from employee as e1,employee as e2, manages as m where e1.employee_name = m.employee_name and e2.employee_name = m.manager_name and e2.city = e1.city and e2.street = e1.street;
  
--query-d
select employee_name from works where company_name!="State bank of india";

--query-e
select employee_name from works where salary > all(select salary from works where company_name="ICICI"); 

--query-f ------doubt
--select s.company-name from company s where exists ((select city from company where company-name = 'ICICI') except (select city from company t where s.company-name = t.company-name))
select company_name from company where city = (select city from company where company_name="ICICI");

--query-g
select employee_name from works w1 where salary > (select avg(salary) from works w2 
                                                where w1.company_name= w2.company_name); 

--query-h                                                
select company_name from works group by company_name having sum(salary) <= all (select sum(salary) from works group by company_name);


