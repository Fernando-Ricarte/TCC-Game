/// @description Insert description here
// You can write your code in this editor

// verifica se alguem clicou com o botão esquerdo do mouse
click = mouse_check_button_pressed(mb_left);


//if(click)
//{
//	instance_destroy(obj_efect_mao);
//	for (var i = 1; i < irandom_range(3, 9); i++) {
//		xx = irandom_range(-10, 15);
//		yy = irandom_range(-10,15);
//		instance_create_layer(mouse_x+xx, mouse_y-yy, "player", obj_efect_mao);
//	}
//}


// se sim, a var clikou recebe true;
if(click)
{
	clickou = true;
}

// se clikou for true, ele incrementa o tempo da animação
if(clickou)
{
	tempo_click += 1/64;	
}

// limita o tempo para 10 milisegundos e passa clikou para false
if(tempo_click > 0.15)
{
	tempo_click = 0;
	clickou = false;
}

// se clickou for true lança a braba e muda o sprite para click
if(clickou)
{
	sprite_index = spr_click;
	//script_execute(src_lansa_blood);
	
}else
// senão deixa o mouse com o sprite spr_mao padrao
{
	sprite_index = spr_mao;
}