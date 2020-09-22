/// @description scr_add_weapon(item_ID, name, description, damage)
/// @function scr_add_weapon
/// @param item_ID
/// @param name
/// @param description
/// @param damage

var iid = argument0;
global.item_index[# iid, item_stat.name] = argument1;
global.item_index[# iid, item_stat.description] = argument2;
global.item_index[# iid, item_stat.damage] = argument3;
global.item_index[# iid, item_stat.sprite] = argument4;

global.item_index[# iid, item_stat.type] = item_type.lancavel;