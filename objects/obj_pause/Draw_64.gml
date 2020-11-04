 /// @description Insert description here
// You can write your code in this editor
var tamanho_camera_largura = display_get_gui_width();
var metade_camera = (tamanho_camera_largura / 2) + 150;	
var tamanho_altura = display_get_gui_height();
var metade = tamanho_altura / 2;

if(pause)
{		
	// tela escura setting
	draw_set_color( c_black );
	// escurecendo a tela
	draw_set_alpha( 0.5 );
	draw_rectangle(0, 0, room_width , room_height, false);
	
	draw_set_color(c_white);
	//necessario ajustar a camera para acompanhar o personagem
	
	draw_set_font(font_pause);
	draw_text(metade_camera, metade, "PAUSADO");
	draw_set_font(font_normal);
}