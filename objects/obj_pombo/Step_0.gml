
switch (state)
{
	
	case Pombo_STATE.SHOOTING: scr_shooting_pombo(); break;
}

if count < 2 
{

 if state = Pombo_STATE.CUTSCENE
 {
	 if (alarm[0] == -1)
	 {
		 alarm[0] = 300;
	 }
 }
 
}

// morte do pombo
if(hp_pombo < 0 || hp_pombo = 0){
	instance_destroy(); 
	audio_play_sound(snd_solado,0,false);
}