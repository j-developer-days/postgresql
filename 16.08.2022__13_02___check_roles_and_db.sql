select *
from pg_roles
where rolname in('phone_book_java_dev', 'phone_book_db_admin');
--where rolname = 'phone_book_java_dev' or rolname = 'phone_book_db_admin';

select *
where datname = 'phone_book_db';
from pg_database