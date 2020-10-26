/// percorre o array com os itens e restaura com o gain
for (var i = array_height_2d(global.invent) - 1; i > -1; i--;)
{
   id_obj = global.invent[i, 0];
   obj_quant = global.invent[i, 1];
   
   scr_gain_item(id_obj, obj_quant);
}