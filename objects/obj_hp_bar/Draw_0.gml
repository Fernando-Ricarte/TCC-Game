   /// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_back_health_bar, 0, x, y);
draw_sprite_stretched(spr_health, 0, x+13, y, global.hp, 20);
draw_self();