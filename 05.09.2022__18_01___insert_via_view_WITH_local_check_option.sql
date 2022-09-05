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
with local check option;


--insert
--error
/*
 * SQL Error [44000]: ERROR: new row violates check option for view "v_show_only_usa_phone_numbers"
  Detail: Failing row contains (987654321, 3, 2, 4).
 * */
insert into phone_book.v_show_only_usa_phone_numbers(phone_number, phone_number_type_id, phone_number_country_id)
values('987654321', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'GBR'))
returning *;

--success
insert into phone_book.v_show_only_usa_phone_numbers(phone_number, phone_number_type_id, phone_number_country_id)
values('753145', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'USA'))
returning *;



