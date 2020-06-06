/// @description Insert description here
// You can write your code in this editor
/// @description Draw the mouse items.
with (obj_slot)
 {
	//Get values
	var iid = global.inventory[# var_slot, 0];
	var amount = global.inventory[# var_slot, 1];

	//Draw stuff
	if (iid != item.none)
	 {
		draw_sprite(spr_item, iid, x, y); //Draw item sprite
		draw_text(x+4, y+4, string(amount)); //Draw item quantity
		}
	}
//Get values
var iid = global.mouse_slot[# 0, 0];
var amount = global.mouse_slot[# 0, 1];

//Draw stuff
if (iid != item.none)
 {
	draw_sprite(spr_item, iid, mouse_x-32, mouse_y-32); //Draw item sprite
	draw_text(mouse_x+4-32, mouse_y+4-32, string(amount)); //Draw item quantity
	}

