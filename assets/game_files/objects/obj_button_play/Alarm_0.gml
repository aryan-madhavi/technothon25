event_inherited();

if not instance_exists(obj_sound_manager)
	instance_create_layer(0,0,"Instances",obj_sound_manager);

keyboard_string = "";
room_goto_next();