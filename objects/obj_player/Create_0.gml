 /// @description Insert description here
// You can write your code in this editor
//spd = 3;
global.hp = 100;

//spdjump = 8;
//gravid = 0.4;
//fallspd = 2;

//pulo = false;
pulando = false;

//jumpheight = 128;
//jumpFrame = 0;

// -------------- iniciando vars do curso -------//
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;

// ---------------------- velocidades ----------------//
velv = 0;
velh = 0;

// ------------------ limites das velocidades ----------//

max_velv = 6;
max_velh = 6;

// ------------------- variaveis de controle --------//

chao = false;


// ------------- STATE MACHINE ----------------------//

enum state
{
	parado,
	movendo,
	dash
}

estado = state.parado;

//  ---------- temmporizador pulo --------- //

temp = 0;

//fall = false;


// ---------- limite para o pulo -------//
limite_pulo = 8;
timer_pulo = limite_pulo;