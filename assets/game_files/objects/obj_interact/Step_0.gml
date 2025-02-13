
image_index = inside ? 1 : 0;

if not place_meeting(x,y,obj_player) {
	inside = false;
	action = false;
	exit;
}

inside = true;	
prompt = prompt == "" ? msg : prompt;

if keyboard_check_pressed(interact_key)
	action = !action;