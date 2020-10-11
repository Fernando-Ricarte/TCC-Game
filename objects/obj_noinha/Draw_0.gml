/// @description Insert description here
// You can write your code in this editor

draw_self();


if( show_damage )
{
	var damage_txt = "-" + string(last_damage);
	draw_text_colour(x - 10, y - 130, damage_txt, c_red, c_maroon, c_red, c_red, 1);
}

var cordenada_x_esq = x + 40;
var cordenada_y_top = y - 100;
var cordenada_x_direta = x - 40;
var cordenada_y_bottom = y - 96;
draw_healthbar(cordenada_x_esq, cordenada_y_top,cordenada_x_direta , cordenada_y_bottom, enemyhp, c_silver, c_red, c_lime, 0, true, true)