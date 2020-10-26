
/// codigo generico que faz o movimento e todas as outras fisicas genéricas
/// inclui a state machine, e fisica de movimentos
script_execute(src_inimigo_steep, spr_errorIdle, spr_errorRun, spr_errorAttack, 10);

//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_solado,0,false);
}