  // You can write your code in this editor
   
switch(fase){

case 1:{
	if(global.Fase_Destravada == 1) {
		room_goto(Fase01);
	} else show_message("Está fase ainda não está disponivel");
	break;
}

case 2:{
	if(global.Fase_Destravada == 1) {
		room_goto(Fase02)
	} else show_message("Está fase ainda não está disponivel");
	break;
}

case 3:{
	if(global.Fase_Destravada == 3) {
		show_message("Fase 3")
	} else show_message("Está fase ainda não está disponivel");
	break; 
}
case 4:{
	if(global.Fase_Destravada == 4) {
		show_message("Fase 4")
	} else show_message("Está fase ainda não está disponivel");
	break; 
}
case 5:{
	if(global.Fase_Destravada == 5) {
		show_message("Fase 5")
	} else show_message("Está fase ainda não está disponivel");
	break; 
}

}
