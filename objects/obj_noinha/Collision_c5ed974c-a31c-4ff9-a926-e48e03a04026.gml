/// @description Insert description here
// You can write your code in this editor

var damage_bullet;

with ( bullet )
{
	damage_bullet = item_damage;
	instance_destroy();
}

last_damage = damage_bullet;

enemyhp -= damage_bullet;

if(!show_damage){
	show_damage = true;
	alarm[1] = 20;
}

audio_play_sound(snd_noinha_hit,0,false);