/// @description Insert description here
// You can write your code in this editor

with( other ){

	if ( self.x > other.x )
	{
		ultimo_hit_lado = 1;	
	}
	else
	{
		ultimo_hit_lado = -1;	
	}
}

with( other )
{
	velv += irandom_range( -4, -7 );	
}

scr_hit_part_create(x, y);