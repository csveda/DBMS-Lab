--create a table
CREATE TABLE q1(id NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(8),age INT(5),mark1 INT(4),mark2 INT(4), mark3 INT(4));

--insert a row
INSERT into q1(name,age,mark1,mark2,mark3) values('student1',19,90,90,90);
INSERT into q1(name,age,mark1,mark2,mark3) values('student2',19,91,92,93);
INSERT into q1(name,age,mark1,mark2,mark3) values('student3',20,95,78,99);
INSERT into q1(name,age,mark1,mark2,mark3) values('student4',22,70,80,90);
INSERT into q1(name,age,mark1,mark2,mark3) values('student5',25,72,85,98);

--show the table
select * from q1

--add new column 
ALter table q1 add column total INT(5);

--update table
update table q1 set total=mark1+mark2+mark3;

--delete row
delete from q1 where id=6;

--drop column mark2
alter table q1 drop column mark2;

--modify column data type
alter table q1 modify column mark3 INT(6);

--delete all data from table
delete from q1;

--drop table
drop table q1;
