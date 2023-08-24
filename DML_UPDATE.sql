update stadium set stadium_name='우리경기장' where stadium_id='TP2';
select * from stadium;

alter table player add (ROW_ID NUMBER);
update player set ROW_ID=ROWNUM;
select * from player;
select * from player where ROW_ID=3;

select ROW_ID, player_name from player where rownum <3;