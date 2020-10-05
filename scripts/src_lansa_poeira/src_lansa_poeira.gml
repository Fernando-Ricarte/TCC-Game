script_execute(add_parts);

var px = argument0;
var py = argument1;

part_emitter_region(part_system_poeira, part_emitter_poeira, px-52, px+52, py+25, py+45,
    ps_shape_diamond, ps_distr_invgaussian);

part_emitter_burst(part_system_poeira, part_emitter_poeira, part_type_poeira, irandom_range( 3, 10 ));