-- First Table: Users
CREATE TABLE table1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary INT
);

INSERT INTO table1 (email, gender, date_of_birth, salary) VALUES
('zoro@swords.com', 'Male', '2000-12-11', 40000),
('law@heart.com', 'Male', '1999-06-25', 45000),
('robin@arch.com', 'Female', '1995-10-30', 55000),
('elly@tech.com', 'Female', '1990-01-01', 50000),
('nami@weather.com', 'Female', '1998-07-03', 60000),
('sanji@cook.com', 'Male', '1997-03-02', 58000),
('usopp@sniper.com', 'Male', '1999-04-01', 35000),
('chopper@doc.com', 'Male', '2010-12-24', 15000),
('franky@ship.com', 'Male', '1988-03-09', 70000),
('brook@soul.com', 'Male', '1934-04-03', 45000),
('jinbe@sea.com', 'Male', '1978-04-02', 80000),
('hancock@snake.com', 'Female', '1993-09-02', 95000),
('perona@ghost.com', 'Female', '1999-06-07', 42000),
('yamato@wano.com', 'Female', '1996-11-03', 75000),
('ace@fire.com', 'Male', '1995-01-01', 85000),
('vivi@sand.com', 'Female', '1999-02-02', 55000),
('sabo@revo.com', 'Male', '1995-03-20', 82000),
('reiju@poison.com', 'Female', '1992-11-30', 65000),
('shanks@red.com', 'Male', '1982-03-09', 120000),
('mihawk@eye.com', 'Male', '1979-03-09', 115000);




-- Second Table: Address
CREATE TABLE table2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    pin VARCHAR(6),
    CONSTRAINT fok_user FOREIGN KEY (user_id) REFERENCES table1(id) ON DELETE CASCADE
);

INSERT INTO table2 (user_id, street, city, state, pin) VALUES
(14, '22 Forest Ridge', 'Nagpur', 'Maharashtra', '440034'),
(3, '45 Maple Road', 'Mumbai', 'Maharashtra', '400052'),
(1, '12 North Street', 'Nagpur', 'Maharashtra', '440010'),
(11, '72 Harbor View', 'Chennai', 'Tamil Nadu', '600008'),
(5, '15 Crystal Lane', 'Chennai', 'Tamil Nadu', '600017'),
(2, '88 Silver Oak', 'Pune', 'Maharashtra', '411004'),
(10, '5 Village Square', 'Nagpur', 'Maharashtra', '440005'),
(6, '67 Lotus Blvd', 'Bhopal', 'Madhya Pradesh', '462011'),
(8, '90 Sakura Path', 'Pune', 'Maharashtra', '411033'),
(13, '404 Digital Way', 'Hyderabad', 'Telangana', '500032'),
(4, '102 High Rise', 'Nagpur', 'Maharashtra', '440022'),
(9, '21 Iron Gate', 'Mumbai', 'Maharashtra', '400012'),
(12, '19 Anchor Point', 'Bhopal', 'Madhya Pradesh', '462045'),
(1, '56 Market Yard', 'Mumbai', 'Maharashtra', '400099'), -- User 1 has a second address
(7, '33 Rose Garden', 'Kyoto', 'Kansai', '606801');




SELECT t1.id, t1.email, t2.city, t2.state
FROM table1 t1
INNER JOIN table2 t2 ON t1.id = t2.user_id;

SELECT t1.id, t1.email, t2.city, t2.state
FROM table1 t1
LEFT JOIN table2 t2 ON t1.id = t2.user_id;

SELECT t1.id, t1.email, t2.city, t2.state
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.id = t2.user_id;



select table1.email,table1.gender,table1.salary,table2.city,table2.pin
from table1
left join table2 on table1.id=table2.user_id;


SELECT t1.id, t1.email, t2.city FROM table1 t1 LEFT JOIN table2 t2 ON t1.id = t2.user_id
UNION
SELECT t1.id, t1.email, t2.city FROM table1 t1 RIGHT JOIN table2 t2 ON t1.id = t2.user_id;

-- UNION remove duplicates by default
-- UNION ALL keeps duplicate values
-- ------------------Example---------------
-- to add column
ALTER TABLE table1 ADD COLUMN refer_id INT;
-- self join
UPDATE users SET refer_id=1 WHERE id IN (2,4,6,8,10,12);
UPDATE users SET refer_id=2 WHERE id = 4;

select 
a.id,
a.name as user_name,
b.name as referred_by_name
from users a
inner join users b on a.referred_by_id=b.id;





select * from table1;
select * from table2;