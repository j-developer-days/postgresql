--https://www.postgresql.org/docs/current/sql-dropdatabase.html
drop database if exists phone_book_db;


--https://www.postgresql.org/docs/14/sql-droprole.html
drop role if exists phone_book_db_admin, phone_book_java_dev;
--drop role if exists phone_book_db_admin;
--drop role if exists phone_book_java_dev;


--https://www.postgresql.org/docs/14/sql-createrole.html
create role phone_book_db_admin with superuser connection limit 1 login password '123456789_$%' valid until '2023-01-01';
create role phone_book_java_dev with superuser connection limit 1 login password '123456789' valid until '2023-01-01';


--https://www.postgresql.org/docs/14/sql-createdatabase.html
create database phone_book_db with owner phone_book_db_admin connection limit 1;