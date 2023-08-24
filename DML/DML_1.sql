select * from dual;
select * from player;

select player_id, player_name,nickname from player;

select distinct position from player;
select team_id, position from player;
select distinct team_id, position from player;

select player_id, 'ABC', 5+4 from player;

select 'ABC', 5+4 from dual;

select 5+4 as result from dual;

select player_name 선수명, position 위치, height 키 from player;
select player_name as 선수명, position 위치, height 키 from player;
select player_name as "선수 이름" from player;

select player_name, height from player order by height asc;
select player_name, height from player order by 2 desc;

select player_name, height from player order by height desc, player_name asc;
select player_name, height from player order by position asc, height desc, player_name asc;

select player_id, position from player where position='GK';

select player_name, (height-100)*0.9-weight as balance from player
where ((height-100)*0.9-weight) >0;
select player_name from player
where ((height-100)*0.9-weight) >0;

select player_name, height, height+0, height-0, height*0, height/0 from player
where player_name='김태호';

select player_name, birth_date+3 from player where player_name='김태호';

select player_id , player_name, nation from player
where nation is null;

select player_name, height || 'cm' as "선수 신장" from player;
select player_name, CONCAT(height,'cm') as "선수 신장" from player;

select CONCAT(player_name,': ' || height || 'cm') as " 선수 신장" from player;
select player_name || ': ' || height || 'cm' as "선수 신장" from player;

select player_name 선수이름, position 포지션, height 키 from player where height between 170 and 180;
select player_name 선수이름, position 포지션, height 키 from player where height not between 170 and 180;
select player_name 선수이름, position 포지션, height 키 from player where height is null;
select player_name 선수이름, position 포지션, height 키 from player;

select player_name 선수이름, position 포지션, height 키 from player where height >= 170 and height <= 180;
select player_name 선수이름, position 포지션, height 키 from player where height < 170 or height > 180;
select player_name 선수이름, position 포지션, height 키 from player where height is not null;

select player_name, team_id from player where team_id='K06';
select player_name, team_id from player where team_id='K06' or team_id='K10';
select player_name, team_id from player where team_id in ('K06', 'K10');
select player_name, team_id from player where team_id not in ('K06', 'K10');
select player_name, team_id from player where team_id<>'K06' and team_id<>'K10';

select player_name 선수이름, team_id, position from player where (team_id,position) in (('K04', 'GK'),('K04','MF'));


