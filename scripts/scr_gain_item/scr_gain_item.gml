/// @description Adds an item and a quantity into the inventory in a valid slot.
/// @function scr_gain_item(item_ID, amount);
/// @param item_ID
/// @param amount

var iid = argument0;
var amount = argument1;


with ( instance_create_layer(obj_player.x + irandom_range(-80, 80), obj_player.y - irandom_range(80, 155), "player", obj_gain_desc ) )
{
	name = global.item_index[# iid, item_stat.name];
	value = string(amount);
}


var slot = 0; //A temporary variable to loop through the slots
var inventory_width = ds_grid_width(global.inventory);

while (slot < inventory_width)
 {
	//If the tested slot in the inventory is either empty, or contains a matching item id
	if (global.inventory[# slot, 0] == iid || global.inventory[# slot, 0] == item.none)
	 {
		global.inventory[# slot, 0] = iid;
		global.inventory[# slot, 1] += amount;
		return true; //Did set the slot
		exit; //Exit function, because it has set the slot
		}
	slot ++; //Incriment slot to test next position
 }
return false; //Did not set slot