
image_index = sprite_get_info(sprite_index).num_subimages - .20
image_speed = -1;

instance_create_layer(target_x,target_y,"Instances",obj_aariona);
obj_aariona.room_start();
obj_aariona.face = target_face;
