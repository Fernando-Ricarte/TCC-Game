/// @description Insert description here
// You can write your code in this editor

if(mouse_encima)
{
	sprite_index = spr_slot_selected;	
}else
{
	sprite_index = spr_slot;
}

var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);

x = xx + pos_x;
y = yy + pos_y;