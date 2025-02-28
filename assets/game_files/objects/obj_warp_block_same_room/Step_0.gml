//show_debug_message(get_enemy_array());
/*
if prev_room != -1 {
	if array_length(global.levels[prev_room].enemies.files) > 0
		exit;
}*/

if place_meeting(x,y,obj_aariona) /*and not instance_exists(obj_warp)*/ {
	event_user(0);
}