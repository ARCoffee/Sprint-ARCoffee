create user 'insertGrupo10'@'localhost' identified by 'arcoffee2023';

grant insert, select on arcoffee.* to 'insertGrupo10'@'localhost';
drop user 'insertGrupo10'@'localhost';

create user 'insertCloud'@'10.18.36.16' identified by 'arcoffee2023';
grant insert, select on arcoffee.* to 'insertCloud'@'10.18.36.16';

select * from mysql. user;

create user 'insertCloud'@'10.18.36.16' identified by 'arcoffee2023';
grant insert, select on arcoffee.* to 'insertCloud'@'10.18.36.16';