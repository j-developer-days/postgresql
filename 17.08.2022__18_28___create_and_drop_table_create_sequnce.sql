--https://www.postgresql.org/docs/current/sql-droptable.html
drop table if exists phone_book.t_phone_number_types cascade;


--https://www.postgresql.org/docs/current/sql-createtable.html
create table if not exists phone_book.t_phone_number_types(
	id smallint not null,
	phone_number_type varchar(25) not null,
	constraint t_phone_number_types__id__pk primary key(id)
) tablespace phone_book_ts_new;


--https://www.postgresql.org/docs/14/sql-createsequence.html
create sequence if not exists phone_book.phone_number_types_seq as smallint increment by 1 minvalue 1 maxvalue 20 
owned by phone_book.t_phone_number_types.id;

---------------------------------------------------------------------

create table if not exists phone_book.t_countries(
	id smallint not null,
	country_name varchar(75) not null,
	country_code varchar(3) not null,
	country_phone_number_prefix smallint not null,
	constraint t_countries__id__pk primary key(id),
	constraint t_countries__country_name__country_code__country_phone_number_prefix__u unique(country_name, country_code, country_phone_number_prefix)
) tablespace phone_book_ts_new;

create sequence if not exists phone_book.countries_seq as smallint increment by 1 minvalue 1 maxvalue 190 
owned by phone_book.t_phone_number_types.id;
