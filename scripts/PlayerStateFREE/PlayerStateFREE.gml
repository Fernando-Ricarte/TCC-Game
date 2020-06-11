script_execute(get_input)

#region MOVIMENTAÇÃO 

// definindo movimentação 
var move = key_rigth - key_left;

hspd = move * spd;

vspd = vspd + grv;

// metodo de trocar o lado do personagem  e retornar na mesma velocidade
if (hspd != 0) image_xscale = sign(hspd); 


// COLISÃO HORIZONTAL
if place_meeting(x+hspd,y,obj_chao)
{
	while (!place_meeting(x+sign(hspd),y,obj_chao))
	{
		x = x + sign(hspd);
	}
  hspd = 0 
}
x = x + hspd;

// COLISÃO VERTICAL
if place_meeting(x,y+vspd,obj_chao)
{
	while (!place_meeting(x,y+sign(vspd),obj_chao))
	{
		y = y + sign(vspd);
	}
	
vspd = 0 
}
y = y + vspd

// JUMP
if place_meeting(x,y+1,obj_chao) and key_jump
{
	vspd -=16 // quanto maior o numero mais alto é p pulo
}

#endregion

#region TIROS

var flipped = direction; // variavel que define a direção do tiro 
var gun_x = (x+4) * (flipped); // tiro sai do personagem 
var _xx = x + lengthdir_x(100,image_angle); // tira vai sair da nossa direção 
var y_offset = lengthdir_y(-20,image_angle);


if key_shoot and global.bullets > 0
{
	with (instance_create_layer(_xx,y+10,"Shoot",obj_shoot))
 {
	// balas
	global.bullets--; // quando atirar ira ser descontada uma bala 
	
	// velocidade  do tiro
	speed = 5; // maior o valor maior a velocidade 
	
	// direção do tiro 
	direction = -80 + 90 * other.image_xscale;
	
	// angulo do tiro 
	image_angle = direction;
	
 } // fechamento do width
 
} // fechamento do if 


#endregion

#region RESTART DO JOGO

if global.life < 1 
{
	game_restart();
}


#endregion

#region TROCA DOS SPRITES NA MOVIMENTAÇÃO

if(!place_meeting(x,y+1,obj_chao)) // se não colidir com o chao o sprite vai ser o de pulo
{
	sprite_index = spr_jump;
	if (sign(hspd) > 0.5) sprite_index = spr_jumpfinal; else sprite_index = spr_jumpfinal; // se ele não estiver caindo vai estar pulando
}

else
{
	if (hspd != 0) //  se  a velocidade horizontal for diferente de 0 o sprite sera correndo
	{
		sprite_index = spr_running;
	}
}

if (hspd = 0) // se a velocidade do player for 0 o sprite vai sera o parado 
{
	if place_meeting(x,y+1,obj_chao)
	{
		sprite_index = spr_idle;
	}
}

if (hspd != 0) // condição usada para não bugar os sprites da troca de pulo
{
	if place_meeting(x,y+1,obj_chao)
	
	{
		sprite_index = spr_jump;
	}
}


#endregion