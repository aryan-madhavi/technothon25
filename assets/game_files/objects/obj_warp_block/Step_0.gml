if place_meeting(x,y,obj_aariona) and not instance_exists(obj_warp) {
	var _inst = instance_create_depth(0,0,-99999,obj_warp);
	_inst.target_rm = target_rm;
	_inst.target_x = target_x;
	_inst.target_y = target_y;
	_inst.target_face = target_face;
}