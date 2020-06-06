 /// @description Insert description here
// You can write your code in this editor
var hp = global.hp;
var xx = 20;
var yy = 20;
var ww = xx + ((hp/100) * 150);
var ww2 = xx + 150;
var hh = yy + 15;

    
draw_set_color(c_red);
draw_rectangle(xx,yy,ww2,hh,0);


draw_set_color(c_lime);
draw_rectangle(xx,yy,ww,hh,0);

draw_set_color(c_black);
draw_rectangle(xx,yy,ww,hh,1);


draw_set_font(fnt_UI);
draw_text(68,14,string(hp) + "/100");
