 /// @description 
// Codigo desenvolvido por Miguel Lukas
//
switch (state)
{
	case BOSS_STATE.CUTSCENE: scr_cutsceneBoss(); break;
	case BOSS_STATE.BOBBING: scr_shootingBoss(); break;
	case BOSS_STATE.SHOOTING: scr_shootingBoss(); break;
}

if count < 2 
{

 if state = BOSS_STATE.CUTSCENE
 {
	 if (alarm[0] == -1)
	 {
		 alarm[0] = 300;
	 }
 }
 
}

// morte do boss
if(global.hpboss < 0 || global.hpboss = 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}