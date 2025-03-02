array_size = 20;

for (_i = array_size-1; _i >= 0; _i--) {
	pos_x[_i] = x;
	pos_y[_i] = y;	
}

var _ai = instance_create_layer(x,y,"Instances",obj_ai);
_ai.record = array_size-1;
_ai.image_xscale = 1.2;
_ai.image_yscale = 1.2;

if get_level_no() != 0 {
	level_info = instance_create_layer(x+80,y+10,"Text",obj_npc_parent, {dialogue_file: $"level_info.txt"});
	//level_info.dialogue_file = "level_info";
	level_info.x_invert_area = true;
	level_info.image_xscale *= -1;
}
