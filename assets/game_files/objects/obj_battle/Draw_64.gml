if not global.pause and not player_won
	event_inherited();


if hp_enemy == 0 or hp_player == 0 {
	action = false;
	hp_enemy = hp_total;
	hp_player = hp_total;
	damage_enemy = 0;
}

if not action {
	read_file = false;
	cc_que = 0;
	cc_opt = 0;
	page = 0;
	assessment = [];
	if instance_exists(obj_tb_aariona) and player_won
		instance_destroy(obj_tb_aariona);
	hp_enemy = hp_total;
	hp_player = hp_total;
	damage_enemy = 0;
	exit;
}

if not read_file 
	event_user(3); //event_user(0);

if array_contains(texturegroup_get_sprites("texture_enemy"),enemy_spr) {
	event_user(1);
}
else if enemy_spr == spr_wall_ingame {	
	event_user(2);
}
