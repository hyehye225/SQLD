select team_id from player where player_id='2007182';

select player_name, team_id
from player
where team_id=
(select team_id from player where player_id='2007182');