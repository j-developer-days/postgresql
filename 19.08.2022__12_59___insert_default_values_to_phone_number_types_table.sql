insert into phone_book.t_phone_number_types (id, phone_number_type) 
values(nextval('phone_book.phone_number_types_seq'), 'home');

insert into phone_book.t_phone_number_types (id, phone_number_type) 
values
(nextval('phone_book.phone_number_types_seq'), 'work'),
(nextval('phone_book.phone_number_types_seq'), 'mobile'),
(nextval('phone_book.phone_number_types_seq'), 'mobile work'),
(nextval('phone_book.phone_number_types_seq'), 'home fax');

insert into phone_book.t_phone_number_types (id, phone_number_type) 
values(nextval('phone_book.phone_number_types_seq'), 'other')
returning *;



select *
from phone_book.t_phone_number_types;

select nextval('phone_book.phone_number_types_seq');
select currval('phone_book.phone_number_types_seq');
select setval('phone_book.phone_number_types_seq', 1);