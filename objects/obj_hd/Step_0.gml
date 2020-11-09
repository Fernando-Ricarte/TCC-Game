 
/// codigo generico que faz o movimento e todas as outras fisicas genéricas
/// inclui a state machine, e fisica de movimentos
script_execute(src_inimigo_steep, spr_hdIdle, spr_hdRun, spr_hdAttack, 15);


//morte 
if(enemyhp <= 0){
	instance_destroy();
	audio_play_sound(snd_tek_die ,0,false);
}