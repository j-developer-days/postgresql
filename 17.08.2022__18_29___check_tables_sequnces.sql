select *
from information_schema."tables" t
--where table_name = 't_phone_number_types' or table_name = 't_countries';
where table_name in('t_phone_number_types', 't_countries') ;

select *
from information_schema."columns" c
where table_name = 't_phone_number_types';


------
select *
from information_schema."sequences" s
where sequence_name in('phone_number_types_seq', 'countries_seq');


select *
from phone_book.t_phone_number_types;

select *
from phone_book.t_countries;