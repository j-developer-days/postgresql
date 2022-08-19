select *
from phone_book.t_users tu;

update phone_book.t_users set patronymic = null where id = 5;

update phone_book.t_users set patronymic = 'Mike' where id in (10, 18, 5)
returning *;

returning *;
delete from phone_book.t_users where id = 20

insert into phone_book.t_users (firstname, lastname) values('Mesut', 'Yildyz');