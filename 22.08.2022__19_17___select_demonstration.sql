select * 
from phone_book.t_countries tc;

select count(patronymic)
from phone_book.t_users tu;

select *
from phone_book.t_users tu
where patronymic is not null;

select *
from phone_book.t_users tu 
inner join phone_book.t_users_detail tud
on tu.id = tud.user_id;

select count(*)
from phone_book.t_users tu 
inner join phone_book.t_users_detail tud
on tu.id = tud.user_id;

select *
from phone_book.t_users tu 
left join phone_book.t_users_detail tud
on tu.id = tud.user_id;

select tu.*, tpn.phone_number, tpn.id, tc.country_name, tc.country_code, tpnt.phone_number_type, tud.date_of_birth , tud.gender 
from phone_book.t_users tu
inner join phone_book.t_users_phone_numbers tupn 
on tu.id = tupn.user_id 
inner join phone_book.t_phone_numbers tpn 
on tupn.phone_number_id = tpn.id 
inner join phone_book.t_countries tc 
on tc.id = tpn.phone_number_country_id 
inner join phone_book.t_phone_number_types tpnt 
on tpnt.id = tpn.phone_number_type_id 
on tpnt.id = tpn.phone_number_type_id 
inner join phone_book.t_users_detail tud 
on tud.user_id = tu.id 
;


