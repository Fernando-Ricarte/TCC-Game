// You can write your code in this editor
//scr_salva_itens(); 

switch(fase){

	case 1:{
		if(global.Fase_Destravada == 1) {
			room_goto(tutorial1);
			audio_stop_all();
		} 
		break;
	}

	case 2:{
		if(global.Fase_Destravada == 1) {
			room_goto(Fase02);
			audio_stop_all();
		} 
		break;
	}

	case 3:{
		if(global.Fase_Destravada == 1) {
			room_goto(FaseDefinitiva02);
			audio_stop_all();
		} 
		break; 
	}
	case 4:{
		if(global.Fase_Destravada == 1) {
			room_goto(Fase03)
			audio_stop_all();
		}  
		break; 
	}

}
