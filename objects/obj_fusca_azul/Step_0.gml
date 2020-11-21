/// @description Insert description here
// You can write your code in this editor

velh = dir * partida;
velv += grav;

x += velh;

// colisão vertical
if(place_meeting(x, y + velv, obj_chao))
{
	while(!place_meeting(x, y + sign(velv), obj_chao))
	{
		y += sign(velv);
	}
	
	velv = 0;
}
y += velv;

//Ativação do movimento do carro
if distance_to_point (obj_player.x, obj_player.y) < obj_fusca_azul+500 {
	partida = 8;
	audio_play_sound(sound_buzina, 1, false);
}