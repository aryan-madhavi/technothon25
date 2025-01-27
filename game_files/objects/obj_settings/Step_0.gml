if keyboard_check_pressed(vk_escape) and not instance_exists(obj_pauser) {
	if instance_exists(obj_aariona) {
		instance_destroy(obj_aariona);
	}
	room_goto(rm_menu_pause);
}