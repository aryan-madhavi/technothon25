if not place_meeting(x,y,obj_player) {
	text = "";
	action = false;
	exit;
}
	
text = msg;

if keyboard_check_pressed(ord("F"))
	action = !action;

image_index = !action ? 0 : 1;