/// @description Insert description here
// You can write your code in this editor

scr_init_inventory();
scr_create_inventory();

scr_gain_item(item.apple, 3);
scr_gain_item(item.staff, 1);
scr_gain_item(item.sword, 2);
global.inventory[# 5, 0] = item.health_potion;
scr_slot_modify_amount(5, 2, true);
