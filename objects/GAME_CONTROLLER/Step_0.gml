 /// @description Insert description here
// You can write your code in this editor

if( global.shindeiru )
{
	global.time_death = global.time_death + 1 / 60;
	
	instance_deactivate_object(obj_braco);
	instance_deactivate_object(obj_braco_esq);
	instance_deactivate_object(obj_gun);
	
	audio_stop_all();
	
	if( global.time_death > 3 )
	{
		global.shindeiru = false;
		room_goto( GAMEOVER );
	}
}
