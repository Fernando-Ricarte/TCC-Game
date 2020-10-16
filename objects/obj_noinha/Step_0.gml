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
			
if(y_player > y - 80 && y_player < y + 80){
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

if(var_lado == 1)
{
	parede_previsao = place_meeting(x + 5, y, obj_chao);
}
else if(var_lado == -1)
{
	parede_previsao = place_meeting(x - 5, y, obj_chao);
}

// verifica se o player esta perto, se sim ele muda o estado para seguindo
if ( !parede_previsao && distance_to_object(obj_player) < distance && distance_to_object(obj_player) > 5 && pode_seguir && pode_mover)
{
	estado = stateNoinha.seguindo;
}

//Verifica o quão perto está do player para realizar o ataque
if (distance_to_object(obj_player) < 6){
	estado = stateNoinha.atacando
}

// --------- animações -------------------//

switch(estado){
	case stateNoinha.seguindo:
	
			if(y_player > y - 80 && y_player < y + 80){
				
			}else{
				estado = stateNoinha.peranbulando;
				exit;
			}

			
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
				estado = stateNoinha.parado;
				exit;
			}
			
			chao_previsao = place_meeting(x+direcao, y + 1, obj_chao);
			chega_perto_demais = place_meeting(x+perto, y, obj_player);
			
			if(chao_previsao){
				if(!chega_perto_demais){
					
					sprite_index = spr_noinhaRun;
					seguir = sign(obj_player.x - x);
					image_xscale = seguir;
					velh = seguir*4;
					
					//Verifica o quão perto está do player para realizar o ataque
					if (distance_to_object(obj_player) < 6){
						estado = stateNoinha.atacando
					}
					
				}else{
					sprite_index = spr_noinhaIdle;
				}
			}else{
				estado = stateNoinha.parado;
				sprite_index = spr_noinhaIdle;
			}
		
		break;
	case stateNoinha.parado:
	
			// verifica quanto tempo o npc esta parado
			timerParado += 1 / 64;
			// passou 1 segundo que o npc está parado
			if(timerParado > random_range(3, 18) ){
					estado = stateNoinha.peranbulando;
					timerParado = 0;
			}else{
				sprite_index = spr_noinhaIdle;	
			}
		
		break;
		
	case stateNoinha.peranbulando:
	
		// verifica se o player esta perto, se sim ele muda o estado para seguindo
		if (distance_to_object(obj_player) < distance && distance_to_object(obj_player) > 5 && pode_seguir && pode_mover)
		{
			estado = stateNoinha.seguindo;	
		}else{
			
			if(var_lado == 1){
				x_scale = 1;
				chao_pre = 40;
				x += 4;
				
				parede_previsao = place_meeting(x+10, y - 1, obj_chao);
			}
			if(var_lado == -1){
				x_scale = -1;
				chao_pre = -40;
				x -= 4;
				
				parede_previsao = place_meeting(x-10, y - 1, obj_chao);
			}
			
			temp_perambulando = temp_perambulando + 1 / 60;
			
			if( temp_perambulando > random_range(3, 18) )
			{
				temp_perambulando = 0;
				estado = stateNoinha.parado;
				exit;
			}
			
			sprite_index = spr_noinhaRun;
			image_xscale = x_scale;
			chao_previsao2 = place_meeting(x+chao_pre, y + 1, obj_chao);
			
			if(!chao_previsao2 || parede_previsao ){
				var_lado = var_lado * -1;
			}
			
		}
		break;
		
		case stateNoinha.atacando:
		
			sprite_index = spr_noinhaAttack;
			
			if(image_index >= 2 && image_index <= 3)
			{
				
				if( bater ){
					with(instance_create_layer( x, y, "cursor", hit_box_noia))
					{
						image_xscale = other.image_xscale;
					
						with(instance_place( x, y, obj_player ))
						{
							audio_play_sound(snd_facada_hit, 10, false);
							scr_hit_player(x, y);
							global.hp -= 10;
						}
					}
					bater = false;
					timer_hit = 0;
				}else{
					timer_hit += 1;
					
					if(timer_hit > 5){
						bater = true;
					}
				}
			}
			/// muda direceção do atk caso o player sai da frente do inimigo
			if( obj_player.x > x )
			{
				image_xscale = 1;
			}
			else
			{
				image_xscale = -1;
			}
			
			//Verifica o quão perto está do player para realizar o ataque
			if (distance_to_object(obj_player) < 6){
				estado = stateNoinha.atacando
			}else{
				if( pode_seguir )
				{
					estado = stateNoinha.seguindo;
				}else
				{
					estado = stateNoinha.peranbulando;	
				}
			}
		
		break;
}

//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}