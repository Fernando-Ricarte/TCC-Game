 /// @description Insert description here
// You can write your code in this editor
var tamanho_camera_largura = display_get_gui_width();
var metade_camera = (tamanho_camera_largura / 2) + 220;	
var tamanho_altura = display_get_gui_height();
var metade = tamanho_altura / 2;

if(pause)
{
	draw_set_color(c_white);
	//necessario ajustar a camera para acompanhar o personagem
	draw_text(metade_camera, metade, "PAUSADO");
}