/// @description Draw the mouse items.
with (obj_slot)
 {
	//Get values
	var iid = global.inventory[# var_slot, 0];
	var amount = global.inventory[# var_slot, 1];
	
	/// vai no "Banco de dados e puxa pelo id atual, a sprite certa"
	var sprite = ds_grid_get(global.item_index, iid, item_stat.sprite);
	var sprt = asset_get_index(sprite);

	//Draw stuff
	if (iid != item.none)
	 {
		 
		draw_sprite(sprt, 0, x, y); //Draw item sprite
		draw_text(x+4, y+4, string(amount)); //Draw item quantity
		}
	}
//Get values
var iid = global.mouse_slot[# 0, 0];
var amount = global.mouse_slot[# 0, 1];


/// vai no "Banco de dados e puxa pelo id atual, a sprite certa"
var sprite = ds_grid_get(global.item_index, iid, item_stat.sprite);
var sprt = asset_get_index(sprite);

//Draw stuff
if (iid != item.none)
 {
	draw_sprite(sprt, 0, mouse_x-15, mouse_y-15); //Draw item sprite
	draw_text(mouse_x+4-20, mouse_y+4-20, string(amount)); //Draw item quantity
	}