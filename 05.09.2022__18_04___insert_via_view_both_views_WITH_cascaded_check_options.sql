---creation view
create or replace view phone_book.v_show_only_usa_phone_numbers
as
select *
from phone_book.t_phone_numbers tpn 
where tpn.phone_number_country_id = 
(
select id 
from phone_book.t_countries tc 
where tc.country_code = 'USA'
)
with CASCADED check option;


create or replace view phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type
as
select *
from phone_book.v_show_only_usa_phone_numbers
where phone_number_type_id = (
select id
from phone_book.t_phone_number_types tpnt 
where tpnt.phone_number_type = 'mobile'
)
with CASCADED check option;

--check
select *
from information_schema."views" v 
where table_name  in( 'v_show_only_usa_phone_numbers_only_mobile_phone_number_type', 'v_show_only_usa_phone_numbers');


--insert 
/**
 *SQL Error [44000]: ERROR: new row violates check option for view "v_show_only_usa_phone_numbers"
  Detail: Failing row contains (97897, 3, 2, 11). 
 */
insert into phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type(phone_number, phone_number_type_id, phone_number_country_id)
values('97897', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'GBR'))
returning *;

--success
insert into phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type(phone_number, phone_number_type_id, phone_number_country_id)
values('344859', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'USA'))
returning *;

--error
/*
 * SQL Error [44000]: ERROR: new row violates check option for view "v_show_only_usa_phone_numbers_only_mobile_phone_number_type"
  Detail: Failing row contains (8442265, 1, 1, 13).
 * **/
insert into phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type(phone_number, phone_number_type_id, phone_number_country_id)
values('8442265', (select id from phone_book.t_phone_number_types where phone_number_type = 'hom2e'), (select id from phone_book.t_countries where country_code = 'USA'))
returning *;








