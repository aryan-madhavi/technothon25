event_inherited();

room_goto(global.last_room);
instance_create_layer(global.xx,global.yy,"Instances",obj_aariona);
obj_aariona.face = global.face;

//object_set_visible(obj_aariona,true);