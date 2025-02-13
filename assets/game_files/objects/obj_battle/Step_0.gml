//show_debug_message(sprite_get_name(enemy_spr));

if global.battle {
	if obj_sound_manager.snd_asset != snd_smart_riot {
		set_snd_ingame(snd_smart_riot,120,60);
	}
}
else {
	obj_sound_manager.room_start();
}
if global.pause and not global.battle
	exit;

event_inherited();

global.pause = action;
global.battle = action;

image_index = inside ? 3 : 2;

if enemy == noone {
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

if keyboard_check_pressed(vk_enter) {
	if page+1 >= array_length(assessment) {
		page = 0;
		cc_que = 0;
		cc_opt = 0;
		keyboard_string = "";
		action = false;
	}
	else if keyboard_string != "" {
		if string_trim(keyboard_string) == assessment[page][ANSWER] {
			page++;
			hp_enemy -= damage_enemy;
		}
		else {
			hp_player -= damage_player;
		}
		cc_que = 0;
		cc_opt = 0;
		keyboard_string = "";
	}
	
}