/// @description scr_add_food(item_ID, name, description, health_gain);
/// @function scr_add_food
/// @param item_ID
/// @param name
/// @param description
/// @param health_gain

var iid = argument0;
global.item_index[# iid, item_stat.name] = argument1;
global.item_index[# iid, item_stat.description] = argument2;
global.item_index[# iid, item_stat.health_gain] = argument3;

global.item_index[# iid, item_stat.type] = item_type.food;