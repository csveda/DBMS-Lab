--create tables
create table customers(cid int not null primary key,
                       fname varchar(100) not null,
                       lname varchar(100) not null,
                       dob date not null,
                       joining_date date not null,
                       city varchar(100) not null,
                       state varchar(100) not null,
                       street varchar(100) not null,
                       phone_no int not null,
                       fax int not null,
                       monthly_discount int not null,
                       pack_id int,
                       foreign key(pack_id) references packages(pack_id) on delete cascade);

create table packages  (pack_id int not null primary key,
                       speed int not null,
                       start_date date not null,
                       monthly_payment int not null,
                       sid int not null,
                       grade_id int not null,
                       foreign key(sid) references sectors(sid) on delete cascade,
                       foreign key(grade_id) references pack_grade(grade_id) on delete cascade);

create table sectors (sid int not null primary key,
                       s_name varchar(100) not null);


create table pack_grade(grade_id int not null primary key,
                        gname varchar(100) not null,
                        min_price int not null,
                        max_price int not null);


--insert tuples
insert into customes(cid,fname,lname,dob,joining_date,city,state,street,phone_no,fax,monthly_discount,pack_id) values
	                (1,"Hardik","Rana","1999-07-27","2010-11-11","Ahmedabad","Gujarat","Hp colony",1111111111,22222222,10,104),
	                (2,"Indrajeet","Ratnakar","1998-10-10","2017-01-01","Banglore","Karnataka","Mac colony",3333333333,4444444444,20,105),
	                (3,"Bobby","Patil","1998-10-05","2017-12-12","Nagpur","Maharastra","Coder colony",5555555555,6666666666,30,106),
	                (4,"Himanshu","Nagdive","1998-01-01","2016-04-10","Hyderabad","Andra","Dell colony",7777777777,8888888888,40,107),
	                (5,"Chetan","Prajapati","1998-01-25","2017-09-09","Delhi","Delhi","foder colony",1212121212,1313131313,50,NULL),
	                (6,"Vichitr","Gandas","1998-01-01","2015-11-11","Jaipur","Rajsthan","Topcoder colony",1414141414,1515151515,60,108),
	                (7,"Divyansh","verma","1999-10-29","2012-11-11","Aq","Haryana","Failed colony",2121212121,6666666666,70,NULL);
	                
insert into packages(pack_id,speed,start_date,monthly_payment,sid,grade_id) values
	                (104,100,"2017-01-01",50000,10,20),
	                (105,150,"2016-01-01",40000,11,21),
	                (106,200,"2015-01-01",30000,12,22),
	                (107,250,"2014-01-01",20000,13,23),
	                (108,300,"2013-01-01",10000,14,24);


insert into sectors(sid,s_name) values
	               (10,"Business"),
	               (11,"Private"),
	               (12,"Account"),
	               (13,"Management"),
	               (14,"Public");

insert into pack_grade(grade_id,gname,min_price,max_price) values
	                   (20,"G1",1000,2000),
	                   (21,"G2",3000,4000),
	                   (22,"G3",5000,6000),
	                   (23,"G4",7000,8000),
	                   (24,"G5",9000,10000);



---------------------------------------------Queries
--query-a
SELECT cust.fname,cust.lname,cust.pack_id,pack.speed 
                                       FROM customers cust JOIN packages pack ON cust.pack_id = pack.pack_id 
 
--query-b
SELECT cust.fname,cust.lname,cust.pack_id,pack.speed FROM customers cust JOIN packages pack
                                       ON  cust.pack_id = pack.pack_id
                                       WHERE cust.pack_id IN (100, 107)
                                       ORDER BY cust.lname; 
 
--query-c
SELECT pack.pack_id , pack.speed, pack.monthly_payment, sect.s_name FROM packages pack JOIN sectors sect
                                       ON  pack.sector_id = sect.sector_id;
 
--query-d
SELECT cust.fname,cust.lname,pack.pack_id , pack.speed, pack.monthly_payment, sect.s_name FROM packages pack JOIN sectors sect
                                       ON pack.sid = sect.sid JOIN customers cust ON cust.pack_id=pack.pack_id;

--query-e
SELECT cust.fname,cust.lname,pack.pack_id , pack.speed, pack.monthly_payment, sect.s_name FROM packages pack JOIN sectors sect
                                       ON pack.sid = sect.sid JOIN customers cust ON cust.pack_id=pack.pack_id where sect.s_name = "Business";
 
--query-f
SELECT cust.lname , cust.fname , cust.joining_date, pack.pack_id , pack.speed ,sect.s_name FROM packages pack JOIN sectors sect
                                       ON  pack.sid = sect.sid JOIN customers cust ON cust.pack_id = pack.pack_id
                                       WHERE sect.s_name = 'Private' AND year(cust.joining_date) = 2006;

--query-g
SELECT pack.pack_id , pack.speed, pack.monthly_payment,grd.gname FROM packages pack JOIN pack_grade grd
                                       ON pack.grade_id = grd.grade_id;

-- query-h
SELECT cust.fname, cust.lname, pack.speed, pack.monthly_payment FROM customers cust INNER JOIN packages pack
                                       ON cust.pack_id = pack.pack_id; 
 
-- query-i
SELECT cust.fname,cust.lname, pack.speed, pack.monthly_payment FROM customers cust LEFT OUTER JOIN packages pack
                                       ON cust.pack_id = pack.pack_id;
 
-- query-j
SELECT cust.fname, cust.lname, pack.speed, pack.monthly_payment FROM customers cust RIGHT OUTER JOIN packages pack
                                       ON cust.pack_id = pack.pack_id;
 
--query-k
--Mysql doesn't support FULL OUTER JOIN
SELECT cust.fname, cust.lname, pack.speed, pack.monthly_payment FROM customers cust FULL OUTER JOIN packages pack
                                       ON cust.pack_id = pack.pack_id;
 
--query-l
SELECT cust1.fname, cust1.lname, cust1.pack_id  FROM customers cust1 JOIN customers cust2
                                      ON cust2.fname = 'Hardik' AND cust2.lname = 'Rana'
                                      AND cust2.pack_id = cust1.pack_id;
 
--query-m
SELECT cust1.fname, cust1.lname, cust1.pack_id , cust1.monthly_discount FROM customers cust1 JOIN customers cust2
                                      ON cust2.cid = 3 AND cust1.monthly_discount < cust2.monthly_discount and cust2.cid!=cust1.cid;
 
--query-n
SELECT pack1.pack_id,pack2.speed FROM packages pack1 JOIN packages pack2 
                                      ON pack2.pack_id = 105 AND pack1.speed = pack2.speed AND pack1.pack_id!=pack2.pack_id;
