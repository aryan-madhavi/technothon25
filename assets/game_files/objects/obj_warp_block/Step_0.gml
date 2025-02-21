//show_debug_message(get_enemy_array());

if place_meeting(x,y,obj_aariona) and not instance_exists(obj_warp) { 
	if array_length(get_enemy_array()) > 0 and target_rm != rm_level_0
		exit;
	event_user(0);
}