/// @description Insert description here
// You can write your code in this editor

var sprite = argument0;

part_system=part_system_create();

part_emitter=part_emitter_create(part_system);

part_type=part_type_create();
part_type_sprite(part_type, spr_blood, false, false, false);
part_type_alpha3(part_type, 0, 1, 0);
part_type_color3(part_type, c_red, c_maroon, c_red);

part_type_life(part_type, 20, 60);
part_type_scale(part_type, 1, 1);
part_type_gravity(part_type, 0.10, -70);


//// poeira
part_system_poeira = part_system_create();
part_emitter_poeira = part_emitter_create(part_system_poeira);
part_type_poeira = part_type_create();
part_type_sprite(part_type_poeira, sprite, false, false, false);
part_type_alpha3(part_type_poeira, 0, 1, 0);
part_type_color3(part_type_poeira, c_gray, c_silver, c_white);

part_type_life(part_type_poeira, 20, 40);
part_type_scale(part_type_poeira, 0.8, 0.5);

part_type_gravity(part_type_poeira, 0.15, irandom_range( 35, 90 ) );


//// health
part_system_health = part_system_create();
part_emitter_health = part_emitter_create(part_system_health);
part_type_health = part_type_create();
part_type_sprite(part_type_health, sprite, true, false, true);
part_type_alpha3(part_type_health, 0, 1, 0);
part_type_color3(part_type_health, c_green, c_white, c_silver);

part_type_life(part_type_health, 10, 20);
part_type_scale(part_type_health, 1, 1);
part_type_gravity(part_type_health, 0.3, 80);