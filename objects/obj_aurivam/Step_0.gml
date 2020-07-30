   /// @description Insert description here
// You can write your code in this editor
if(place_free(x,y+4)){
	y+=4;
}

if(dir == 1){
	if(place_free(x+4,y) && !place_meeting(x+48,y,obj_invisible_wall_enemy)){
		x+=2;
	}else{
		dir = -1;
		image_xscale = -1;  
	}
}

if(dir == -1){
	if(place_free(x-4,y) && !place_meeting(x-48,y,obj_invisible_wall_enemy)){
		x-=2;
	}else{
		dir = 1;
		image_xscale = 1;
	}        
}