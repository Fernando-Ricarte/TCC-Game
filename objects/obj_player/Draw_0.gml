/// @description Insert description here
// You can write your code in this editor

var dir = point_direction(x, y, mouse_x, mouse_y);

draw_self();

if(mouse_x > x){
	draw_sprite_ext(gun01 , 0, x, y, 1, 1, dir, image_blend, image_alpha);
}else{
	draw_sprite_ext(gun01 , 0, x, y, 1, -1, dir, image_blend, image_alpha);
}