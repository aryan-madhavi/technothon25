if keyboard_check_pressed(vk_space) {
	if page+1 < array_length(text)
		page++;	
	else {
		instance_destroy();
		creator.my_dialog = noone;
		creator.prompt = "Press T to Talk";
	}
}