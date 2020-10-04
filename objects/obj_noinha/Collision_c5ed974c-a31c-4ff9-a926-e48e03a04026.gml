/// @description Insert description here
// You can write your code in this editor

var damage_bullet;

with ( bullet )
{
	damage_bullet = item_damage;
	instance_destroy();
}

enemyhp -= damage_bullet;

audio_play_sound(snd_noinha_hit,0,false);