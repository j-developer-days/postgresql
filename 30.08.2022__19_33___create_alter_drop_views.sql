--https://www.postgresql.org/docs/14/sql-createview.html
create or replace view v_user
as
select tu.*, tud.date_of_birth , tud.gender 
from phone_book.t_users tu 
inner join phone_book.t_users_detail tud 
on tu.id = tud.user_id ;

--https://www.postgresql.org/docs/14/sql-alterview.html
alter view if exists v_user set schema phone_book;
alter view if exists phone_book.v_user  rename to v_user_info;

--https://www.postgresql.org/docs/14/sql-dropview.html
drop view if exists phone_book.v_user_info;

--SQL Error [42P16]: ERROR: cannot change name of view column "gender" to "user_id"
create or replace view phone_book.v_user_info
as
select tu.*, tud.date_of_birth , tud.user_id  
from phone_book.t_users tu 
inner join phone_book.t_users_detail tud 
on tu.id = tud.user_id ;

---------------------------------------------
create or replace view phone_book.v_user_firstname_and_lastname
as 
select tu.firstname , tu.lastname 
from phone_book.t_users tu;

--add additional column to exist view
create or replace view phone_book.v_user_firstname_and_lastname
as 
select tu.firstname , tu.lastname, tu.patronymic  
from phone_book.t_users tu;

--SQL Error [42P16]: ERROR: cannot drop columns from view
create or replace view phone_book.v_user_firstname_and_lastname
as 
select tu.firstname , tu.lastname
from phone_book.t_users tu;


drop view if exists phone_book.v_user_firstname_and_lastname;
create or replace view phone_book.v_user_firstname_and_lastname
as 
select tu.firstname , tu.lastname 
from phone_book.t_users tu;

--SQL Error [42P07]: ERROR: relation "v_user_firstname_and_lastname" already exists
create view phone_book.v_user_firstname_and_lastname
as 
select tu.firstname , tu.lastname 
from phone_book.t_users tu;




