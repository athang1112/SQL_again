
use startersql;

create table users(
  id int AUTO_INCREMENT PRIMARY KEY,
  name varchar(25) NOT NULL,
  email varchar(25) UNIQUE NOT NULL,
  gender enum('Male', 'Female'),
  date_of_birth DATE,
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  salary int
);

INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Ace', 'fire@fist.com', 'Male', '1995-01-01', 85000),
('Vivi', 'princess@alabasta.com', 'Female', '1999-02-02', 55000),
('Sabo', 'revo@army.com', 'Male', '1995-03-20', 82000),
('Reiju', 'poison@pink.com', 'Female', '1992-11-30', 65000),
('Shanks', 'red@hair.com', 'Male', '1982-03-09', 120000),
('Mihawk', 'hawk@eye.com', 'Male', '1979-03-09', 115000),
('Bonney', 'jewelry@glutton.com', 'Female', '1997-09-01', 48000),
('Koby', 'hero@marine.com', 'Male', '2001-05-13', 38000),
('Tashigi', 'sword@expert.com', 'Female', '1999-10-06', 42000),
('Marco', 'phoenix@white.com', 'Male', '1976-10-05', 90000),
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

select * from users;


-- view 
create view rich_users as
select * from users where salary>50000;
-- shows previous created view table
select * from rich_users;
-- if data is updated in parent table
update users set salary=40000 where id=11;
-- new view table will also get live updated 
select * from rich_users;
-- id view needed to drop
drop view rich_users;

-- index -- retreivals will be fast if index are assigned(consumes extra disk space)
show indexes from users;
create index idx_mail on users(gender);
-- for multi mocolumn order matters/ wahtever condtion while writiing query
create index idx_gender_salary on users(gender,salary);
-- to drop 
drop index idx_email on users;

-- sub queries
select * from users where salary>(select avg(salary) from users);

select id, name 
from users 
where id in (select id from users where salary>(select avg(salary) from users)
); 

select name, salary,(select avg(salary) from users) as Avg_salary from users;

-- using ROLLUP to get avg and sum of columns
select gender as "Gender", avg(salary) as 'Average salary', count(*) as "Count"
from users where date_of_birth>'1950-01-01' group by gender with rollup
having avg(salary)>60000;

DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
	SELECT * FROM users;
END $$
DELIMITER ;


select * from users;