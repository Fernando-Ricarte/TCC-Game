#region ARGUMENTOS
/// argumentos de sprite
sprite_idle = argument0;
sprite_walk = argument1;
sprite_atack = argument2;
#endregion

#region CHECANDO COLISÕES
// colisão horizontal
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
#endregion

#region PRÉ-CHECAMENTOS DE ESTADO
// chacando se o personagem esta no chao
chao = place_meeting(x, y + 1, obj_chao);

right = 0;
left = 0;

// aplicando velocidade horizontal/ gravidade vertical
velh = (right - left) * max_velh;

// configurando movimentações da movimentação
avanco_h = (right - left) * max_velh;

// limitando as velocidades
velv = clamp(velv, -max_velv, max_velv);

velh = lerp(velh, avanco_h, acel);

// gravidade
if( !chao )
{
	velv += grav;
	estado = stateInimigoWalker.parado;
	
	if ( collision_line(x, y, x - 5, y,obj_chao, 1, 0))
	{
		x++;
		var_lado = ultimo_hit_lado;
	}
	else if ( collision_line(x, y, x + 5, y,obj_chao, 1, 0))
	{
		x--;
		var_lado = ultimo_hit_lado;
	}
}

// verfifcando quanto tempo esta no ar -----//

if(!chao)
{
	temp += 1 / 64;
}else{
	temp = 0;
}

/// verificando se vai se encontrar com uma parede
if(var_lado == 1)
{
	parede_previsao = collision_line(x, y, x + 10, y,obj_chao, 1, 0);
}
else if(var_lado == -1)
{
	parede_previsao = collision_line(x, y, x - 10, y,obj_chao, 1, 0);
}

/// verifica colisão com player
if ( collision_line(x, y, x + 200, y, obj_player, 1, 0) )
{
	estado = stateInimigoWalker.seguindo;
}
else if ( collision_line(x, y, x - 200, y, obj_player, 1, 0) )
{
	estado = stateInimigoWalker.seguindo;
}
else
{
	estado = stateInimigoWalker.peranbulando;
}

//Verifica o quão perto está do player para realizar o ataque
if (distance_to_object(obj_player) < 5){
	estado = stateInimigoWalker.atacando
}
#endregion

#region STATE_MACHINE INIMIGO
switch(estado){
	case stateInimigoWalker.seguindo:
	#region STATE: SEGUINDO O PLAYER
			/// muda direceção do atk caso o player sai da frente do inimigo
			if( obj_player.x > x )
			{
				image_xscale = 1;
			}
			else
			{
				image_xscale = -1;
			}
	
			pos_x_player = obj_player.x;
			if(pos_x_player > x){
				direcao = 30;
				perto = 5.2;
			}else{
				direcao = -30;
				perto = -5.2;
			}
			
			if(var_lado == 1)
			{
				parede_previsao = place_meeting(x + 5, y, obj_chao);
			}
			else if(var_lado == -1)
			{
				parede_previsao = place_meeting(x - 5, y, obj_chao);
			}
			
			if( parede_previsao )
			{
				estado = stateInimigoWalker.parado;
			}
			
			chao_previsao = place_meeting(x + direcao, y + 1, obj_chao);
			chega_perto_demais = place_meeting(x + perto, y, obj_player);
			
			if(chao_previsao){
				if(!chega_perto_demais){
					
					sprite_index = sprite_walk;
					seguir = sign(obj_player.x - x);
					image_xscale = seguir;
					velh = seguir * 4;
					
					//Verifica o quão perto está do player para realizar o ataque
					if (distance_to_object(obj_player) < 5){
						estado = stateInimigoWalker.atacando
					}
					
				}else{
					sprite_index = sprite_idle;
				}
			}else{
				estado = stateInimigoWalker.parado;
				sprite_index = sprite_idle;
			}
		#endregion
	break;
	case stateInimigoWalker.parado:
	#region STATE: PARADO/IDDLE
	
			// verifica quanto tempo o npc esta parado
			timerParado += 1 / 64;
			// passou 1 segundo que o npc está parado
			if(timerParado > random_range(3, 18) ){
					estado = stateInimigoWalker.peranbulando;
					timerParado = 0;
			}else{
				sprite_index = sprite_idle;	
			}
	#endregion	
	break;
		
	case stateInimigoWalker.peranbulando:
	#region STATE: ANDANDO/PERAMBULANDO
		/// verifica colisão com player
		if ( collision_line(x, y, x + 200, y, obj_player, 1, 0) )
		{
			estado = stateInimigoWalker.seguindo;
		}
		else if ( collision_line(x, y, x - 200, y, obj_player, 1, 0) )
		{
			estado = stateInimigoWalker.seguindo;
		}
		else
		{
			estado = stateInimigoWalker.peranbulando;
		}
		
		if( !chao )
		{
			estado = stateInimigoWalker.parado;
			exit;
		}
		
		if(var_lado == 1)
		{
			x_scale = 1;
			chao_pre = 40;
			x += 4;
				
			parede_previsao = place_meeting(x+10, y - 1, obj_chao);
		}
		if(var_lado == -1)
		{
			x_scale = -1;
			chao_pre = -40;
			x -= 4;
				
			parede_previsao = place_meeting(x-10, y - 1, obj_chao);
		}
			
		temp_perambulando = temp_perambulando + 1 / 60;
			
		if( temp_perambulando > random_range(3, 20) )
		{
			temp_perambulando = 0;
			estado = stateInimigoWalker.parado;
			exit;
		}
			
		sprite_index = sprite_walk;
		image_xscale = x_scale;
		
		chao_previsao2 = place_meeting(x + chao_pre, y + 1, obj_chao);
			
		if(!chao_previsao2 || parede_previsao && chao )
		{
			var_lado = var_lado * -1;
		}
		
		break;
		
		case stateInimigoWalker.atacando:
		
			sprite_index = sprite_atack;
			
			/// muda direceção do atk caso o player sai da frente do inimigo
			if( obj_player.x > x )
			{
				image_xscale = 1;
			}
			else
			{
				image_xscale = -1;
			}
			
			if( bater )
			{
				with(instance_create_layer( x, y, "cursor", hit_box_noia))
				{
					image_xscale = other.image_xscale;
					
					with(instance_place( x, y, obj_player ))
					{
						audio_play_sound(snd_facada_hit, 10, false);
						scr_hit_player(x, y);
						global.hp -= argument3;
					}
				}
				bater = false;
				timer_hit = 0;
			}else{
				timer_hit += 1 / 60;
					
				if(timer_hit > 0.6){
					bater = true;
				}
			}
			
			if (distance_to_object(obj_player) < 5){
				estado = stateInimigoWalker.atacando;
			}
			else
			{
				/// verifica colisão com player
				if ( collision_line(x, y, x + 200, y, obj_player, 1, 0) )
				{
					estado = stateInimigoWalker.seguindo;
				}
				else if ( collision_line(x, y, x - 200, y, obj_player, 1, 0) )
				{
					estado = stateInimigoWalker.seguindo;
				}
				else
				{
					estado = stateInimigoWalker.peranbulando;
				}
			}
	break;
	#endregion
}
#endregion