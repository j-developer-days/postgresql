--creation
create or replace view phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type
as
select *
from phone_book.v_show_only_usa_phone_numbers
where phone_number_type_id = (
select id
from phone_book.t_phone_number_types tpnt 
where tpnt.phone_number_type = 'mobile'
);

--check
select *
from phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type;

select *
from information_schema."views" v 
where table_name  = 'v_show_only_usa_phone_numbers_only_mobile_phone_number_type';

--insert
--error
/*
 * SQL Error [44000]: ERROR: new row violates check option for view "v_show_only_usa_phone_numbers"
  Detail: Failing row contains (789, 3, 2, 6).
 * */
insert into phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type(phone_number, phone_number_type_id, phone_number_country_id)
values('789', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'GBR'))
returning *;


insert into phone_book.v_show_only_usa_phone_numbers_only_mobile_phone_number_type(phone_number, phone_number_type_id, phone_number_country_id)
values('75321', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'USA'))
returning *;

