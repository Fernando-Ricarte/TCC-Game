/// @description Insert description here
// You can write your code in this editor

var xx = lengthdir_x( 25, image_angle);
var yy = lengthdir_y( 25, image_angle);

var idd_escolhido = global.item_escolhido_slot[# 0, 0];

var item_sprite = global.item_index[# idd_escolhido, item_stat.sprite];
var sprite_gun = asset_get_index(item_sprite);

var idd_escolhido = global.item_escolhido_slot[# 0, 0];
var item_stat = global.item_index[# idd_escolhido, item_stat.type];

if(item_stat == item_type.lancavel || item_stat == item_type.fire_gun)
{
	show_guns = true;
}else{
	show_guns = false;
}

if ( show_guns )
{
	obj_weapon2.visible = true;
	
	with( obj_weapon2 )
	{
		x = other.x + xx;
		y = other.y + yy;
		sprite_index = sprite_gun;
		
		if(mouse_x > x){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
		
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	}
}
else
{
	obj_weapon2.visible = false;	
}