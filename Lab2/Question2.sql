--LAB2- QUESTION12

1]  create table Emp( Eno INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, Ename VARCHAR(10), Phone_no INT(10), Desg VARCHAR(10), salary INT(7), age INT(3),country VARCHAR(10));

 
2]  insert into Emp( Ename, Phone_no, Desg, salary, age,country) values (Emp1, 9999999999, Software developer, 75000, 22, India);

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp2",1111111111,"Head Manager", 10000000, 50,"UK");

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp3",1212121212,"UI designer", 900000, 25,"Canada");

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp4",2222222222,"Android developer","40000",24,"Japan");

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp5",3333333333,"Backend developer","41000000000",56,"North america");

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp6",4444444444,"Mentor","35000",45,"china");

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp7",5555555555,"Data analyst","10101010",30,"India");

 insert into Emp( Ename, Phone_no, Desg, salary, age,country) values ("Emp8",6666666666,"HR","67000",38,"England");


3]  create table emp_new like Emp;
    insert emp_new select * from Emp;

4]  select * from Emp where salary < 100000;

5]  select Eno as Eid,Ename as Emp_name from Emp;

6] select * from Emp where (salary >=20000 and salary <=50000) and not (Eno = 111 and Eno = 112);

7]  select Ename,Desg from Emp where Ename like "a%" and length(Ename) >= 4;

8]  select count( distinct(country)) from Emp;

9] select * from Emp where salary = ( select min(salary) from Emp);

10]  update Emp set salary = salary*0.25 where salary < 60000;

11] select cname from Emp;








