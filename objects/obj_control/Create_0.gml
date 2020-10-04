/// @description Insert description here
// You can write your code in this editor

scr_init_inventory();

// método que adiciona itens ao inventario do personagem
//scr_gain_item(item.cajado_amarelo, 5);
//scr_gain_item(item.cajado_azul, 2);
//scr_gain_item(item.sword, 1);
//scr_gain_item(item.cajado_floresta, 6);
//scr_gain_item(item.cajado_amarelo, 2);

/// @description Creates the inventory slots.

for (var i = 0; i < ds_grid_width(global.inventory); i++)
 {
	var w = sprite_get_width(spr_slot);
	var tamanho_camera_largura = camera_get_view_width(view_camera[0]);
	var metade_camera = tamanho_camera_largura / 2;
	var pos_x = i * w + (metade_camera / 1.7);
	
	
	var pos_y = camera_get_view_height(view_camera[0]);
	pos_y = pos_y / 25;
	
	
	var s = instance_create_layer(pos_x, pos_y, "inventory", obj_slot);
	
	s.var_slot = i;
	s.pos_x = pos_x;
	s.pos_y = pos_y;
}
