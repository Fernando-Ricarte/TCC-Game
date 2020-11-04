
creation_x = argument0;
creation_y = argument1;
nivel_percent = argument2;

multiplicador = nivel_percent * 2;

obj_dropaveis = [ "obj_toddy", "obj_bolinho", "obj_notebook", "obj_shuriken", "obj_other_gun", "obj_bazuca_OP" ];

for ( var v = 0; v <= multiplicador; v++ )
{
	len_array = array_length_1d(obj_dropaveis);
	len_array = len_array - 1;
	
	pos_obj = round( irandom_range(0, len_array ) );
	obj_atual = obj_dropaveis[pos_obj];
	obj_crea = asset_get_index(obj_atual);
	
	instance_create_layer( creation_x + irandom_range( -15, 15 ), creation_y, "player", obj_crea );
}