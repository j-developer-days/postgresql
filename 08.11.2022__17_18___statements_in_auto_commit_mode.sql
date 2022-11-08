delete from phone_book.t_users where lastname = 'Forrest';

insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');


insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');
insert into phone_book.t_users_detail (user_id, date_of_birth, gender) values(
(select id from phone_book.t_users where firstname = 'Phil' and lastname = 'Forrest'), make_date(1978, 3, 9), 'l' 
);