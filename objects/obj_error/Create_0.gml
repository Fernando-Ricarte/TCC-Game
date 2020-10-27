enemyhp = 100;
hit_play = true;
// -------------- iniciando vars do curso -------//
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;
distance = 150;
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
parede_previsao = false;
// ------------- STATE MACHINE ----------------------//

estado = stateInimigoWalker.peranbulando;

//  ---------- temmporizador pulo --------- //

temp = 0;
temp_perambulando = 0;

hit = 0;
bater = true;
timer_hit = 6;

show_damage = false;
last_damage = 0;

ultimo_hit_lado = 1;