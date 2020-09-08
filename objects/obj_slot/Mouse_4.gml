/// @description Insert description here
// You can write your code in this editor

var iid = global.inventory[# var_slot, 0];

var nome_item = global.item_index[# iid, item_stat.name];
var type_item = global.item_index[# iid, item_stat.type];
var damage_item = global.item_index[# iid, item_stat.damage];
var healt_points = global.item_index[# iid, item_stat.health_gain];
var quant = global.inventory[# var_slot, 1];

if(type_item == item_type.food)
{
	if(global.hp < 100){
		
		var soma_previa = global.hp + healt_points;
		if(soma_previa <= 100)
		{
			global.hp += healt_points;
		}else{
			global.hp = 100;
		}
		
		global.inventory[# var_slot, 1] = quant - 1;
		
	}
	
}



// verifica a quantidade de item se for igual a 0 ele seta para non-item
if(quant == 1){
	global.inventory[# var_slot, 0] = item.none;
}