 
/// codigo generico que faz o movimento e todas as outras fisicas genéricas
/// inclui a state machine, e fisica de movimentos
script_execute(src_inimigo_steep, spr_androidIdle, spr_androidRun, spr_androidAttack, 20);


//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_errors_die,0,false);
}