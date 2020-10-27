/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_pickup,0,false);
scr_gain_item( item.rail_gun, irandom_range( 1, 5 ) );
instance_destroy();