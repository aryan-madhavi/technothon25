//event_inherited();

depth = -bbox_bottom;

if area == noone {
	area = instance_create_layer(x,y,"Instances",obj_interact);
	area.image_xscale *= (x_invert_area ? -1 : 1);
	area.image_yscale *= (y_invert_area ? -1 : 1);
	area.prompt = prompt;
}

if area.inside == true {
	action = false;
	//inside = false;
	if keyboard_check_pressed(ord("T")) and my_dialog == noone {
		my_dialog = instance_create_layer(area.x,area.y,"Text",obj_npc_dialog);
		prompt = "Press Space to continue";
		my_dialog.snd = choose_robot_lang();
		area.prompt = prompt;
		my_dialog.name = my_name;
		my_dialog.creator = self;
		my_dialog.text = my_text;
	}
}
