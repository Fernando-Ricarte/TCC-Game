/// @description Insert description here
// You can write your code in this editor

var dir = point_direction(x, y, mouse_x, mouse_y);

var spr_name = sprite_get_name(sprite_index);

if(mouse_x > x){
	draw_sprite_ext(gun01 , 0, x, y-5, 1, 1, dir, image_blend, image_alpha);

if(spr_name == "spr_idle_no"){
	
	if(image_index == 1){
		sprite_set_offset(gun01, 3, 10);
	}
	else if(image_index == 2){
		sprite_set_offset(gun01, 3, 14);
	}
	else if(image_index == 3){
		sprite_set_offset(gun01, 3, 12);
	}
}else if(spr_name == "spr_running_no"){
	
	if(image_index == 1){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 2){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 3){
		sprite_set_offset(gun01, -2, 12);
	}
	
	if(image_index == 4){
		sprite_set_offset(gun01, 4, 9);
	}
	
	if(image_index == 5){
		sprite_set_offset(gun01, 4, 10);
	}
	
	if(image_index == 6){
		sprite_set_offset(gun01, 2, 11);
	}
	
	if(image_index == 7){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 8){
		sprite_set_offset(gun01, 2, 10);
	}
	
	if(image_index == 9){
		sprite_set_offset(gun01, 3, 10);
	}
	
}
	
}else{
	draw_sprite_ext(gun01 , 0, x, y-5, 1, -1, dir, image_blend, image_alpha);
	
	if(spr_name == "spr_idle_no"){
	
	if(image_index == 1){
		sprite_set_offset(gun01, 3, 10);
	}
	else if(image_index == 2){
		sprite_set_offset(gun01, 3, 14);
	}
	else if(image_index == 3){
		sprite_set_offset(gun01, 3, 12);
	}
	}else if(spr_name == "spr_running_no"){
	
			if(image_index == 1){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 2){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 3){
		sprite_set_offset(gun01, -2, 12);
	}
	
	if(image_index == 4){
		sprite_set_offset(gun01, 4, 9);
	}
	
	if(image_index == 5){
		sprite_set_offset(gun01, 4, 10);
	}
	
	if(image_index == 6){
		sprite_set_offset(gun01, 2, 11);
	}
	
	if(image_index == 7){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 8){
		sprite_set_offset(gun01, 2, 10);
	}
	
	if(image_index == 9){
		sprite_set_offset(gun01, 3, 10);
	}
	
	}
}

draw_self();


if(mouse_x > x){
	draw_sprite_ext(gun01 , 0, x, y, 1, 1, dir, image_blend, image_alpha);
	
	if(spr_name == "spr_idle_no"){
	
	if(image_index == 1){
		sprite_set_offset(gun01, 3, 10);
	}
	else if(image_index == 2){
		sprite_set_offset(gun01, 3, 14);
	}
	else if(image_index == 3){
		sprite_set_offset(gun01, 3, 12);
	}
	}else if(spr_name == "spr_running_no"){
	
	if(image_index == 1){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 2){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 3){
		sprite_set_offset(gun01, -2, 12);
	}
	
	if(image_index == 4){
		sprite_set_offset(gun01, 4, 9);
	}
	
	if(image_index == 5){
		sprite_set_offset(gun01, 4, 10);
	}
	
	if(image_index == 6){
		sprite_set_offset(gun01, 2, 11);
	}
	
	if(image_index == 7){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 8){
		sprite_set_offset(gun01, 2, 10);
	}
	
	if(image_index == 9){
		sprite_set_offset(gun01, 3, 10);
	}
	
	}
	
}else{
	draw_sprite_ext(gun01 , 0, x, y, 1, -1, dir, image_blend, image_alpha);
	
	if(spr_name == "spr_idle_no"){
	
			if(image_index == 1){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 2){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 3){
		sprite_set_offset(gun01, -2, 12);
	}
	
	if(image_index == 4){
		sprite_set_offset(gun01, 4, 9);
	}
	
	if(image_index == 5){
		sprite_set_offset(gun01, 4, 10);
	}
	
	if(image_index == 6){
		sprite_set_offset(gun01, 2, 11);
	}
	
	if(image_index == 7){
		sprite_set_offset(gun01, 2, 12);
	}
	
	if(image_index == 8){
		sprite_set_offset(gun01, 2, 10);
	}
	
	if(image_index == 9){
		sprite_set_offset(gun01, 3, 10);
	}
	
	}
}