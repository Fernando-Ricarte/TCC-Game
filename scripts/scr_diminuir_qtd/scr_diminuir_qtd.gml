iid = argument0;

var slot = 0; //A temporary variable to loop through the slots
var inventory_width = ds_grid_width(global.inventory);

while (slot < inventory_width)
{
	//If the tested slot in the inventory is either empty, or contains a matching item id
	if (global.inventory[# slot, 0] == iid)
	 {
		global.inventory[# slot, 0] = iid;
		
		if(global.inventory[# slot, 1] == 1){
			global.inventory[# slot, 0] = item.none;
		}else{
			global.inventory[# slot, 1] -= 1;
		}
		exit; //Exit function, because it has set the slot
		}
	slot ++; //Incriment slot to test next position
}