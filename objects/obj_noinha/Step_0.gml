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

if(chao)
{
	acel = acel_chao;
}else
{
	acel = acel_ar;
}

// limitando as velocidades
velv = clamp(velv, -max_velv, max_velv);


if(!right && !left && velv == 0 && velh == 0)
{
	estado = stateNoinha.parado;
}


/// STATE MACHINE ///

switch(estado)
{
	case stateNoinha.parado:
	
	// gravidade
	if(!chao)
	{
		velv += grav;
	}
	
	// saindo do estado
	if(left || right)
	{
		estado = stateNoinha.movendo;
	}
	
		break;
	case stateNoinha.movendo:
	
	
	// aplicando a movimentação?
	 velh = lerp(velh, avanco_h, acel);
	
	// gravidade
	if(!chao)
	{
		velv += grav;
	}
	
	
		break;
	case stateNoinha.dash:
	
		break;
}

// verfifcando quanto tempo esta no ar -----//

if(!chao)
{
	temp += 1 / 64;
}else{
	temp = 0;
}


// --------- animações -------------------//

if(estado == stateNoinha.movendo){
	
	if(temp == 0)
	{
		pulando = false;
		sprite_index = spr_noinhaRun;
	}
	
	if(left)
	{
		image_xscale = -3;
	}
	if(right)
	{
		image_xscale = 3;
	}
	
	if(right && left)
	{
		estado = stateNoinha.parado;	
	}
}

if(estado == stateNoinha.parado){
	sprite_index = spr_noinhaIdle;
	
	
	if(left)
	{
		image_xscale = -1;
	}
	if(right)
	{
		image_xscale = 1;
	}
}


if distance_to_object(obj_player) < distance
{
sprite_index = spr_noinhaRun;
seguir = sign(obj_player.x - x);
image_xscale = seguir;
velh = seguir*4;

}


