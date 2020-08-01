/// @description Setup item variables

//Item ids
enum item
 {
	none,
	apple,
	sword,
	health_potion,
	staff,
	cajado_verde,
	cajado_azul,
	cajado_amarelo,
	cajado_floresta,
	toddy,
	total
	}

enum item_stat
 {
 name,
 description,
 type,
 damage,
 health_gain,
 sprite,
 total
 }

enum item_type
 {
 none,
 weapon,
 food
 }

global.inventory = ds_grid_create(10, 2);

ds_grid_clear(global.inventory, 0);
//Create a ds grid item.total wide, and item_stat.total tall
global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0
global.mouse_slot = ds_grid_create(1, 2);



/// adicionando os itens no banco de dados do jogo

scr_add_food(item.apple, "Apple", "Pretty basic. In every RPG.",  10, "spr_shuriken");

scr_add_food(item.health_potion, "Health Potion", "It's red. Like normal.", 25, "spr_shuriken");

scr_add_weapon(item.cajado_verde, "Cajado Verde", "A magic staff, pulsing with power.", 15, "cajado_verde");

scr_add_weapon(item.cajado_azul, "Cajado Azul", "A magic staff, pulsing with power.", 15, "cajado_azul");

scr_add_weapon(item.cajado_amarelo, "Cajado Amarelo", "A magic staff, pulsing with power.", 15, "cajado_amarelo");

scr_add_weapon(item.cajado_floresta, "Cajado Floresta", "A magic staff, pulsing with power.", 15, "cajado_floresta");

scr_add_weapon(item.sword, "espada comum", "A magic staff, pulsing with power.", 5, "spr_espada_comum");

scr_add_food(item.toddy, "Toddynho kkkk", "toddy", 10, "spr_toddynho");

scr_add_weapon(item.none, "", "", 0, "spr_none");

scr_gain_item(item.cajado_amarelo, 1);
scr_gain_item(item.cajado_azul, 1);

scr_gain_item(item.toddy, 1);