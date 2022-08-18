--https://www.postgresql.org/docs/14/sql-altersequence.html
alter sequence if exists phone_book.countries_seq OWNED by phone_book.t_countries.id;