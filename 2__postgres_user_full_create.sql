--https://www.postgresql.org/docs/14/sql-createrole.html
create role phone_book_db_admin with superuser connection limit 1 login password '123456789_$%' valid until '2023-01-01';
create role phone_book_java_dev with superuser connection limit 1 login password '123456789' valid until '2023-01-01';


--https://www.postgresql.org/docs/14/sql-createdatabase.html
create database phone_book_db with owner phone_book_db_admin connection limit 1;

--https://www.postgresql.org/docs/current/sql-createtablespace.html
create tablespace phone_book_ts_new owner phone_book_db_admin location '/home/java_dev/phone_book_ts_new';

--https://www.postgresql.org/docs/14/sql-alterdatabase.html
alter database phone_book_db set tablespace phone_book_ts_new;