//@param indice do slot

var var_s = argument0;

var iid = global.inventory[# var_s, 0];

global.item_escolhido_slot[# 0, 0] = iid;
global.item_escolhido_slot[# 0, 1] = var_s;

var id_obj = instance_find(obj_slot, var_s);

obj_slot.sprite_index = spr_slot;

with( id_obj )
{
	sprite_index = spr_slot_selected;
}