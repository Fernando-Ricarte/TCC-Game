/// @description Creates the inventory slots.

var slot = 0;
while (slot < ds_grid_width(global.inventory))
 {
	var inst = instance_create_layer(x+4+(64*slot), y+64, "inventory", obj_slot);
	inst.var_slot = slot;
	slot ++;
}