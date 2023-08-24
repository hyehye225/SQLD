select * from player;

insert into player (player_id, player_name, team_id, birth_date) values ('2999001','¼ÕÈï¹Î','K07','1999-01-01');
select * from player where player_name='¼ÕÈï¹Î';

insert into player values ('2999003','ÀÌ½Â¿ì','K07','','','2010','MF','10',NULL,NULL,NULL,NULL,NULL,NULL);
select * from player where player_name='ÀÌ½Â¿ì';

insert all
into stadium (stadium_id, stadium_name) values ('TP1','ÀÓ½Ã°æ±âÀå1')
into stadium (stadium_id, stadium_name) values ('TP2', 'ÀÓ½Ã°æ±âÀå2')

select * from dual;
select * from stadium;