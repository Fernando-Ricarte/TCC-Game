// Codigo desenvolvido por Miguel LUkas
if (vspeed == 0)
{
	if dir_c >= 2
	{
		var bobbing = 15;
		
		if (dir_z == 0)
		{
			if (z >= -bobbing) z--;
			else dir_z = 1;
			
		} else if (dir_z == 1) {
			
			if (z <= bobbing) z++;
			else dir_z = 0;
		}
		dir_c = 0; 
		
	} else dir_c++;
	
}