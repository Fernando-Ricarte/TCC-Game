/// @description Insert description here
// You can write your code in this editor

if(global.hp < 100){
	global.hp += 20;
	audio_play_sound(snd_pickup,0,false);
	instance_destroy();
};