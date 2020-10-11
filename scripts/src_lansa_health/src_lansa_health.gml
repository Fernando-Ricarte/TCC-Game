add_parts( spr_health_part );

part_emitter_region(part_system_health, part_emitter_health, obj_player.x - 52, obj_player.x + 52, obj_player.y - 52, obj_player.y + 52,
    ps_shape_diamond, ps_distr_invgaussian);

part_emitter_burst(part_system_health, part_emitter_health, part_type_health, 25);