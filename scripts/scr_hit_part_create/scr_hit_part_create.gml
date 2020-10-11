
//@param x position
//@param y position

var xx = argument0;
var yy = argument1;

repeat(10)
{
	instance_create_layer( xx, yy, "inventory", obj_hit);	
}