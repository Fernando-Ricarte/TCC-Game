/// @description Insert description here
// You can write your code in this editor
draw_self();
if (ativo){
	alpha -= .005;
	altura += .5;
	draw_text_color(xx,yy - altura, texto, c_green, c_green, c_green, c_green, alpha);
	
}