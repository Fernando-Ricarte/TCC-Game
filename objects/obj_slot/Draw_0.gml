/// @description Insert description here
// You can write your code in this editor

draw_self();

if(mouse_encima){
	
	//boxWidth = sprite_get_width(textbox1);
	var idd = global.inventory[# var_slot, 0];
	
	if(idd != item.none){
		nome_item = global.item_index[# idd, item_stat.name];
		//stringHeigth = string_height(nome_item);
		//draw_sprite(textbox1, 0, x, y+45);
		if(object_exists(obj_textbox)){
			instance_destroy(obj_textbox);
			instance_create_layer(x-50, y+80, "inventory" ,obj_textbox);
		}else{
			instance_create_layer(x-50, y+80, "inventory" ,obj_textbox);
		}
		
		draw_text(obj_textbox.x-50, obj_textbox.y, nome_item);
		
		//if(object_exists(obj_textbox)){
		//	with(obj_textbox){
		//		draw_set_font(font_textbox);
		//		draw_set_color(c_lime);
		//		//draw_text(obj_textbox.x-50, obj_textbox.y, nome_item);
		//		draw_text(x, y, nome_item);
		//	}
		//}
	}
}