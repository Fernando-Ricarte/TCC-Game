/// @description Insert description here
// You can write your code in this editor

scr_init_inventory();

scr_gain_item(item.apple, 3);
scr_gain_item(item.staff, 1);
scr_gain_item(item.sword, 2);
global.inventory[# 5, 0] = item.health_potion;
scr_slot_modify_amount(5, 2, true);



/// @description Creates the inventory slots.

for (var i = 0; i < ds_grid_width(global.inventory); i++)
 {
	var w = sprite_get_width(spr_slot);
	var pos_x = i * w + 50;
	var pos_y = camera_get_view_height(view_camera[0]);
	
	pos_y = pos_y / 1.2;
	
	var s = instance_create_layer(pos_x, 50, "inventory", obj_slot);
	
	s.var_slot = i;
	s.pos_x = pos_x;
	s.pos_y = pos_y;
}
