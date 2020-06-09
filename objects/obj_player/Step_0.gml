// chacando se o personagem esta no chao
chao = place_meeting(x, y + 1, obj_chao);


// limite do pulo
if (chao)
{
	timer_pulo = limite_pulo;	
}
else
{
	if (timer_pulo > 0) timer_pulo--;	
}


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check(vk_space);

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


if(!jump && !right && !left && velv == 0 && velh == 0)
{
	estado = state.parado;
}


/// STATE MACHINE ///

switch(estado)
{
	case state.parado:
	
	// gravidade
	if(!chao)
	{
		velv += grav;
	}
	
	// saindo do estado
	if(left || right || jump)
	{
		estado = state.movendo;
	}
	
		break;
	case state.movendo:
	
	
	// aplicando a movimentação?
	 velh = lerp(velh, avanco_h, acel);
	
	// gravidade
	if(!chao)
	{
		velv += grav;
	}
	
	// pulando
	if (jump && (chao || timer_pulo)) {
		velv += -max_velv;
	}
	
	
		break;
	case state.dash:
	
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

if(estado == state.movendo){
	
	if(temp > 0){
		pulando = false;
	}
	else if (temp == 0)
	{
		pulando = false;
		sprite_index = spr_running;
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
		estado = state.parado;	
	}
}

if(estado == state.parado){
	sprite_index = spr_placeholder;
	
	if(temp > 0){
		pulando = true;
	}
	else if (temp == 0)
	{
		pulando = false;
	}
	
	if(left)
	{
		image_xscale = -1;
	}
	if(right)
	{
		image_xscale = 1;
	}
}


if(pulando)
{
	sprite_index = spr_jump;	
}




//if(keyboard_check(ord("D"))){
//	x+=spd;
//	image_xscale = 1;
	
//	//só solta animação de correndo se não estiver pulando
//	if(!pulando){
//		sprite_index = spr_running;
//	}
//}
	 


////movimentação pra esquerda
//if(keyboard_check(ord("A"))){
//	x-=spd;
//	image_xscale = -1;
	
//	//só solta animação de correndo se não estiver pulando
//	if(!pulando){
//		sprite_index = spr_running;
//	}
//}
	
//if(pulando){
//	sprite_index = spr_jump;
//}

////comando do pulo
//if(keyboard_check(vk_space)){
//	if(!place_free(x,y+1)){
//		pulo = true;
//		pulando = true;
//	}

//}

////pulo
//if(pulo){
//	if(jumpFrame < jumpheight){
		
//		if(place_free(x,y-spdjump)){
//			jumpFrame += spdjump;
//			y-=spdjump;
//		}else{
//			pulo  = false;
//			jumpFrame = 0;
//		}
//	}else{
//		pulo  = false;
//		jumpFrame = 0;
//	}
//}


////gravidade
//if (pulo == false){
//	if(place_free(x,y+fallspd)){
//		y+=fallspd;
//		fallspd+=gravid;
//	}else{
//	fallspd = 2;
//	pulando = false;
//	while(place_free(x,y+1)){
//		y++;
//	}
//	}
//}

//morte
if(global.hp <= 0){
 show_message("Você morreu!");
 room_restart();

}