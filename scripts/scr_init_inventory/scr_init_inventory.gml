/// @description Setup item variables

//Item ids
enum item
 {
	none,
	apple,
	sword,
	health_potion,
	staff,
	total
	}

enum item_stat
 {
 name,
 description,
 type,
 damage,
 health_gain,
	total
 }

enum item_type
 {
 none,
 weapon,
 food
 }

global.inventory = ds_grid_create(10, 2);
ds_grid_clear(global.inventory, 0);
//Create a ds grid item.total wide, and item_stat.total tall
global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0
global.mouse_slot = ds_grid_create(1, 2);

scr_add_food(item.apple, "Apple", "Pretty basic. In every RPG.",  10);
scr_add_food(item.health_potion, "Health Potion", "It's red. Like normal.", 25);
scr_add_weapon(item.sword, "Sword", "A sword to banish evil!",  3);
scr_add_weapon(item.staff, "Staff", "A magic staff, pulsing with power.", 5);