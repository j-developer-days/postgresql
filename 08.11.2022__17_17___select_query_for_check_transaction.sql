select *
from phone_book.t_users tu 
left join phone_book.t_users_detail tud 
on tu.id  = tud.user_id 
order by tu.id;