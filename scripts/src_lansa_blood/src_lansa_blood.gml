script_execute(add_parts);

var px = argument0;
var py = argument1;

part_emitter_region(part_system, part_emitter, px-32, px+32, py-32, py+32,
    ps_shape_diamond, ps_distr_invgaussian);

part_emitter_burst(part_system, part_emitter, part_type, 25);