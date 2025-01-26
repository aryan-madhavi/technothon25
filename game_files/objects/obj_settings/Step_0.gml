if keyboard_check_pressed(vk_escape) {
	if instance_exists(obj_aariona) {
		instance_destroy(obj_aariona);
	}
	room_goto(rm_menu);
}