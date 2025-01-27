event_inherited();

//instance_create_depth(0,0,999,obj_player);

room_goto(global.last_room);
instance_create_layer(
	global.xx,
	global.yy,
	"Instances",
	obj_aariona
);
obj_aariona.face = global.face