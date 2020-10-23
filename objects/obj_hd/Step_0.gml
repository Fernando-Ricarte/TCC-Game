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

y_player = obj_player.y;
			
if(y_player > y-40 && y_player < y+40){
	pode_seguir = true;
}else{
	pode_seguir = false;	
}

pode_mover = true;

if(obj_player.x == x && obj_player.y > y){
	pode_mover = false;
}else if(obj_player.x == x && obj_player.y < y){
	pode_mover = false;	
}

// verifica se o player esta perto, se sim ele muda o estado para seguindo
if (distance_to_object(obj_player) < distance && distance_to_object(obj_player) > 10 && pode_seguir && pode_mover)
{
	estado = stateHd.seguindo;
}

// --------- animações -------------------//

switch(estado){
	case stateHd.seguindo:
			
			pos_x_player = obj_player.x;
			if(pos_x_player > x){
				direcao = 40;
				perto = 2;
			}else{
				direcao = -40;
				perto = -2;
			}
			
			chao_previsao = place_meeting(x+direcao, y + 1, obj_chao);
			chega_perto_demais = place_meeting(x+perto, y, obj_player);
			
			if(chao_previsao){
				if(!chega_perto_demais){
					
					sprite_index = spr_hdRun;
					seguir = sign(obj_player.x - x);
					image_xscale = seguir;
					velh = seguir*4;
					
					//Verifica o quão perto está do player para realizar o ataque
					if (distance_to_object(obj_player) < 10){
						estado = stateHd.atacando
					}
					
				}else{
					sprite_index = spr_hdIdle;
				}
			}else{
				estado = stateHd.parado;
				sprite_index = spr_hdIdle;
			}
		
		break;
	case stateHd.parado:
	
			// verifica quanto tempo o npc esta parado
			timerParado += 1 / 64;
			// passou 1 segundo que o npc está parado
			if(timerParado > 1){
					estado = stateHd.peranbulando;
					timerParado = 0;
			}else{
				sprite_index = spr_hdIdle;	
			}
		
		break;
		
	case stateHd.peranbulando:
	
		// verifica se o player esta perto, se sim ele muda o estado para seguindo
		if (distance_to_object(obj_player) < distance && distance_to_object(obj_player) > 10 && pode_seguir && pode_mover)
		{
			estado = stateHd.seguindo;	
		}else{
			
			if(var_lado == 1){
				x_scale = 1;
				chao_pre = 40;
				x += 4;
			}
			if(var_lado == -1){
				x_scale = -1;
				chao_pre = -40;
				x -= 4;
			}
			
			sprite_index = spr_hdRun;
			image_xscale = x_scale;
			chao_previsao2 = place_meeting(x+chao_pre, y + 1, obj_chao);
			
			if(!chao_previsao2){
				var_lado = var_lado * -1;
			}
			
		}
		break;
		
		case stateHd.atacando:
		
			sprite_index = spr_hdAttack;
			
			//Verifica o quão perto está do player para realizar o ataque
			if (distance_to_object(obj_player) < 5){
				estado = stateHd.atacando
			}else{
				estado = stateHd.peranbulando;
			}
		
		break;
}


//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}