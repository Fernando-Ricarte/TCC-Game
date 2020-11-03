/// @description Insert description here
// You can write your code in this editor

#region CHECANDO SE PLAYER ESTA PERTO
if ( collision_line(x, y, x + 35, y, obj_player, 1, 0))
{
	player_closer = true;
}else if( collision_line(x, y, x -35, y, obj_player, 1, 0) )
{
	player_closer = true;
}else
{
	player_closer = false;	
}
#endregion

#region CHECANDO SE O BAU FOI ABERTO

if ( has_open )
{
	sprite_index = spr_bau_open;
}
else
{
	sprite_index = spr_bau_closed;
}

#endregion