create table users(
member_id int(11),
name varchar(30),
email varchar(50),
influence_count int(11),
memmber_since date,
multiplier int(11)
);


insert into users(member_id,name,email,influence_count,member_since,multiplier) values(1,'Taylor Otwell','otwell@laravel.com',739360,'2020-6-10',10);

insert into users values(2,'Ryan Dahl','ryan@nodejs.org',633632,'2020-04-22',10),(3,'Brendan Eich','eich@javascript.com',939570,'2020-05-07',8),(5,'Evan You','you@vuejs.org',982630,'2020-06-11',7),(6,'Rasmus Lerdorf','lerdorf@php.net',937927,'2020-06-3',8),(7,'Guido van Rossum','guido@python.org',968827,'2020-07-18',19),(8,'Adrian Holovaty','adrian@djangoproject.com',570724,'2020-05-07',5),(9,'Simon Willison','simon@djangoproject.com',864615,'2020-04-30',4),(10,'James Gosling','james@java.com',719491,'2020-05-18',5),(11,'Rod Johnson','rod@spring.io',601744,'2020-05-18',7),(12,'Satoshi Nakamoto','nakamoto@blockchain.com',630488,'2020-05-10',10);

Task1
ALTER TABLE users CHANGE influence_count followers int(11);

Task2
ALTER TABLE users CHANGE memmber_since joining_date date;

Task3
select name, email, followers from users;

Task4
select name, (((followers*100/1000000) * (multiplier*100/20))/100) AS Efficiency from users;

Task5
ALTER TABLE users MODIFY COLUMN multiplier char(10);