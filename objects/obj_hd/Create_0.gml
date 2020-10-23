enemyhp = 85;
hit_play = true;
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
timerParado = 0;
// ------------------- variaveis de controle --------//
var_lado = 1;
chao = false;
andar_mais = true;

// ------------- STATE MACHINE ----------------------//

enum stateHd
{
	parado,
	seguindo,
	peranbulando,
	atacando
}

estado = stateHd.peranbulando;

//  ---------- temmporizador pulo --------- //

temp = 0;