select tablespace_name, status, contents from dba_tablespaces;

select tablespace_name, sum(bytes), max(bytes) from dba_free_space
group by tablespace_name;

select username, default_tablespace from dba_users
where username in upper('SWOODY');

alter user swoody quota 5m on users;