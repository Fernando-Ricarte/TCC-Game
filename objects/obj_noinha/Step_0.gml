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


// verifica se o player esta perto, se sim ele muda o estado para seguindo
if (distance_to_object(obj_player) < distance && distance_to_object(obj_player) > 10)
{
	estado = stateNoinha.seguindo;	
}

// --------- animações -------------------//

switch(estado){
	case stateNoinha.seguindo:
			
			pos_x_player = obj_player.x;
			if(pos_x_player > x){
				direcao = 40;
			}else{
				direcao = -40;
			}
			
			chao_previsao = place_meeting(x+direcao, y + 1, obj_chao);
			
			if(chao_previsao){
				sprite_index = spr_noinhaRun;
				seguir = sign(obj_player.x - x);
				image_xscale = seguir;
				velh = seguir*4;
			}else{
				estado = stateNoinha.parado;
				sprite_index = spr_noinhaIdle;
			}
		
		break;
	case stateNoinha.parado:
	
			// verifica quanto tempo o npc esta parado
			timerParado += 1 / 64;
			// passou 1 segundo que o npc está parado
			if(timerParado > 1){
					estado = stateNoinha.peranbulando;
					timerParado = 0;
			}else{
				sprite_index = spr_noinhaIdle;	
			}
		
		break;
		
	case stateNoinha.peranbulando:
	
		// verifica se o player esta perto, se sim ele muda o estado para seguindo
		if (distance_to_object(obj_player) < distance && distance_to_object(obj_player) > 10)
		{
			estado = stateNoinha.seguindo;	
		}else{
			
			
		}
		break;
}


//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}