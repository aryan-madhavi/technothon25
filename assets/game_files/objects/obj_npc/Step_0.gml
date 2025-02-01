
event_inherited();

/*if area == noone {
	area = instance_create_layer(x,y,"Instances",obj_interact);
	area.move_to = true;
}*/

if place_meeting(x,y,obj_player) {
	action = false;
	//inside = false;
	if keyboard_check_pressed(ord("T")) and my_dialog == noone {
		my_dialog = instance_create_layer(x,y,"Text",obj_npc_dialog);
		prompt = "Press Space to continue";
		my_dialog.creator = self;
		my_dialog.text = my_text;
	}
}

depth = -bbox_bottom;