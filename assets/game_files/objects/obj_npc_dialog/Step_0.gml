if creator.area.inside != true	{
	event_user(0);
	exit;
}

if keyboard_check_pressed(vk_space) {
	if page+1 < array_length(text) {
		page++;	
		char_count = 0;
	}
	else 
		event_user(0);
}