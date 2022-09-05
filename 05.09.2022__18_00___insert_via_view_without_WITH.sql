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
);

--check
select *
from information_schema."views" v 
where table_name  = 'v_show_only_usa_phone_numbers';

select *
from phone_book.v_show_only_usa_phone_numbers;

select *
from phone_book.t_phone_numbers;


---
select *
from phone_book.t_countries tc ;

select *
from phone_book.t_phone_number_types tpnt ;


--insert
insert into phone_book.v_show_only_usa_phone_numbers(phone_number, phone_number_type_id, phone_number_country_id)
values('123456789', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'GBR'))
returning *;

insert into phone_book.v_show_only_usa_phone_numbers(phone_number, phone_number_type_id, phone_number_country_id)
values('1234567', (select id from phone_book.t_phone_number_types where phone_number_type = 'mobile'), (select id from phone_book.t_countries where country_code = 'USA'))
returning *;



