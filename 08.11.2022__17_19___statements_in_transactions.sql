--success
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');
	raise notice 'success insert';
end $$;

--success
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');
	raise notice 'success insert';
	commit;
end $$;

--not inserted, because rollback
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');
	raise notice 'success insert';
	rollback;
end $$;

--first added, second rollbacked
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');
	commit;

	insert into phone_book.t_users (firstname, lastname) values('Gary', 'Forrest');
	rollback;
end $$;


--first rollbacked, second added
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');
	rollback;

	insert into phone_book.t_users (firstname, lastname) values('Gary', 'Forrest');
	commit;
end $$;


--rollbacked all, because not right value for phone_book.t_users_detail.gender = 'l', but should be only 'M', 'F'
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');

	insert into phone_book.t_users_detail (user_id, date_of_birth, gender) values(
	(select id from phone_book.t_users where firstname = 'Phil' and lastname = 'Forrest'), make_date(1978, 3, 9), 'l' 
	);
end $$;

--success insert for both tables transaction
do $$
begin
	insert into phone_book.t_users (firstname, lastname) values('Phil', 'Forrest');

	insert into phone_book.t_users_detail (user_id, date_of_birth, gender) values(
	(select id from phone_book.t_users where firstname = 'Phil' and lastname = 'Forrest'), make_date(1978, 3, 9), 'M' 
	);
end $$;




