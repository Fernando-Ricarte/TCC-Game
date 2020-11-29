/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_aurivam) == false){
	audio_play_sound(snd_diploma,1,false); 
	room_goto(Zerado);
	audio_stop_sound(snd_boss);
}