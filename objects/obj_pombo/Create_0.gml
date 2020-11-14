
hp_pombo = 50;
spd = 2; 
vspeed = 0; 
image_angle = 0;

 
dir_c = 0;
dir_z = 0;
z = 0;
cooldown = 0;
count = 0;


state = Pombo_STATE.CUTSCENE;

enum Pombo_STATE 
{	
	CUTSCENE,
	BOBBING,
	SHOOTING
}