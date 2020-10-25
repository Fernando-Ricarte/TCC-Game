     /// @description Variaveis da camera


cam = view_camera[0];
follow = obj_player;

if( global.shindeiru )
{
	follow = obj_death_camera;
}

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xto = xstart;
yto = ystart;
