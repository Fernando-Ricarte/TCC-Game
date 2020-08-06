// cutscene

if y != 500 //se o y do boss estiver menos que 300 a velocidade vertial continua
{
	vspeed = 3;
	
} else { // se não a velocidade vertical recebe 0 
	vspeed = 0 ;
}

if  y == 500 // quando a cutscene acabar ou seja o y = 500 trocara para o estado bobbing
{
	state = BOSS_STATE.BOBBING;
}