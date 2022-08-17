--https://www.postgresql.org/docs/current/sql-droptablespace.html
drop tablespace if exists phone_book_ts_new;


--https://www.postgresql.org/docs/current/sql-createtablespace.html
create tablespace phone_book_ts_new owner phone_book_db_admin location '/home/java_dev/phone_book_ts_new';