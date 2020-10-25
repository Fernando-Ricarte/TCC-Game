   // You can write your code in this editor
   
switch(fase){

	case 1:{
		if(global.Fase_Destravada == 1) {
			room_goto( fase_teste_windows );
		} 
		else show_message("Está fase ainda não está disponivel");
		break;
	}

	case 2:{
		if(global.Fase_Destravada == 1) {
			room_goto(Fase02);
		} 
		else show_message("Está fase ainda não está disponivel");
		break;
	}

	case 3:{
		if(global.Fase_Destravada == 1) {
			room_goto(Fase03);
		} 
		else show_message("Está fase ainda não está disponivel");
		break; 
	}
	case 4:{
		if(global.Fase_Destravada == 1) {
			room_goto(FaseDefinitiva02)
		} 
		else show_message("Está fase ainda não está disponivel");
		break; 
	}

}
