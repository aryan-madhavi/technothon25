if global.pause
	exit;
	
depth = -bbox_bottom;

if area == noone {
	area = instance_create_layer(x,y,"Instances",obj_interact);
	area.image_xscale *= (x_invert_area ? -1 : 1);
	area.image_yscale *= (y_invert_area ? -1 : 1);
	area.prompt = prompt;
}

if area.inside == true {
	if keyboard_check_pressed(ord("F")) and my_dialog == noone {
		if not read_file {
			event_user(0);
			read_file = true;
		}
		my_dialog = instance_create_layer(area.x,area.y,"Text",obj_npc_dialog);
		prompt = "Press Space to continue";
		area.prompt = prompt;
		my_dialog.name = my_name;
		my_dialog.creator = self;
		my_dialog.text = my_text;
	}
}
