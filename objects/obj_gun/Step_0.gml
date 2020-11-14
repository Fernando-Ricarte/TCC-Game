 /// @description Insert description here
// You can write your code in this editor

/// posição da arma ou do obj a ser lançado
x = obj_player.x;
y = obj_player.y;

/// direção para qual o obj sera lancado
image_angle = point_direction(x,y,mouse_x,mouse_y);

/// variaveis de definição
fdelay = fdelay -1; 
recoil = max(0,recoil - 1);
tem_lancavel = false;
tem_quantidade = false;

/// faz uma busca na base de dados do inventario pegando o indice atual do slot equipado
/// e traz todos os dados do item selecionado
var idd_escolhido = global.item_escolhido_slot[# 0, 0];
var var_slot = global.item_escolhido_slot[# 0, 1];
var slot_id = global.inventory[# var_slot, 0];
var quant = global.inventory[# var_slot, 1];
var item_stat = global.item_index[# idd_escolhido, item_stat.type];
var item_name = global.item_index[# idd_escolhido, item_stat.name];
var item_bullet_sprite = global.item_index[# idd_escolhido, item_stat.spr_bullet];
var sprite_bullet_gun = asset_get_index(item_bullet_sprite);
var healt_points = global.item_index[# idd_escolhido, item_stat.health_gain];

/// verifica se é do tipo "arma" ou do tipe "lançavel"
if(item_stat == item_type.lancavel || item_stat == item_type.fire_gun)
{
	show_arms_guns = true;
}
else
{
	show_arms_guns = false;
}



/// verifica se o item é do tipo noone, que é um não item, ou seja slot vazio
if( slot_id == item.none ){
	tem_quantidade = false;
	global.inventory[# var_slot, 0] = item.none;
	global.item_escolhido_slot[# 0, 0] = item.none;
}else{
	/// verifica a quantidade de itens que tem no slot equipadao
	if(quant >= 1)
	{
		tem_quantidade = true;
	}
	else
	{
		/// se não tiver seta no slot que é um não item, ou seja um espaço vazio
		tem_quantidade = false;
		global.inventory[# var_slot, 0] = item.none;
		global.item_escolhido_slot[# 0, 0] = item.none;
	}	
}

/// if se tem quantidade para usar o item, se o botão for pressionado, e calcula um delay de ativação
if ( tem_quantidade && mouse_check_button_pressed( mb_left ) ) && ( fdelay < 0 )
{
	recoil = 14;
	fdelay = 10;
	
	/// se é algum tipo de lancavel ou arma
	if( show_arms_guns )
	{
		with(instance_create_layer( x + lengthdir_x( 25 , obj_braco.image_angle), y + lengthdir_y( 25 , obj_braco.image_angle) , "player", bullet ) ) 
		{
			if( item_stat == item_type.fire_gun )
			{
				scr_firegun_effect(x + lengthdir_x( 25 , obj_braco.image_angle), y + lengthdir_y( 25 , obj_braco.image_angle));
			}
			sprite_index = sprite_bullet_gun;
			speed = 25;
			direction = other.image_angle + random_range(-3,3 );
			image_angle = direction;
		
			var item_audio = global.item_index[# idd_escolhido, item_stat.som_tiro];
			var audio = asset_get_index(item_audio);
			
			/// diminui a qtd de itens no slot
			scr_diminuir_qtd(idd_escolhido);
			audio_play_sound(audio, 0, false);
		}
	}
	
	/// verfica se no slot selecionado, esta guardando algumn item do tipo "cura"
	else if( item_stat == item_type.food )
	{
		if(global.hp < 100)
		{
			var soma_previa = global.hp + healt_points;
			if(soma_previa <= 100)
			{
				global.hp += healt_points;
			}
			else
			{
				global.hp = 100;
			}
		
			script_execute(src_lansa_health);
			audio_play_sound(health1 ,0,false);
			
			/// diminui a qtd de itens no slot
			scr_diminuir_qtd(idd_escolhido);
		}
	}
}


//calculo do recoil a cada tiro
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);


//girar sprite da arma quando mirar para trás, "atras" == X do MOUSE > que o X do PLAYER
if(image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}else
{
	image_yscale = 1;
}