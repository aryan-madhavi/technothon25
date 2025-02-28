
 
 if global.pause and not global.battle
	exit;

event_inherited();

prompt = "Press 'F2' to fight";

image_index = inside ? 3 : 2;

if action {
	global.current_battler_id = id;	
}

enemy_arr = get_enemy_array();


if enemy == noone and not player_won {
	if array_contains(texturegroup_get_sprites("texture_enemy"),enemy_spr) {
	enemy_path = path_add();
	switch enemy_pos {
		case "top":
			enemy = instance_create_layer(x,y,"Instances",obj_enemy);
			enemy.spr_enemy = enemy_spr;
			path_add_point(enemy_path,x,y,100);
			path_add_point(enemy_path,x+w,y,100);
			enemy.enemy_path = enemy_path;
			break;
		case "bottom":
			enemy = instance_create_layer(x,y+h,"Instances",obj_enemy);
			enemy.spr_enemy = enemy_spr;
			path_add_point(enemy_path,x,y+h,100);
			path_add_point(enemy_path,x+w,y+h,100);
			enemy.enemy_path = enemy_path;
			break;
		case "left":
			enemy = instance_create_layer(x,y,"Instances",obj_enemy);
			enemy.spr_enemy = enemy_spr;
			path_add_point(enemy_path,x,y,100);
			path_add_point(enemy_path,x,y+h,100);
			enemy.enemy_path = enemy_path;
			break;
		case "right":
			enemy = instance_create_layer(x+w,y,"Instances",obj_enemy);
			enemy.spr_enemy = enemy_spr;
			path_add_point(enemy_path,x+w,y,100);
			path_add_point(enemy_path,x+w,y+h,100);
			enemy.enemy_path = enemy_path;
			enemy.image_xscale *= -1;
			break;
	}
	}
	else if enemy_spr == spr_wall_ingame {
		enemy = instance_create_layer(x,y,"Instances",obj_wall_ingame);
		enemy.width = w;
		//enemy.height = 160;
	}
	
	if not array_contains(enemy_arr,file_name) and file_name != "continue.json" {
		player_won = true
	}
	
}

if id == global.current_battler_id {
	global.pause = action;
	global.battle = action;
}


if player_won == true {
	if enemy != noone {
		if array_contains(texturegroup_get_sprites("texture_enemy"),enemy_spr) {
			enemy.defeated = true;
		}
		else if enemy_spr == spr_wall_ingame {
			instance_destroy(enemy);
			instance_destroy();
		}
	}
	image_index = -1;
	action = false;
	if array_contains(enemy_arr,file_name) {
		user_save(get_level_no(),file_name);
		show_debug_message(global.user_current_level);
		show_debug_message(global.user_completed);
		array_delete(enemy_arr,array_get_index(enemy_arr,file_name),1);
	}
}

if id != global.current_battler_id
	exit;
	
if global.battle {
	if obj_sound_manager.snd_asset != snd_smart_riot {
		_temp_snd = snd_smart_riot;
		set_snd_ingame(snd_smart_riot,120,60);
	}
}
else {
	obj_sound_manager.room_start();
}

if action and keyboard_check_pressed(vk_enter) {
	if keyboard_string != "" {
		ans = array_get_index(assessment[page][OPTIONS],assessment[page][ANSWER]) + 1;
		if string(string_upper(string_trim(keyboard_string))) == string(ans) {
			array_delete(assessment,page,1);
			hp_enemy -= damage_enemy;
		}
		else {
			hp_player -= damage_player;
		}
		cc_que = 0;
		cc_opt = 0;
		keyboard_string = "";
	}
	if array_length(assessment) == 0 {
		page = 0;
		cc_que = 0;
		cc_opt = 0;
		ans = "";
		keyboard_string = "";
		action = false;
		if not (array_length(get_enemy_array()) > check_challenges_remains and check_challenges_remains != 0)
			player_won = true;
	}
}