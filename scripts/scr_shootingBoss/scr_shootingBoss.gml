 //Codigo desenvolvido por Miguel Lukas
//criando tiro do objBossAurivam
if cooldown <= 1
{	
	
    var bulletBoss = instance_create_depth(x,y,1,objShootBoss);
	audio_play_sound(snd_tiro,0,false);
	cooldown = random_range(25,35);
	
	with objShootBoss
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




