/// @description Insert description here
// You can write your code in this editor

part_system=part_system_create();

part_emitter=part_emitter_create(part_system);

part_type=part_type_create();
part_type_sprite(part_type, spr_blood, false, false, false);
part_type_alpha3(part_type, 0, 1, 0);
part_type_color3(part_type, c_red, c_maroon, c_red);

part_type_life(part_type, 20, 60);
part_type_scale(part_type, 1, 1);
part_type_gravity(part_type, 0.10, -70);