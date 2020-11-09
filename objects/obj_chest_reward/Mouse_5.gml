/// @description Abrir o baú
 
if ( player_closer )
{
	/// chamaria o criador de objs, somente se for a primeira vez
	if ( !has_open )
	{
		script_execute( scr_dropp_itens, x, y, 2);
	}
	
	has_open = true;
} 