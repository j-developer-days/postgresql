select *
from information_schema.tables
where table_catalog = 'phone_book_db' and table_schema = 'phone_book';

select *
from information_schema."columns" c 
where table_catalog = 'phone_book_db' and table_schema = 'phone_book'
order by table_name asc, ordinal2_position desc;