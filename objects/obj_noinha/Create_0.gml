global.hp = 100;

// -------------- iniciando vars do curso -------//
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;
distance = 300;
seguir = 0;
// ---------------------- velocidades ----------------//
velv = 0;
velh = 0;

// ------------------ limites das velocidades ----------//

max_velv = 6;
max_velh = 6;

// ------------------- variaveis de controle --------//

chao = false;


// ------------- STATE MACHINE ----------------------//

enum stateNoinha
{
	parado,
	movendo,
	dash
}

estado = stateNoinha.parado;

//  ---------- temmporizador pulo --------- //

temp = 0;