/// @description Insert description here
// You can write your code in this editor


image_angle = point_direction(x, y, mouse_x, mouse_y);
x = obj_player.x;
y = obj_player.y + 3;
		
/// verifica qual posição o mouse esta em relação ao player
if(mouse_x > x){
	image_yscale = 1;
}else{
	image_yscale = -1;
}

