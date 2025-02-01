
type = inside ? 2 : 0;
image_index = !action ? type : 1;

if not place_meeting(x,y,obj_player) {
	inside = false;
	action = false;
	exit;
}

inside = true;	
prompt = prompt == "" ? msg : prompt;

if keyboard_check_pressed(ord("F"))
	action = !action;
