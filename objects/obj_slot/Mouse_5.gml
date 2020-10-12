 /// @description Insert description here
// You can write your code in this editor

/// @description Move items with the mouse

var iid = global.inventory[# var_slot, 0];

global.item_escolhido_slot[# 0, 0] = iid;
global.item_escolhido_slot[# 0, 1] = var_slot;


obj_slot.sprite_index = spr_slot;
sprite_index = spr_slot_selected;




//var mouse_iid = global.mouse_slot[# 0, 0];
//var mouse_amount = global.mouse_slot[# 0, 1];

//if (iid == 0 || mouse_iid == 0 || iid != mouse_iid) //If either slot is empty, or the two slots don't match
// {
//	//Switch the slots
//	global.inventory[# var_slot, 0] = mouse_iid;
//	global.inventory[# var_slot, 1] = mouse_amount;
//	global.mouse_slot[# 0, 0] = iid;
//	global.mouse_slot[# 0, 1] = amount;
//	}
//else if (iid == mouse_iid) //If both slots are the same
// {
//	//Take all mouse items and put them in inventory
//	while (global.inventory[# var_slot, 1] < 10)
//	 {
//		global.inventory[# var_slot, 1] += 1;
//		global.mouse_slot[# 0, 1] -= 1;
//		if (global.mouse_slot[# 0, 1] <= 0)
//		 {
//			global.mouse_slot[# 0, 0] = item.none;
//			global.mouse_slot[# 0, 1] = 0;
//			exit;
//			}
//		}
//	}