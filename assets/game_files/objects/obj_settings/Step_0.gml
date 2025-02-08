if global.pause
	exit;

if keyboard_check_pressed(vk_escape) {
	switch room {
		case rm_menu_main:
			exit;
		case rm_menu_email:
		case rm_menu_pass:
			room_goto_previous();
			exit;
		default:
			if instance_exists(obj_aariona) {
				global.pause = true;
				//Update Coords for Pause Menu
				global.last_room = room;
				global.xx = obj_aariona.x;
				global.yy = obj_aariona.y;
				global.face = obj_aariona.face;
				instance_destroy(obj_aariona);
				//object_set_visible(obj_aariona, false);
			}
			room_goto(rm_menu_pause);	
	}
}