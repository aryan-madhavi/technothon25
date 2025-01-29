if not place_meeting(x,y,obj_player) {
	text = "";
	exit;
}
	
text = msg;

if keyboard_check_pressed(ord("F"))
	image_index += 1;