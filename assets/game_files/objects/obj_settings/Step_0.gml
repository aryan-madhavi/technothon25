if keyboard_check_pressed(vk_escape) and not instance_exists(obj_pauser) {
	if room == rm_menu_pass {
		room_goto_previous();
		exit;
	}
	if room == rm_menu_email {
		room_goto_previous();
		instance_destroy();
		exit;
	}
	if instance_exists(obj_aariona) {
		instance_destroy(obj_aariona);
		//object_set_visible(obj_aariona, false);
	}
	room_goto(rm_menu_pause);
		
}