--creation
create or replace view phone_book.v_user_first_and_last_names
as
select tu.firstname , tu.lastname 
from phone_book.t_users tu ;


--check
select *
from phone_book.v_user_first_and_last_names;

select *
from phone_book.t_users tu ;

--insert, update, delete operation
insert into phone_book.v_user_first_and_last_names (firstname, lastname) values ('james', 'bond');

delete from phone_book.v_user_first_and_last_names where firstname = 'james' and lastname = 'bond';


insert into phone_book.v_user_first_and_last_names (firstname) values ('james bond');
insert into phone_book.v_user_first_and_last_names (firstname, lastname) values ('james bond', 'bond');

update phone_book.v_user_first_and_last_names set firstname = 'james' where firstname = 'james bond'
returning *;




------------------------------------------
create or replace view phone_book.v_phone_number_info
as
select tpn.phone_number , tpnt.phone_number_type , tc.country_name , tc.country_code , tc.country_phone_number_prefix 
from phone_book.t_phone_numbers tpn 
inner join phone_book.t_phone_number_types tpnt 
on tpn.phone_number_type_id = tpnt.id 
inner join phone_book.t_countries tc 
on tc.id = tpn.phone_number_country_id ;


--check
select *
from phone_book.v_phone_number_info;

/*
 * SQL Error [55000]: ERROR: cannot insert into view "v_phone_number_info"
  Detail: Views that do not select from a single table or view are not automatically updatable.
  Hint: To enable inserting into the view, provide an INSTEAD OF INSERT trigger or an unconditional ON INSERT DO INSTEAD rule.
 * */
insert into phone_book.v_phone_number_info(country_name, country_code, country_phone_number_prefix)
values('Azerbaijan', 'AZE', 994);

create or replace view phone_book.v_countries
as
select tc.country_name , tc.country_code , tc.country_phone_number_prefix
from phone_book.t_countries tc ;

insert into phone_book.v_countries(country_name, country_code, country_phone_number_prefix)
values('Azerbaijan', 'AZE', 994);

insert into phone_book.v_countries(country_name, country_code, country_phone_number_prefix)
values('Armenia', 'ARM', 374);

select *
from phone_book.v_countries
where country_phone_number_prefix;








