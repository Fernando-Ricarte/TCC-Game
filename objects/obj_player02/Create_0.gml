#region CONFIGURAÇES PRINCIPAIS
spd = 5; // variavel de velocidade
hspd = 0; // variavel de velocidade horizontal
vspd = 0; // variavel de velocidade vertical
grv = 0.4; // variavel de gravidade

global.bullets = 5; // quantidade de balas

global.life = 4; // vida do player

state = PlayerState.FREE;

enum PlayerState
{
  FREE
}
#endregion