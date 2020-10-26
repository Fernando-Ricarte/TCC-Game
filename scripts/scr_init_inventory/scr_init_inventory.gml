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
	rail_gun,
	gun_fire,
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
 spr_bullet,
 spr_arm,
 som_tiro,
 total
 }

enum item_type
 {
 none,
 weapon,
 food,
 diversos,
 lancavel,
 fire_gun
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
scr_add_weapon(item.none, "", "", 0, "spr_none");
scr_add_weapon_lancavel(item.shuriken, "Estrela ninja", "", 10, "spr_shuriken_item", "spr_shuriken", "spr_shuriken_arm", "shuriken_shoot");
src_add_weapon_fire(item.rail_gun , "Arma de Raio", "", 20, "spr_railgun_slot", "spr_bullet_railgun", "spr_railgun", "laser1");
src_add_weapon_fire(item.gun_fire, "Arma de Fogo", "", 40, "spr_gun_fire_slot", "spr_bullet_gun_fire", "spr_gun_fire", "laser2");


/// tenta restaurar os itens?
script_execute(scr_restaura_itens);

// adicionando item ao player
//scr_gain_item(item.toddy, 5);
//scr_gain_item(item.bolinho, 5);
//scr_gain_item(item.shuriken , 10);
//scr_gain_item(item.rail_gun , 50);
//scr_gain_item(item.gun_fire , 30);