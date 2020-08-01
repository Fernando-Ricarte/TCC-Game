/// @description Insert description here
// You can write your code in this editor

scr_init_inventory();

// método que adiciona itens ao inventario do personagem
//scr_gain_item(item.cajado_amarelo, 5);
//scr_gain_item(item.cajado_azul, 2);
//scr_gain_item(item.sword, 1);
//scr_gain_item(item.cajado_floresta, 6);
//scr_gain_item(item.cajado_amarelo, 2);

scr_slot_modify_amount(5, 2, true);

/// @description Creates the inventory slots.

for (var i = 0; i < ds_grid_width(global.inventory); i++)
 {
	var w = sprite_get_width(spr_slot);
	var pos_x = i * w + (w * 4);
	var pos_y = camera_get_view_height(view_camera[0]);
	
	pos_y = pos_y / pos_y;
	
	pos_y = pos_y + 30;
	
	var s = instance_create_layer(pos_x, 50, "inventory", obj_slot);
	
	s.var_slot = i;
	s.pos_x = pos_x;
	s.pos_y = pos_y;
}
