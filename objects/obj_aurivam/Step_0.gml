/// @description 
// Codigo desenvolvido por Miguel Lukas
//
switch (state)
{
	case BOSS_STATE.BOBBING: scr_bobbingBoss(); break;
	case BOSS_STATE.SHOOTING: scr_shootingBoss(); break;
	
}

if count < 2 
{
 if state = BOSS_STATE.BOBBING
 {
	 if (alarm[0] == -1)
	 {
		 alarm[0] = 3;
	 }
 }
 
}

// morte do boss
if(global.hpboss < 0 || global.hpboss = 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}