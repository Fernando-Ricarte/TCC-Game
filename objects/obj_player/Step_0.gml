   /// @description Insert description here
// You can write your code in this editor
//movimentação pra direita
if(keyboard_check(ord("D"))){
	sprite_index = spr_running;
	x+=spd;
	image_xscale = 1;
}
	 


//movimentação pra esquerda
if(keyboard_check(ord("A"))){
	sprite_index = spr_running;
	x-=spd;
	image_xscale = -1;
}
	


//comando do pulo
if(keyboard_check(vk_space)){
	sprite_index = spr_jump;
	if(!place_free(x,y+1)){
		pulo = true;
	}

}

//pulo
if(pulo){
	if(jumpFrame < jumpheight){
		
		if(place_free(x,y-spdjump)){
			jumpFrame += spdjump;
			y-=spdjump;
		}else{
			pulo  = false;
			jumpFrame = 0;
		}
	}else{
		pulo  = false;
		jumpFrame = 0;
	}
}


//gravidade
if (pulo == false){
	if(place_free(x,y+fallspd)){
		y+=fallspd;
		fallspd+=gravid;
	}else{
	fallspd = 2;  
	while(place_free(x,y+1)){
		y++;
	}
	}
}
