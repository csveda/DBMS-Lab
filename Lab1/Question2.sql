--create a table
 create table q2(flno INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY, fromplace VARCHAR(1000), toplace VARCHAR(1000), distance INT(6), departs datetime, arrives datetime);

--insert a row
INSERT into q2(fromplace,toplace,distance,departs,arrives) values('ahmedabad','mumbai',500, NOW(),NOW()+1000);
INSERT into q2(fromplace,toplace,distance,departs,arrives) values('delhi','bangalore',1000, NOW(),NOW()+10000);
INSERT into q2(fromplace,toplace,distance,departs,arrives) values('delhi','mumbai',700, NOW()+1000,NOW()+10000);
INSERT into q2(fromplace,toplace,distance,departs,arrives) values('kolkata','hyderabad',1500, NOW()+2000,NOW()+20000);
INSERT into q2(fromplace,toplace,distance,departs,arrives) values('surat','chennai',3000, NOW()+3000,NOW()+30000);

--show the table
select * from q2

--add new column 
ALter table q2 add column price INT(5);

--update table
update table q2 set price=distance*1.5;

--delete row
delete from q2 where flno=5;

--drop column mark2
alter table q2 drop column distance;

--delete all data from table
delete from q2;

--drop table
drop table q2;
