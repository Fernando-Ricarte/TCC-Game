/// @description Setup item variables

//Item ids
enum item
 {
	none,
	apple,
	sword,
	toddy,
	bolinho,
	notebook,
	shuriken,
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
 food,
 diversos,
 lancavel
 }

global.inventory = ds_grid_create(10, 2);

ds_grid_clear(global.inventory, 0);
//Create a ds grid item.total wide, and item_stat.total tall
global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0

global.mouse_slot = ds_grid_create(1, 2);

global.item_escolhido_slot = ds_grid_create(1, 2);

/// adicionando os itens no banco de dados do jogo
scr_add_food(item.toddy, "Toddynho", "Achocolatado da ETEC, o melhor", 10, "spr_toddynho");
scr_add_food(item.bolinho, "Bolinho da ETEC", "Muito gostoso! se não estiver mofado, é claro...", 15, "spr_bolinho");
scr_add_weapon(item.sword , "Espada Comum", "Uma espada capaz de infligir danos a inimigos", 10, "spr_espada_comum");
adiciona_diversos(item.notebook, "Note Gamer 12GB", "Capaz de rodar qualquer programa, menos Android Studio é claro...", "spr_notebook");
scr_add_weapon(item.none, "", "", 0, "spr_none");
scr_add_weapon(item.shuriken, "Estrela ninja", "Dattebayo viado", 10, "spr_shuriken_item");


// adicionando item ao player
scr_gain_item(item.toddy, 1);
scr_gain_item(item.notebook, 1);
scr_gain_item(item.sword, 1);
scr_gain_item(item.bolinho, 1);
scr_gain_item(item.shuriken , 5);