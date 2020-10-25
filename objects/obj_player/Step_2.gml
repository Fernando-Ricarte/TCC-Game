/// @description Insert description here
// You can write your code in this editor

//jaaaaaaaaaaaaaj
//colisão horizontal
if(place_meeting(x + velh, y, obj_chao))
{
	while(!place_meeting(x + sign(velh), y, obj_chao))
	{
		x += sign(velh);	
	}
	
	velh = 0;
}
x += velh;


// colisão vertical
if(place_meeting(x, y + velv, obj_chao))
{
	while(!place_meeting(x, y + sign(velv), obj_chao))
	{
		y += sign(velv);
	}
	
	velv = 0;
}
y += velv;


////            B R A Ç O     D  O     P L A Y E R

///========================================================================================
var idd_escolhido = global.item_escolhido_slot[# 0, 0];
var var_slot = global.item_escolhido_slot[# 0, 1];

var quant = global.inventory[# var_slot, 1];

var item_stat = global.item_index[# idd_escolhido, item_stat.type];

if(item_stat == item_type.lancavel || item_stat == item_type.fire_gun && !global.shindeiru )
{
	tem_lancavel = true;
}else{
	tem_lancavel = false;
}
//==========================================================================================

if( !global.shindeiru )
{
	if( tem_lancavel )
	{
		obj_braco.visible = true;
		obj_braco_esq.visible = true;
	}
	else
	{
		obj_braco.visible = false;
		obj_braco_esq.visible = false;
	}
}

if(	pulando_antes && chao )
{
	script_execute(src_lansa_poeira, x, y);
}