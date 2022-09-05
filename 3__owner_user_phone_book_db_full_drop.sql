--https://www.postgresql.org/docs/current/sql-droptable.html
drop table if exists phone_book.t_phone_number_types cascade;
drop table if exists phone_book.t_countries cascade;

--https://www.postgresql.org/docs/14/sql-dropschema.html
drop schema if exists phone_book;