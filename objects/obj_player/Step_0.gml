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

if(	pulando_antes && chao )
{
	script_execute(src_lansa_poeira, x, y);
}


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check(vk_space);

// checando se o personagem esta colado na parede
//parede_d = place_meeting(x+1, y, obj_chao);
//parede_e = place_meeting(x-1, y, obj_chao);


///========================================================================================
var idd_escolhido = global.item_escolhido_slot[# 0, 0];
var var_slot = global.item_escolhido_slot[# 0, 1];

var quant = global.inventory[# var_slot, 1];

var item_stat = global.item_index[# idd_escolhido, item_stat.type];

if(item_stat == item_type.lancavel || item_stat == item_type.fire_gun)
{
	tem_lancavel = true;
}else{
	tem_lancavel = false;
}
//==========================================================================================


// tira o bug de animação quando aperta os dois botões ao msm tempo
if(right && left)
{
	right = false;
	left = false;
}

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
		pulando = true;
	}
	else
	{
		pulando = false;
		if(tem_lancavel){sprite_index = spr_running_no;}else{sprite_index = spr_running;}
		
	}
	
	//if(left)
	//{
	//	//image_xscale = -3;
	//}
	//if(right)
	//{
	//	//image_xscale = 3;
	//}
	
	if(right && left)
	{
		estado = state.parado;	
	}
}

if(estado == state.parado){
	
	if(temp > 0){
		pulando = true;
	}else
	{
		pulando = false;
		if(tem_lancavel){sprite_index = spr_idle_no;}else{sprite_index = spr_idle;}
	}
	
	if(left)
	{
		//image_xscale = -1;
	}
	if(right)
	{
		//image_xscale = 1;
	}
}

// lança a animação de pulo se esta no ar por meno de 0.4 segundos senão ele
// poem a sprite de fall
if(pulando){
	
	if(chao_antes && !chao)
	{
		if(tem_lancavel){sprite_index = spr_fall2_no;}else{sprite_index = spr_fall2;}
	}
	else if(temp > 0.55)
	{
		if(tem_lancavel){sprite_index = spr_fall2_no;}else{sprite_index = spr_fall2;}
	}else{
		if(tem_lancavel){sprite_index = spr_jump_no;}else{sprite_index = spr_jump;}
	}
}


// verifica se o player esta no chão e se apertou a barra de espaço
if(chao && jump){
	
	// cria o array contendo os audios de grito
	var gritos = [];
	gritos[0] = pulo_1;
	gritos[1] = pulo_2;
	
	//if(!audio_is_playing(grito_a_fazer)){
	//	audio_play_sound(grito_a_fazer, 0, false);
	//}
	
	var toca = true;
	
	// percorre o array
	for(i = 0; i < array_length_1d(gritos); i++)
	{
		var gritoatual = gritos[i];
		
		// verifica se esta sendo tocado algum audio de pulo
		if(audio_is_playing(gritoatual))
		{
			// se sim, então não pode gritar denovo
			toca = false;
		}
	}
	
	// se não tiver nenhum audio de grito sendo tocado ele entra no if
	if(toca)
	{	
		// gera um grito aleatorio
		pos_grito = irandom_range(0, 1);
		grito_a_fazer = gritos[pos_grito];
		audio_play_sound(grito_a_fazer, 0, false);
	}
}

if(mouse_x > x){
	image_xscale = 2;
}else{
	image_xscale = -2;
}

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// audio do pisado no chão

if ( chao )
{
	if( right || left )
	{
		if( !audio_is_playing( walking_1 ) )
		{
			if( contador_timer_passos > 0.14 )
			{
				contador_timer_passos = 0;
				// se sim, então não pode gritar denovo
				audio_play_sound(walking_1, 0, false);
			}
			else
			{
				contador_timer_passos = contador_timer_passos + 1 / 60;
			}
		}
	}
}

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//morte
if(global.hp <= 0){
 show_message("Você morreu!!!");   
 room_restart();   
}