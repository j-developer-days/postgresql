select *
from pg_catalog.pg_tablespace ;

select pd.datname, pt.spcname, pt.spcowner 
from pg_catalog.pg_tablespace pt 
inner join pg_catalog.pg_database pd 
on pt."oid" = pd.dattablespace
where pd.datname = 'phone_book_db';