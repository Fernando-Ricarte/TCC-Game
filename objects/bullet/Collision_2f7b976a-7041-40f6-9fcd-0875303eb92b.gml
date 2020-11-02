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
	if( place_meeting(x, y + 1, obj_chao) )
	{	
		velv += irandom_range( -4, -7 );
	}
}

scr_hit_part_create(x, y);