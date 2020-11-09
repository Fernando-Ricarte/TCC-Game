 /// @description Insert description here
// You can write your code in this editor

var damage_bullet;

with ( bullet )
{
	damage_bullet = item_damage;
	instance_destroy();
}

enemyhp -= damage_bullet;

with ( instance_create_layer(x, y - 130, "player", obj_hit_damage ) )
{
	dmg_points = damage_bullet;
}

audio_play_sound(snd_android_hit,0,false);