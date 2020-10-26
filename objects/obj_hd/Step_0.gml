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
if(!chao)
{
	velv += grav;
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

/// verificando player
if ( collision_line(x, y - 32, x + 200, y - 32, obj_player, 1, 0) )
{
	estado = stateHD.seguindo;
}
if ( collision_line(x, y - 32, x - 200, y - 32, obj_player, 1, 0) )
{
	estado = stateHD.seguindo;
}

//Verifica o quão perto está do player para realizar o ataque
if (distance_to_object(obj_player) < 1){
	estado = stateHD.atacando
}

// --------- animações -------------------//

switch(estado){
	case stateHD.seguindo:
	
			pos_x_player = obj_player.x;
			if(pos_x_player > x){
				direcao = 30;
				perto = 2;
			}else{
				direcao = -30;
				perto = -2;
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
				estado = stateHD.parado;
			}
			
			chao_previsao = place_meeting(x + direcao, y + 1, obj_chao);
			chega_perto_demais = place_meeting(x + perto, y, obj_player);
			
			if(chao_previsao){
				if(!chega_perto_demais){
					
					sprite_index = spr_hdRun;
					seguir = sign(obj_player.x - x);
					image_xscale = seguir;
					velh = seguir * 4;
					
					//Verifica o quão perto está do player para realizar o ataque
					if (distance_to_object(obj_player) < 1){
						estado = stateHD.atacando
					}
					
				}else{
					sprite_index = spr_hdIdle;
				}
			}else{
				estado = stateHD.parado;
				sprite_index = spr_hdIdle;
			}
		
		break;
	case stateHD.parado:
	
			// verifica quanto tempo o npc esta parado
			timerParado += 1 / 64;
			// passou 1 segundo que o npc está parado
			if(timerParado > random_range(3, 18) ){
					estado = stateHD.peranbulando;
					timerParado = 0;
			}else{
				sprite_index = spr_hdIdle;	
			}
		
		break;
		
	case stateHD.peranbulando:
	
		if ( collision_line(x, y - 32, x + 200, y - 32, obj_player, 1, 0) )
		{
			estado = stateHD.seguindo;
		}
		if ( collision_line(x, y - 32, x - 200, y - 32, obj_player, 1, 0) )
		{
			estado = stateHD.seguindo;
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
			
		if( temp_perambulando > random_range(3, 18) )
		{
			temp_perambulando = 0;
			estado = stateHD.parado;
			exit;
		}
			
		sprite_index = spr_hdRun;
		image_xscale = x_scale;
		chao_previsao2 = place_meeting(x + chao_pre, y + 1, obj_chao);
			
		if(!chao_previsao2 || parede_previsao )
		{
			var_lado = var_lado * -1;
		}
		
		break;
		
		case stateHD.atacando:
		
			sprite_index = spr_hdAttack;
			
			/// muda direceção do atk caso o player sai da frente do inimigo
			if( obj_player.x > x )
			{
				image_xscale = 1;
			}
			else
			{
				image_xscale = -1;
			}
			
			if (distance_to_object(obj_player) < 1){
				estado = stateHD.atacando;
			}
			else
			{
				/// verificando player
				if ( collision_line(x, y - 32, x + 200, y - 32, obj_player, 1, 0) )
				{
					estado = stateHD.seguindo;
				}else
				{
					estado = stateHD.peranbulando;
				}
				if ( collision_line(x, y - 32, x - 200, y - 32, obj_player, 1, 0) )
				{
					estado = stateHD.seguindo;
				}else
				{
					estado = stateHD.peranbulando;
				}
			}
		break;
}

//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}