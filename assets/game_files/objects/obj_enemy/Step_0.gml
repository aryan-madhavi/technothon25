sprite_index = spr_enemy;

if global.pause {
	path_speed = 0;
	exit;
}

path_speed = 1;

if path_position <= 0 {
	path_start(enemy_path,1,path_action_restart,true);
}

if path_get_point_x(enemy_path,0) != path_get_point_x(enemy_path,1)
	image_xscale *= path_position == 0.5 or path_position == 1 ? -1 : 1;		