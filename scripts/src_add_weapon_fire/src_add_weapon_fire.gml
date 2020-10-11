/// @description scr_add_weapon(item_ID, name, description, damage)
/// @function scr_add_weapon
/// @param item_ID
/// @param name
/// @param description
/// @param damage
/// @param sprite
/// @param spr_bullet
/// @param spr_arm
/// @param som_tiro

var iid = argument0;
global.item_index[# iid, item_stat.name] = argument1;
global.item_index[# iid, item_stat.description] = argument2;
global.item_index[# iid, item_stat.damage] = argument3;
global.item_index[# iid, item_stat.sprite] = argument4;
global.item_index[# iid, item_stat.spr_bullet] = argument5;
global.item_index[# iid, item_stat.spr_arm] = argument6;
global.item_index[# iid, item_stat.som_tiro] = argument7;

global.item_index[# iid, item_stat.type] = item_type.fire_gun;