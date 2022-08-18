create table if not exists phone_book.t_users(
	id serial not null,
	fistname varchar(100) not null,
	lastname varchar(100) not null,
	patronymic varchar(100) not null,
	
	constraint t_users__id__pk primary key(id)
) tablespace phone_book_ts_new;


create table if not exists phone_book.t_users_detail(
	user_id integer not null,
	date_of_birth date not null,
	gender char(1) not null,
	
	constraint t_users_detail__user_id__fk foreign key(user_id) references phone_book.t_users(id),
	constraint t_users_detail__date_of_birth__ch check('1900-01-01' < date_of_birth and (current_date - interval '18 year')::date > date_of_birth),
	constraint t_users_detail__gender__ch check(upper(gender) in ('M', 'F'))
) tablespace phone_book_ts_new;

create table if not exists phone_book.t_phone_numbers(
	id integer not null,
	phone_number varchar(50) not null,
	phone_number_type_id smallint not null,
	phone_number_country_id smallint not null,
	
	constraint t_phone_numbers__id__pk primary key (id),
	constraint t_phone_numbers__phone_number_type_id__fk foreign key(phone_number_type_id) references phone_book.t_phone_number_types(id),
	constraint t_phone_numbers__phone_number_country_id__fk foreign key(phone_number_country_id) references phone_book.t_countries(id)
) tablespace phone_book_ts_new;


create table if not exists phone_book.t_users_phone_numbers(
	user_id integer not null,
	phone_number_id int not null,
	
	constraint t_users_phone_numbers__user_id__fk foreign key(user_id) references phone_book.t_users(id),
	constraint t_users_phone_numbers__phone_number_id__fk foreign key(phone_number_id) references phone_book.t_phone_numbers(id)
) tablespace phone_book_ts_new;
	