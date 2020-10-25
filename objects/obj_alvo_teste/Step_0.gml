/// @description Insert description here
// You can write your code in this editor
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

chao_previsao2 = place_meeting(x+chao_pre, y + 1, obj_chao);
			
if(!chao_previsao2 || parede_previsao )
{
	var_lado = var_lado * -1;
}