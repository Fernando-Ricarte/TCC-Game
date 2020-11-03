/// @description Insert description here
// You can write your code in this editor

draw_self();

if ( player_closer && !has_open )
{
	draw_sprite( spr_coin_advise, contador, x, y - 100 );
	
	if ( time_changer <= 0 )
	{
		time_changer = 0.4;
		contador += 1;
	}
	else
	{
		time_changer -= 1 / 10;
	}
	
	if ( contador >= 9 ) { 	contador = 1; }
}