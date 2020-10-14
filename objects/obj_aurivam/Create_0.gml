/// @description 
// Codigo desenvolvido por Miguel Lukas
// 
//

global.hpboss = 100;// vida do boss
spd = 2; // velocidade
vspeed = 0; // velocidade vertical
image_angle = 0;


dir_c = 0;
dir_z = 0;
z = 0;
cooldown = 0;
count = 0;

// definindo estado inicial boss
state = BOSS_STATE.BOBBING;

enum BOSS_STATE // array com estados do boss
{
	BOBBING,
	SHOOTING
}