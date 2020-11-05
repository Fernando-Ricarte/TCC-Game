// cutscene
if(y != 590) //se o y do boss estiver menos que 300 a velocidade vertial continua
{
	vspeed = 2;
	
} else { 
	vspeed = 0;
	state = BOSS_STATE.BOBBING;
}

