/// @description Insert description here
// You can write your code in this editor

player_is_right = place_meeting(x + 1, y, obj_player);
player_is_left = place_meeting(x - 1, y, obj_player);
player_is_toper = place_meeting(x, y + 1, obj_player);

if( player_is_toper )
{
	with( obj_player )
	{
		pulando = false;
	
		if( left || right )
		{
			y -= 3;
		}
	}
}


