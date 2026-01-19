use startersql;
drop table if exists address;

create table address(
id int auto_increment primary key,
user_id int,
street varchar(100),
city varchar(100),
state varchar(100),
pin varchar(100),
constraint fk_user foreign key(user_id) references users(id) on delete cascade
);
alter table address 
rename column id to address_id;



-- 'on delete cascade' is used to update changes from parent table 
-- other wise we can is 'on delete setnull' in which instead of deleting null value will be achieved

INSERT INTO address (user_id, street, city, state, pin) 
VALUES
(14, '22 Forest Ridge', 'Nagpur', 'Maharashtra', '440034'),
(3, '45 Maple Road', 'Mumbai', 'Maharashtra', '400052'),
(19, '34 Hill Top', 'Bhopal', 'Madhya Pradesh', '462002'),
(7, '33 Rose Garden', 'Kyoto', 'Kansai', '606801'),
(1, '12 North Street', 'Nagpur', 'Maharashtra', '440010'),
(11, '72 Harbor View', 'Chennai', 'Tamil Nadu', '600008'),
(5, '15 Crystal Lane', 'Chennai', 'Tamil Nadu', '600017'),
(17, '80 Bridge Road', 'Chennai', 'Tamil Nadu', '600040'),
(2, '88 Silver Oak', 'Pune', 'Maharashtra', '411004'),
(10, '5 Village Square', 'Nagpur', 'Maharashtra', '440005'),
(15, '56 Market Yard', 'Mumbai', 'Maharashtra', '400099'),
(6, '67 Lotus Blvd', 'Bhopal', 'Madhya Pradesh', '462011'),
(20, '10 Ocean Drive', 'Mumbai', 'Maharashtra', '400002'),
(8, '90 Sakura Path', 'Pune', 'Maharashtra', '411033'),
(13, '404 Digital Way', 'Hyderabad', 'Telangana', '500032'),
(4, '102 High Rise', 'Nagpur', 'Maharashtra', '440022'),
(18, '99 Station Road', 'Nagpur', 'Maharashtra', '440001'),
(9, '21 Iron Gate', 'Mumbai', 'Maharashtra', '400012'),
(16, '11 Sky Tower', 'Pune', 'Maharashtra', '411015'),
(12, '19 Anchor Point', 'Bhopal', 'Madhya Pradesh', '462045');

-- to drop foreign key
alter table address 
drop foreign key fk_user;

-- join
select users.name,users.gender, address.city,address.state
from users 
inner join address on users.id=address.user_id;

select users.name,users.gender, address.city,address.state,address.address_id 
from users 
left join address on users.id=address.user_id;




select * from address;
select * from users;

drop table address;
drop table users;
