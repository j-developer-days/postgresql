--creation views
--https://www.postgresql.org/docs/current/sql-createview.html
create or replace view phone_book.v_get_all_countries
as
select *
from phone_book.t_countries tc ;

create or replace view phone_book.v_phone_number_country
as
select tpn.phone_number, vgac.country_name, vgac.country_code
from phone_book.t_phone_numbers tpn 
inner join phone_book.v_get_all_countries vgac
on tpn.phone_number_country_id = vgac.id;


--check views
select *
from phone_book.v_get_all_countries;

select *
from phone_book.v_phone_number_country;

select *
from information_schema."views" v 
where table_name in ('v_get_all_countries', 'v_phone_number_country');

--drop view
/*
 * SQL Error [2BP01]: ERROR: cannot drop view phone_book.v_get_all_countries because other objects depend on it
  Detail: view phone_book.v_phone_number_country depends on view phone_book.v_get_all_countries
  Hint: Use DROP ... CASCADE to drop the dependent objects too.
 * */
--https://www.postgresql.org/docs/current/sql-dropview.html
drop view if exists phone_book.v_get_all_countries;

drop view if exists phone_book.v_get_all_countries cascade;

--one line drop views, option 1
drop view if exists phone_book.v_get_all_countries, phone_book.v_phone_number_country;

--one line drop views, option 2
drop view if exists phone_book.v_phone_number_country, phone_book.v_get_all_countries;

--drop by sequence 
drop view if exists phone_book.v_phone_number_country;
drop view if exists phone_book.v_get_all_countries;

--
/*
 * SQL Error [2BP01]: ERROR: cannot drop view phone_book.v_get_all_countries because other objects depend on it
  Detail: view phone_book.v_phone_number_country depends on view phone_book.v_get_all_countries
  Hint: Use DROP ... CASCADE to drop the dependent objects too.34
 * */
drop view if exists phone_book.v_get_all_countries;
drop view if exists phone_book.v_phone_number_country;



---------------------------
--creation
create or replace view phone_book.v_phone_number_info
as
select tpn.phone_number, tpnt.phone_number_type , tc.country_name, tc.country_code, tc.country_phone_number_prefix 
from phone_book.t_phone_numbers tpn 
inner join phone_book.t_phone_number_types tpnt 
on tpn.phone_number_type_id = tpnt.id 
inner join phone_book.t_countries tc 
on tc.id  = tpn.phone_number_country_id;

create or replace view phone_book.v_phone_number_short_info
as
select '(+' || country_phone_number_prefix || ')' || phone_number || ' is - ' || phone_number_type || ' and from - ' || country_name || ',' || country_code
from phone_book.v_phone_number_info;

--check
select *
from phone_book.v_phone_number_info;

select *
from phone_book.v_phone_number_short_info;


/*
 * SQL Error [2BP01]: ERROR: cannot drop view phone_book.v_phone_number_info because other objects depend on it
  Detail: view phone_book.v_phone_number_short_info depends on view phone_book.v_phone_number_info
  Hint: Use DROP ... CASCADE to drop the dependent objects too.
 * */
drop view if exists phone_book.v_phone_number_info;

drop view if exists phone_book.v_phone_number_info cascade;

drop view if exists phone_book.v_phone_number_info, phone_book.v_phone_number_short_info;



