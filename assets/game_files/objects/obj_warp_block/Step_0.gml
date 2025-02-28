//show_debug_message(get_enemy_array());
/*
if prev_room != -1 {
	if array_length(global.levels[prev_room].enemies.files) > 0
		exit;
}*/

if place_meeting(x,y,obj_aariona) and not instance_exists(obj_warp) { 
	if array_length(get_enemy_array()) > 0 and target_rm != rm_level_0 and target_rm != rm_game
		exit;
	event_user(0);
	show_debug_message(global.levels);
	/*
	a = "challenge1.json challenge2.json";
	arr = string_split(a," ")
	pos = array_get_index(global.levels[3].enemies.files,arr[0])
	array_delete(global.levels[3].enemies.files,pos,1)
	array_delete(global.levels[3].enemies.files,1,1)
	show_debug_message(global.levels[3].enemies.files);*/
}