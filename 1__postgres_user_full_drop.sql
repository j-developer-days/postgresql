--https://www.postgresql.org/docs/current/sql-droptablespace.html
drop tablespace if exists phone_book_ts_new;

--https://www.postgresql.org/docs/current/sql-dropdatabase.html
drop database if exists phone_book_db;

--https://www.postgresql.org/docs/14/sql-droprole.html
drop role if exists phone_book_db_admin, phone_book_java_dev;