 /// @description Insert description here
// You can write your code in this editor
if (!pause)
{
	pause = 1;
	instance_deactivate_all(true);
}else
{
	pause = 0;
	instance_activate_all();
	draw_set_alpha(100);
}