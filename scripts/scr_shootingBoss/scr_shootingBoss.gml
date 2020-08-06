// Codigo desenvolvido por Miguel Lukas
//

// criando tiro do objBossAurivam
if cooldown <=1
{
	var bullet = instance_create_depth(x,y,1,objShootBoss);
	cooldown = 50;
	
	with objShootBoss
	{
		bullet.direction = point_direction(bullet.x,bullet.y,obj_player.x,obj_player.y)
		speed = 6; 
	}  
}

cooldown = cooldown - 1;