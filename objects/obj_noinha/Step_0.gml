/// @description Insert description here
// You can write your code in this editor

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

// limitando as velocidades
velv = clamp(velv, -max_velv, max_velv);


if(velv == 0 && velh == 0)
{
	estado = state.parado;
}

//State Machine
switch(estado)
{
	case state.parado:
	
	// gravidade
	if(!chao)
	{
		velv += grav;
	}
}
