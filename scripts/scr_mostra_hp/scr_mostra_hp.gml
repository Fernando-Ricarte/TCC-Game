
/// recebe os parametros
var nome_inimigo = argument0;
var enemyhp_other = argument1;

/// desenha o inimigo
draw_self();

/// define as variaveis de criação da barra de vida do inimigo
var cordenada_x_esq = x + 40;
var cordenada_y_top = y - 60;
var cordenada_x_direta = x - 40;
var cordenada_y_bottom = y - 56;

draw_set_color(c_maroon);
/// desenha o nome do inimigo

draw_set_font(font_inimigo_name);
draw_text(x - 47, y - 90, nome_inimigo);
/// desenha o health bar
draw_set_font(font_normal);

draw_set_color(c_white);

draw_healthbar(cordenada_x_esq, cordenada_y_top,cordenada_x_direta , cordenada_y_bottom, enemyhp_other, c_silver, c_red, c_lime, 0, true, true)