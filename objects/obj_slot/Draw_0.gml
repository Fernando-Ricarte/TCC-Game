/// @description Insert description here
// You can write your code in this editor

draw_self();

if(mouse_encima){
	
	boxWidth = sprite_get_width(textbox1);
	var idd = global.inventory[# var_slot, 0];
	
	if(idd != item.none){
		nome_item = global.item_index[# idd, item_stat.name];
		stringHeigth = string_height(nome_item);
		draw_sprite(textbox1, 0, x, y+45);
		draw_set_font(font_textbox);
		draw_text_ext(x-180, y+75, nome_item, stringHeigth, boxWidth);
	}
}