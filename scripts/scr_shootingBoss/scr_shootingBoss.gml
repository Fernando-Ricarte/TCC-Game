 //Codigo desenvolvido por Miguel Lukas
//criando tiro do objBossAurivam
if cooldown <= 1
{	
	
    global.bulletBoss = instance_create_depth(x,y,1,objShootBoss);
	audio_play_sound(snd_tiro,0,false);
	cooldown = 50
	
	with objShootBoss
	{
		global.bulletBoss.direction = point_direction(global.bullet.x, global.bullet.y , obj_player.x, obj_player.y);
		speed = 6;
	}  
}

cooldown = cooldown - 1;

