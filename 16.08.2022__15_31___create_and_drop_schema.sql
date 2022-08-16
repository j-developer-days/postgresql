--https://www.postgresql.org/docs/14/sql-dropschema.html
drop schema if exists phone_book;
--drop schema phone_book;


--https://www.postgresql.org/docs/14/sql-createschema.html
create schema if not exists phone_book authorization phone_book_db_admin;
--create schema phone_book authorization phone_book_db_admin;