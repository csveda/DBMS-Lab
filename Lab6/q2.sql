--create tables
create table actor (act_id int not null primary key,
                    act_name varchar(100) not null,
                    act_gender varchar(100) not null);


create table director (dir_id int not null primary key,
                       dir_name varchar(100) not null,
                       dir_phone int not null);
                   

create table movies (mov_id int not null primary key,
                     mov_title varchar(100) not null,
                     mov_year int not null,
                     mov_lang varchar(100) not null,
                     dir_id int not null,
                     foreign key(dir_id) references director(dir_id) on delete  cascade
                      );

create table movie_cast(act_id int not null,
                        mov_id int not null,
                        Role varchar(100) not null,
                        primary key(act_id,mov_id),
                        foreign key(act_id) references actor(act_id) on delete cascade,
                        foreign key(mov_id) references movies(mov_id) on delete cascade);

create table rating (mov_id int not null,
	                 Rev_stars int not null,
	                 Reviewer_name varchar(100) not null,
	                 primary key(mov_id,Rev_stars).
                     foreign key(mov_id) references movies(mov_id) on delete cascade);


---Inserting
insert into actor(act_id,act_name,act_gender)  values
	                         (1,"Act1","male"),
	                         (2,"Act2","Female"),
	                         (3,"Act3","male"),
	                         (4,"Act4","male"),
	                         (5,"Act5","male"),
	                         (6,"Act6","Female");


insert into director (dir_id,dir_name,dir_phone) values
	                         (1,"michael",1112223334),
	                         (2,"stephen",2455567889),
	                         (3,"dir3",1234567889),
	                         (4,"dir4",2222222222),
	                         (5,"dir4",3333333333);


insert into movies (mov_id, mov_title, mov_year, mov_lang, dir_id) values
	                          (1,"mov1",2012,"English", 1),
	                          (2,"mov2",2009,"Hindi", 2),
	                          (3,"mov3",2018,"English", 2),
	                          (4,"mov4",2013,"English", 3),
	                          (5,"mov5",2014,"Hindi", 4),
	                          (6,"mov6",2015,"Hindi", 5),
	                          (7,"mov7",2019,"English", 1);

insert into movie_cast (act_id, mov_id, Role) values
	                          (1,1,"Hero"),
	                          (2,1,"Heroine"),
	                          (3,1,"'The Innocents"),
	                          (1,2,"Hero"),
	                          (2,3,"Heroine"),
	                          (3,4,"The Innocents");


insert into rating  (mov_id, Rev_stars,Reviewer_name) values
	                          (1,5,"Hardik"),
	                          (1,4,"Chetan"),
	                          (1,3,"Bobby"),
	                          (2,4,"rev1"),
	                          (2,5,"rev7"),
	                          (3,3,"rev2"),
	                          (4,4,"rev3"),
	                          (5,3,"rev4");


--query1
select mov_title from movies,director where movies.dir_id = director.dir_id and director.dir_name="michael";

--query2
 select distinct(mov_title) from movies,movie_cast where 
                         movies.mov_id = movie_cast.mov_id and movie_cast.act_id in 
                         (select act_id from movie_cast group by act_id having count(mov_id)>=2);

--query3
select distinct(actor.act_name) from movie_cast,movies,actor where movie_cast.mov_id = movies.mov_id and (mov_year<2010 or mov_year>2017) and actor.act_id = movie_cast.act_id;

--query4
select movies.mov_title,tb1.max from movies,(select mov_id,max(Rev_stars) as max from rating group by mov_id) as tb1 where movies.mov_id = tb1.mov_id order by movies.mov_title;

--query5
update rating set Rev_stars = 4 where rating.mov_id in(select mov_id from movies,director where director.dir_id = movies.dir_id and director.dir_name = "stephen");

--query6
select dir_name from director,movie_cast,movies where 
                director.dir_id = movies.dir_id and movies.mov_id = movie_cast.mov_id and movie_cast.Role="The Innocents";

--query7
select mov_title from movies,rating where movies.mov_id = rating.mov_id and movies.mov_id not in (select distinct(mov_id) from rating);

--query8
select rating.Reviewer_name,movies.mov_title from rating,movies,(select rating.Reviewer_name, count(rating.Reviewer_name) as count1 from rating group by rating.Reviewer_name) as tb1 
      where movies.mov_id=rating.mov_id and rating.Reviewer_name=tb1.Reviewer_name and tb1.count1>1;

