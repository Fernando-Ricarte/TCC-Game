/// @description Insert description here
// You can write your code in this editor

if( global.shindeiru )
{
	var x1 = camera_get_view_x( view_camera[0] );
	var w = camera_get_view_width( view_camera[0] );
	var x2 = x1 + w;
	var meio = x2 / 2;
	
	var y1 = camera_get_view_y( view_camera[0] );
	var h = camera_get_view_height( view_camera[0] );
	var y2 = y1 + h;
	var meio_h = y2  / 2;
	
	var qtd = h * .15;
	
	valor = lerp(valor, 1, .03);
	
	draw_set_color( c_black );
	
	// escurecendo a tela
	draw_set_alpha( valor );
	draw_rectangle(x1, y1, x2, y2, false);
	
	// desenhando o retangulo de cima
	draw_rectangle( x1, y1, x2, y1 + qtd * valor, false );
	
	
	// desenhando o retangulo de cima
	draw_rectangle( x1, y2, x2, y2 - qtd * valor, false );
	
	draw_set_alpha(1);
	draw_set_color(-1);
}else
{
	valor = 0;	
}