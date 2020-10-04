/// @description Insert description here
// You can write your code in this editor

///========================================================================================
var idd_escolhido = global.item_escolhido_slot[# 0, 0];
var var_slot = global.item_escolhido_slot[# 0, 1];

var quant = global.inventory[# var_slot, 1];

var item_stat = global.item_index[# idd_escolhido, item_stat.type];

if(item_stat == item_type.lancavel || item_stat = item_type.fire_gun )
{
	tem_lancavel = true;
}else{
	tem_lancavel = false;
}
//==========================================================================================

draw_self();