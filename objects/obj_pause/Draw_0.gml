 /// @description Insert description here
// You can write your code in this editor
if(pause){
	draw_set_color(c_black); 
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_halign(fa_center);
	draw_set_font(fnt_UI);
	draw_set_color(c_white);
	//necessario ajustar a camera para acompanhar o personagem
   draw_text(view_xview[view_current] + view_wview[view_current] / 2, view_yview[view_current] + view_hview[view_current] / 2, "PAUSADO");
	draw_set_color(c_black);
}      