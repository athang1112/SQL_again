create database startersql;
use startersql;

create table users(
  id int AUTO_INCREMENT PRIMARY KEY,
  name varchar(25) NOT NULL,
  email varchar(25) UNIQUE NOT NULL,
  gender enum('Male', 'Female'),
  date_of_birth DATE,
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);

insert into users(name,email,gender,date_of_birth) values
('Zoro','zoro@123','Male','2000-12-11'),
('Law','law@768','Male','1999-06-25'),
('Robin','roball@69','Female','1995-10-30'),
('Elly','elly@6969','Female','1990-01-01');


update users set email='zorojuro@12334' where id=1;

update users set salary=55000 where id=1;
update users set salary=50000 where id=2;
update users set salary=45000 where id=3;
update users set salary=65000 where id=4;


alter table users drop column salary;

select name,email from users where gender='Female';
select * from users where date_of_birth<'1992-01-01';
alter table users add column salary int;

INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Nami', 'nami@weather.com', 'Female', '1998-07-03', 60000),
('Sanji', 'cook@allblue.com', 'Male', '1997-03-02', 58000),
('Usopp', 'god@sniper.com', 'Male', '1999-04-01', 35000),
('Chopper', 'doc@reindeer.com', 'Male', '2010-12-24', 15000),
('Franky', 'ship@super.com', 'Male', '1988-03-09', 70000),
('Brook', 'soul@king.com', 'Male', '1934-04-03', 45000),
('Jinbe', 'boss@sea.com', 'Male', '1978-04-02', 80000),
('Hancock', 'empress@snake.com', 'Female', '1993-09-02', 95000),
('Perona', 'ghost@hollow.com', 'Female', '1999-06-07', 42000),
('Yamato', 'ogre@wano.com', 'Female', '1996-11-03', 75000);


select * from users where name like '%o%';
select * from users where name like 'Z%';
select * from users where name like '%y';
select * from users where salary>40000 limit 5;
select * from users where salary>50000 and gender='Male' limit 3;
select * from users order by salary;
select * from users where gender='Male' order by salary DESC ; 
-- DOB only after 1930
alter table users add constraint age_defect check (date_of_birth>'1930-01-01');
-- age_defect constraint will be violated
-- INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
-- ('Nami', 'nami@weather.com', 'Female', '1920-07-03', 60000);

select avg(salary) as Avg_salary from users where gender='Female';
select gender,count(salary) as Employees, avg(salary) as Avg_salary from users group by gender;
select gender,min(salary) as Min_salary, max(salary) as Max_salary from users group by gender;
-- select id, gender, avg(salary) as Avg_salary from users group by gender;

SELECT id, gender, salary,
       AVG(salary) OVER(PARTITION BY gender) AS Avg_salary_for_this_gender
FROM users;
-- or
SELECT id, gender, salary, AVG(salary) AS Avg_salary
FROM users
GROUP BY gender, id, salary;

select name, length(name) as name_length from users;
select id,gender,name, length(name) as name_length from users;

select * from users order by salary desc;

update users set salary=99000 where id=12;

-- switch off safe mode
SET SQL_SAFE_UPDATES = 0;
update users set salary=salary+2000 where gender='Female';
-- switch on safe mode
set sql_safe_updates=1;

update users set salary=70000 where id=4;
update users set name='Elly klutch' where email='elly@6969';
update users set gender='Female' where name='Franky';
update users set name='Tony Chopper' where name='Chopper' and email='doc@reindeer.com';

delete from users where id=14;
delete from users where salary<30000;

select id, gender,lower(name) as lower, concat(lower(name),6789) as username, length(name) as name_length from users;
select id, gender,lower(name) as lower, concat(lower(name),6789) as username, now() as time,length(name) as name_length from users;
select id, gender,lower(name) as lower, concat(lower(name),6789) as username, year(now()) as time,length(name) as name_length from users;

select name, datediff(curdate(),date_of_birth) as days from users;
select name, datediff(curdate(),date_of_birth)/365 as Age from users;

select salary, round(salary) as rounded, floor(salary) as floored, ceil(salary) as ceiled from users; 

select id,mod(salary,1000) as Remainder from users;

-- if conditional
select name, gender,
if(gender='Male','Yes','No') as IS_MALE
from users; 

-- autocommit example
set autocommit=0;
commit;
delete from users where id=4;
rollback;
set autocommit=1;

-- to add column
ALTER TABLE table1 ADD COLUMN refer_id INT;


 

select * from users;
drop table users;
