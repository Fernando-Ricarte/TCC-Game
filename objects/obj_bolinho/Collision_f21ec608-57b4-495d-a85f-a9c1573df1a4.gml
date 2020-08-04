/// @description Insert description here
// You can write your code in this editor


//if(global.hp < 100){
//	global.hp += 20;
//	audio_play_sound(snd_pickup,0,false);
//	instance_destroy();
//};

audio_play_sound(snd_pickup,0,false);
scr_gain_item(item.toddy, 1);
instance_destroy();