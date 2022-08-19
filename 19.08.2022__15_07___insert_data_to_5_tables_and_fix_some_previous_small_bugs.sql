alter table IF exists phone_book.t_phone_number_types
ALTER COLUMN id SET DEFAULT nextval('phone_book.phone_number_types_seq');

insert into phone_book.t_phone_number_types (phone_number_type) 
values('cutom'),
('car')
returning *;

select *
from phone_book.t_phone_number_types;


alter table IF exists phone_book.t_countries
ALTER COLUMN id SET DEFAULT nextval('phone_book.countries_seq');

insert into phone_book.t_countries (country_name, country_code, country_phone_number_prefix)
values('United States of America', 'USA', 1),
('United Kingdom', 'GBR', 44)
returning *;

--https://countrycode.org/
INSERT INTO phone_book.t_countries (country_name, country_code, country_phone_number_prefix)
VALUES ('Moldova', 'MDA', 373),
('Monaco', 'MCO', 377),
('Ukraine', 'UKR', 380),
('Turkey', 'TUR', 90),
('Switzerland', 'CHE', 41),
('Sweden', 'SWE', 46),
('South Korea', 'KOR', 82),
('Spain', 'ESP', 34),
('South Africa', 'ZAF', 27),
('Singapore', 'SGP', 65),
('Russia', 'RUS', 7),
('Romania', 'ROU', 40),
('Poland', 'POL', 48)
RETURNING *;


select *
from phone_book.t_countries tc;

---------------------------------------------------
alter table if exists phone_book.t_users
rename column fistname to firstname;

alter table if exists phone_book.t_users
alter column patronymic drop not null;

INSERT INTO phone_book.t_users (firstname, lastname)
VALUES ('James', 'Smith')
,('Maria', 'Rodriguez')
,('Maria', 'Garcia')
,('James', 'Johnson')
,('Amelia', 'Margaret')
,('William', 'Damian')
,('Oscar', 'Rhys')
,('Thomas', 'Joe')
,('Jacob', 'Jacob')
RETURNING *;

INSERT INTO phone_book.t_users (firstname, lastname)
VALUES ('Adam', 'Hebrew')
,('Allen', 'Armstrong')
,('Bailey', 'Atkinson')
RETURNING *;

INSERT INTO phone_book.t_users (firstname, lastname)
VALUES ('Mikola', 'Vereshuk')
,('Oleksandr', 'Yaromshuk')
RETURNING *;

INSERT INTO phone_book.t_users (firstname, lastname)
VALUES ('Ion', 'Staucesku')
RETURNING *;


INSERT INTO phone_book.t_users (firstname, lastname)
VALUES ('Vasile', 'Russu'),
('Adrean', 'Vasilescu')
RETURNING *;


INSERT INTO phone_book.t_users (firstname, lastname)
VALUES ('Izmir', 'Tansoglu'),
('Mesut', 'Yildyz')
RETURNING *;


select *
from phone_book.t_users;

----------------------------------------------------------

INSERT INTO phone_book.t_users_detail (user_id, date_of_birth, gender)
VALUES 
((select id from phone_book.t_users where firstname = 'James' AND lastname = 'Smith'), 
make_date(1992, 10, 19), 'M'), 
((select id from phone_book.t_users where firstname = 'Maria' AND lastname = 'Rodriguez'), 
make_date(1983, 5, 31), 'F'), 
((select id from phone_book.t_users where firstname = 'Maria' AND lastname = 'Garcia'), 
make_date(1953, 5, 31), 'F'),
((select id from phone_book.t_users where firstname = 'James' AND lastname = 'Johnson'), 
make_date(2001, 12, 31), 'm'),
((select id from phone_book.t_users where firstname = 'Amelia' AND lastname = 'Margaret'), 
make_date(2001, 12, 31), 'f'),
((select id from phone_book.t_users where firstname = 'William' AND lastname = 'Damian'), 
make_date(2004, 3, 11), 'm')
RETURNING *;

INSERT INTO phone_book.t_users_detail (user_id, date_of_birth, gender)
VALUES 
((select id from phone_book.t_users where firstname = 'Adam' AND lastname = 'Hebrew'), 
make_date(1979, 1, 19), 'M'), 
((select id from phone_book.t_users where firstname = 'Allen' AND lastname = 'Armstrong'), 
make_date(1950, 5, 1), 'M'), 
((select id from phone_book.t_users where firstname = 'Bailey' AND lastname = 'Atkinson'), 
make_date(1999, 6, 25), 'M'),
((select id from phone_book.t_users where firstname = 'Mikola' AND lastname = 'Vereshuk'), 
make_date(2003, 9, 29), 'm'),
((select id from phone_book.t_users where firstname = 'Oleksandr' AND lastname = 'Yaromshuk'), 
make_date(1975, 1, 31), 'M'),
((select id from phone_book.t_users where firstname = 'Ion' AND lastname = 'Staucesku'), 
make_date(2000, 5, 3), 'm')
RETURNING *;


select *
from phone_book.t_users_detail;


-----------------------------------------

alter table if exists phone_book.t_phone_numbers
drop column if exists id cascade;

alter table if exists phone_book.t_phone_numbers
add column if not exists id serial not null;

alter table if exists phone_book.t_phone_numbers
add constraint t_phone_numbers__id__pk primary key(id);

INSERT INTO phone_book.t_phone_numbers(phone_number,phone_number_type_id,phone_number_country_id) 
VALUES('4842634729', 
(SELECT id FROM phone_book.t_phone_number_types WHERE phone_number_type = 'mobile'), 
(SELECT id FROM phone_book.t_countries WHERE country_code = 'USA'))
RETURNING *;


select *
from phone_book.t_phone_numbers;

--------------------------------------------------------
INSERT INTO phone_book.t_users_phone_numbers(user_id, phone_number_id)
VALUES ((select id from phone_book.t_users where firstname = 'Adam' AND lastname = 'Hebrew'), 
(select id from phone_book.t_phone_numbers where phone_number = '4842634729'))
RETURNING *;


select *
from phone_book.t_users_phone_numbers;





