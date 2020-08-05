/// @description scr_add_weapon(item_ID, name, description, damage)
/// @function scr_add_weapon
/// @param item_ID
/// @param name
/// @param description
/// @param damage

var id_ = argument0;
global.item_index[# id_ , item_stat.name] = argument1;
global.item_index[# id_ , item_stat.description] = argument2;
global.item_index[# id_, item_stat.sprite] = argument3;


global.item_index[# id_, item_stat.type] = item_type.diversos;