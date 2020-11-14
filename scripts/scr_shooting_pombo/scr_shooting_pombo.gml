 //Codigo desenvolvido por Miguel Lukas
//criando tiro do objBossAurivam
if cooldown <= 1
{	
	
    var bulletBoss = instance_create_depth(x,y,1,obj_cocozin);
	audio_play_sound(snd_tiro,0,false);
	sprite_index = spr_pombo_attack;
	cooldown = random_range(50,100);
	
	with obj_cocozin
	{
		bulletBoss.direction = point_direction(bulletBoss.x,bulletBoss.y,obj_player.x,obj_player.y);
		speed = 6;
	}  
	
}
cooldown = cooldown - 1;

if (alarm[0] == -1)
{
	alarm[0] = 300;
}




