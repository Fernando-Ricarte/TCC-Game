    /// @description 
// Codigo desenvolvido por Miguel Lukas
// 
//
audio_play_sound(snd_risada_sinistra,0,false);

hp_boss = 2000;// vida do boss
spd = 2; // velocidade
vspeed = 0; // velocidade vertical
image_angle = 0;

 
dir_c = 0;
dir_z = 0;
z = 0;
cooldown = 0;
count = 0;

// definindo estado inicial boss
state = BOSS_STATE.CUTSCENE;

enum BOSS_STATE // array com estados do boss
{	
	CUTSCENE,
	BOBBING,
	SHOOTING
}