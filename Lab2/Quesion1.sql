--LAB2- QUESTION1

1]  create table Customers(CID INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, cname VARCHAR(20), age INT(3), address  
    VARCHAR(20), city VARCHAR(10), postalcode INT(6),Gender VARCHAR(6), country VARCHAR(10));
 
2-3] insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Hardik", 19, "Nandanvan", "Palanpur" 385001,"Male","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Yash", 20, "Something", "Banglore",400000,"Male","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Rohit", 21, "aaaaa", "Jammu",500000,"Male","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("gka", 18, "pppp", "London",100000,"Male","UK");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("abhi", 20, "yyyy", "lassw",200000,"Male","Nepal");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Kundan", 21, "Iscon", "Hyderabad",700000,"Male","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Shushant", 29, "Gloabl street", "Banglore",800000,"Male","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("xyz", 25, "street jekf", "Uganda",300000,"Female","South Africa");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("qqqq", 22, "llll", "Hyderabad",700000,"Female","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("last_one", 20, "Last steer", "Mumbai",750000,"Female","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("i_have_no_address", 90, "", "Mp",350000,"Female","India");
 
 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Person1", 56,"H nagar","Manglore",360000,"Female","India");


 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Person2", 57,NULL,"Delhi",360050,"Female","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Person3", 58,"K nagar","Manglore",363050,"Male","India");

 insert into Customers(cname,age,address,city,postalcode,Gender,country) values("Person4", 28,"Km nagar","Manglore",360000,"Male","India");


4]  select * from Customers where (city="Banglore" or city="Hyderabad") and country="India";

5]  select * from Customers where address="";

6] select count(*) as number from Customers where Gender="Female";

7] select * from Customers where country="India" LIMIT 3;

8]  select * from Customers order by age;
    select cname from Customers order by age desc;

9] select * from Customers where cname like "%a" or cname like "%h";

10] select * from Customers where cast(postalcode as CHAR) LIKE "3%" and length(cast(postalcode as CHAR)) = 6 and (cname like "S%" or cname like "T%" or cname like "P%");

11] select * from Customers where(city="Banglore" or city="Pune" or city="Chennai");







