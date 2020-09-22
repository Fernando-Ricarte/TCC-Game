/// @description Insert description here
// You can write your code in this editor

x = obj_player.x;
y = obj_player.y;

image_angle = point_direction(x,y,mouse_x,mouse_y);

fdelay = fdelay -1;
recoil = max(0,recoil - 1);
tem_lancavel = false;
tem_quantidade = false;

//for (var i = 0; i < ds_grid_width(global.inventory); i++)
//{
//	var iid = global.inventory[# i, 0];
//	var nome_item = global.item_index[# iid, item_stat.name];
	
//	//if(iid == item.shuriken){
//	//	tem_lancavel = true;
//	//	id_lancavel = iid;
//	//}
//}

var idd_escolhido = global.item_escolhido_slot[# 0, 0];
var var_slot = global.item_escolhido_slot[# 0, 1];
var slot_id = global.inventory[# var_slot, 0];
var quant = global.inventory[# var_slot, 1];

var item_stat = global.item_index[# idd_escolhido, item_stat.type];

if(item_stat == item_type.lancavel)
{
	tem_lancavel = true;
}else{
	tem_lancavel = false;
}

if( slot_id == item.none ){
	tem_quantidade = false;
	global.inventory[# var_slot, 0] = item.none;
	global.item_escolhido_slot[# 0, 0] = item.none;
}else{
	if(quant >= 1){
		tem_quantidade = true;
	}else{
		tem_quantidade = false;
		global.inventory[# var_slot, 0] = item.none;
		global.item_escolhido_slot[# 0, 0] = item.none;
	}	
}


if ( tem_quantidade && tem_lancavel && mouse_check_button_pressed( mb_left ) ) && ( fdelay < 0 ){
	
	recoil = 14;
	fdelay = 10;	
	/*var obj = instance_create_depth(x,y,-10,obj_shoot);*/
	
	with(instance_create_layer(x,y,"player",obj_shoot)){
		speed = 25;
		direction = other.image_angle + random_range(-3,3 );
		image_angle = direction;	
		audio_play_sound(shuriken_shoot,0,false);
	}
  
	scr_diminuir_qtd(idd_escolhido);
}

//calculo do recoil a cada tiro
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);


//girar sprite da arma quando mirar para trás

if(image_angle > 90) && (image_angle < 270){
	image_yscale = -1;
}else{
	image_yscale = 1;
}